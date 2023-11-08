import 'dart:convert';
import 'dart:math';

import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talk_of_the_town/Models/audio_task_data.dart';
import 'package:talk_of_the_town/Models/bridge_dart_sdk/bridge_sdk.models.swagger.dart';
import 'package:talk_of_the_town/Models/onboarding_response.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Models/task_payload.dart';
import 'package:talk_of_the_town/main.dart' as main;

/// Setting up and managing a local SQL database for storing tasks and geofences.

const String geofenceTable = 'geofences';
const String dataForUploadTable = 'data_recording';
const String participantTable = 'participants';
const String studyTable = 'studies';
const String scheduledSessionTable = 'scheduledSessions';
const String audioTaskTable = 'audioTasks';
const String activityEventTable = 'studyActivityEvents';
const String appConfigTable = 'appConfigs';
const String uploadIdTable = 'uploadIds';
const String onboardingTable = 'onboardingResponse';

/// Communicates with the phone's internal database.
///
/// Used for storing Participants, Activities/tasks, appConfig, stored data, and
/// anything else that needs to be stored locally on the phone itself.
/// {@category App}
class DatabaseManager {
  static final _databaseName = 'tott_database.db';
  static final _databaseVersion = 1;
  static final _debugDeleteDb = false;

  /// one issue is that we don't want to open a bunch of separate connections to
  /// the database. So, we force this to be a singelton class, that can't have
  /// multiple instances.
  // DatabaseManager._privateConstructor();

  // static final DatabaseManager instance = DatabaseManager._privateConstructor();

  // Here we ensure there is only one connection to the database.
  // this has to be a nullable in order to do the null-check for initialization.
  static Database? _database;

  Future<Database> get database async {
    // if database has not been initialized, initialize it. If it has, return as-is.
    if (_database == null) _database = await _initDatabase();
    return _database as Database; // force non-nullability
  }

  _initDatabase() async {
    // get system documents directory, which is OS-adaptive
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    // debug: For testing databse setup or changing columns, this deletes the existing database first.
    if (_debugDeleteDb) {
      await deleteDatabase(path);
      print("database deleted");
    }

    // The action: open the database, or create it if it does not exist.
    // note oncreate callback, for dealing with its first incarnation.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // the onCreate callback method, which generates the tables the first time the database is made.
  Future _onCreate(Database db, int version) async {
    /// If the database does not exist, then populate it with the relevant tables.

    //the key bit of magic from sqflite is the "db.execute" command.
    // but even better, there's batch, for carrying out multiple commands.
    Batch creation = db.batch();

    // For the geofence table.
    // this actually just stores everything needed to make a geofence object
    // as well as whether the geofence is active and something that defines
    // when it should be made active.
    creation.execute('''
      CREATE TABLE $geofenceTable (
      _id INTEGER PRIMARY KEY,
      identifier TEXT NOT NULL,
      radius REAL NOT NULL,
      latitude REAL NOT NULL,
      longitude REAL NOT NULL,
      notifyOnEntry TEXT NOT NULL,
      notifyOnDwell TEXT NOT NULL,
      notifyOnExit TEXT NOT NULL,
      loiteringDelay REAL NOT NULL,
      extras TEXT,
      active TEXT NOT NULL,
      activation TEXT  
    )''');

    // and again for a table that records data from activities.
    // todo: This is a mix of metadata, necessary upload info, and AdherenceRecord info.
    creation.execute('''
      CREATE TABLE $dataForUploadTable (
      _id INTEGER PRIMARY KEY,
      taskGuid TEXT NOT NULL,
      sessionInstanceGuid TEXT NOT NULL,
      recordingPath TEXT NOT NULL,
      startDate TEXT NOT NULL,
      endDate TEXT NOT NULL,
      deviceTypeIdentifier TEXT NOT NULL,
      dataGroups TEXT NOT NULL,
      appVersion TEXT NOT NULL,
      deviceInfo TEXT NOT NULL,
      participantIds TEXT NOT NULL,
      participantAgeMonths TEXT,
      taskPayload TEXT,
      extraData TEXT
     )''');

    // Table that records info about each of the kids locally to help keep track
    // of info from onboarding without having to pull it from the server every time.
    creation.execute('''
      CREATE TABLE $participantTable (
      _id INTEGER PRIMARY KEY,
      anonId TEXT NOT NULL,
      ageMonths INT NOT NULL,
      gender TEXT NOT NULL,
      validTimes TEXT NOT NULL,
      anonymized TEXT NOT NULL,
      nickname TEXT,
      DOB TEXT,
      projectStatuses TEXT
    )''');

    // Studies as pulled from Bridge
    //
    creation.execute('''
      CREATE TABLE $studyTable (
      _id INTEGER PRIMARY KEY,
      identifier TEXT NOT NULL,
      minAge INTEGER NOT NULL,
      maxAge INTEGER NOT NULL,
      status TEXT NOT NULL,
      timelineData TEXT NOT NULL,
      timelineUpdated TEXT NOT NULL
    )''');

    // Sessions, including triggers based on StudyActivityEvents
    creation.execute('''
      CREATE TABLE $scheduledSessionTable (
      _id INTEGER PRIMARY KEY,
      refGuid TEXT NOT NULL,
      instanceGuid TEXT NOT NULL,
      startEventId TEXT,
      startDay INTEGER,
      endDay INTEGER,
      startTime TEXT,
      delayTime TEXT,
      assessments TEXT NOT NULL      
    )''');

    // TaskPayload objects, used to track all tasks and their status.
    creation.execute('''
      CREATE TABLE $audioTaskTable (
      _id INTEGER PRIMARY KEY,
      guid TEXT NOT NULL,
      instanceID TEXT NOT NULL,
      taskName TEXT NOT NULL,
      geofences TEXT NOT NULL,
      minAge INTEGER NOT NULL,
      maxAge INTEGER NOT NULL,
      taskText TEXT NOT NULL,
      endTaskQ TEXT NOT NULL,
      endTaskQContent TEXT,
      participants TEXT,
      status TEXT,
      notificationBased TEXT,
      notificationDateTime TEXT,
      triggerCustomEvent TEXT
    )''');

    // Table that just has a list of all the StudyActivityEvents that have triggered.
    creation.execute('''
      CREATE TABLE $activityEventTable (
      _id INTEGER PRIMARY KEY,
      eventId TEXT NOT NULL,
      timestamp TEXT NOT NULL,
      uploaded TEXT NOT NULL
    )''');

    // The appConfig table mostly checks versions, if there is an update, pull
    // that, but the actual content we can parse and store separately (e.g.,
    // audioTasks).
    creation.execute('''
      CREATE TABLE $appConfigTable (
      _id INTEGER PRIMARY KEY,
      label STRING NOT NULL,
      createdOn STRING NOT NULL,
      modifiedOn STRING NOT NULL,
      guid STRING NOT NULL,
      version INTEGER
    )''');

    // A table for upload IDs, tracking whether they are live or not.
    creation.execute('''
       CREATE TABLE $uploadIdTable (
       _id INTEGER PRIMARY KEY,
       uploadId STRING NOT NULL,
       url STRING NOT NULL,
       name STRING NOT NULL,
       contentLength STRING NOT NULL,
       contentMd5 STRING NOT NULL 
    )''');

    // Table for storing complete OnboardingData object.
    // added as a safety since there seem to be situations where it fails to upload/update properly
    // and therefore is removed from the server. Permanent(ish) storage.
    /* List<Participant> participants;
  String famIncome;
  String education;
  List<String> languages;
  DateTime timestamp;*/
    creation.execute('''
      CREATE TABLE $onboardingTable (
      _id INTEGER PRIMARY KEY,
      participants TEXT NOT NULL,
      famIncome TEXT NOT NULL,
      education TEXT NOT NULL,
      languages TEXT NOT NULL,
      timestamp TEXT NOT NULL
    )''');

    // with all the commands queued up, let it rip!
    List outcome = await creation.commit();
    // note: Might need to revert to separate calls due to particular circumstances of onCreate, if we ever want to update what tables are in the app
  }

  Future<int> insertData(AudioTaskData recordedData) async {
    Database db = await database;
    Map<String, Object?> forUpload = recordedData.toJson();
    // data now contains a few fields that need to be re-parsed.
    forUpload['extraData'] = jsonEncode(forUpload['extraData']);
    TaskPayload? tempPayload = recordedData.taskPayload;
    if (tempPayload != null) {
      String encodedPayload = jsonEncode(tempPayload.toMap());
      forUpload['taskPayload'] = encodedPayload;
    }
    forUpload['participantAgeMonths'] =
        jsonEncode(forUpload['participantAgeMonths']);
    forUpload['participantIds'] = jsonEncode(forUpload['participantIds']);

    print("xyz forupload length: ${forUpload.toString().length}");
    print("xyz forupload: ${forUpload.toString()}");
    for (int i = 0; i < forUpload.toString().length; i += 100) {
      print(
          "xyz forupload: ${forUpload.toString().substring(i, min(i + 100, forUpload.toString().length))}");
    }
    int id = await db.insert(dataForUploadTable, forUpload);
    return id;
  }

  Future<List<AudioTaskData>> getCompletedData() async {
    Database db = await database;
    List<Map<String, dynamic>> dataAwaitingUpload =
        await db.query(dataForUploadTable, distinct: true);
    List<AudioTaskData> parsedData = [];
    dataAwaitingUpload.forEach((element) {
      // this slightly odd creation brought to you by weird object encoding.
      AudioTaskData tempData = AudioTaskData.fromDatabase(element);
      parsedData.add(tempData);
    });
    return parsedData;
  }

  Future<int> deleteCompletedData(String sessionInstanceGuid) async {
    // Something that will ONLY be called when stuff is fully uploaded and the
    // upload has been verified.
    Database db = await database;
    int deletedCount = await db.delete(dataForUploadTable,
        where: 'sessionInstanceGuid = ?', whereArgs: [sessionInstanceGuid]);
    return deletedCount;
  }

  /// Adds a geofence to the table of geofences. The actual activation of the geofence happens in activateGeofence.
  Future<int> addGeofence(bg.Geofence geofence, bool active,
      {String activation = ''}) async {
    Database db = await database;
    // The geofence object helps us out a lot here.
    Map<String, dynamic> fullEntry = geofence.toMap();
    fullEntry['extras'] = jsonEncode(fullEntry['extras']); // necessary
    // notifyOnEntry, Dwell and Exit are bools that will need to be converted to text.
    fullEntry['notifyOnEntry'] = fullEntry['notifyOnEntry'].toString();
    fullEntry['notifyOnExit'] = fullEntry['notifyOnExit'].toString();
    fullEntry['notifyOnDwell'] = fullEntry['notifyOnDwell'].toString();
    fullEntry['active'] = active.toString();
    fullEntry['activation'] = activation;
    int inserted = await db.insert(geofenceTable, fullEntry);
    return inserted;
  }

  /// Retrieves and activates a geofence, that is, adds the geofence to the backgroundgeolocation system and updates the table accordingly.
  Future<int> activateGeofence(String identifier,
      {TaskPayload? payload}) async {
    int rowsUpdated = 0;
    Database db = await database;
    var geofenceEntry = await db
        .query(geofenceTable, where: 'identifier = ?', whereArgs: [identifier]);
    Map<String, dynamic> targetGeofence = geofenceEntry[0];
    // now that we have the geofence, we need to turn it into an actual geofence.
    // The retrieved arguments should be largely intact, except extras.
    // Extras is the part of the geofence object that stores a reference to the TaskPayload,
    // but also directly stores info about a participant's availability, and notification text.
    bg.BackgroundGeolocation.addGeofence(bg.Geofence(
            identifier: targetGeofence['identifier'],
            radius: targetGeofence['radius'],
            latitude: targetGeofence['latitude'],
            longitude: targetGeofence['longitude'],
            notifyOnEntry: targetGeofence['notifyOnEntry'] == 'true',
            notifyOnDwell: targetGeofence['notifyOnDwell'] == 'true',
            notifyOnExit: targetGeofence['notifyOnExit'] == 'true',
            loiteringDelay: targetGeofence['loiteringDelay'].toInt(),
            extras: payload == null
                ? jsonDecode(targetGeofence['extras'])
                : payload.toGeofencePayload()))
        .then((bool success) async {
      print(
          "Geofence $identifier activated successfully, updating database"); // debug
      // a copy that is more easily modifiable than the one originally extracted
      Map<String, Object?> copyGeofence =
          Map<String, Object?>.from(targetGeofence);
      copyGeofence['active'] = true.toString();
      //targetGeofence['active'] = 'true';
      String serialID = targetGeofence['_id'].toString();
      rowsUpdated = await db.update(geofenceTable, copyGeofence,
          where: '_id = $serialID');
    }).catchError((error) {
      print("Geofence activation unsuccessful: $error");
    });
    return rowsUpdated;
  }

  /// Deactivates geofence, when no longer needed, but retains in DB.
  Future<int> deactivateGeofence(String identifier) async {
    int rowsUpdated = 0;
    Database db = await database;
    bg.BackgroundGeolocation.removeGeofence(identifier)
        .then((bool success) async {
      print("Geofence $identifier deactiavted, updating database"); // debug
      var geofenceEntry = await db.query(geofenceTable,
          where: 'identifier = ?', whereArgs: [identifier]);
      Map<String, dynamic> currentGeofence = geofenceEntry.first;
      Map<String, dynamic> copyGeofence = currentGeofence;
      copyGeofence['active'] = false.toString();
      String serialID = currentGeofence['_id'].toString();
      rowsUpdated = await db.update(geofenceTable, copyGeofence,
          where: '_id = $serialID');
    }).catchError((error) {
      print("Geofence deactivation failed: $error");
    });

    return rowsUpdated;
  }

  /// Retrieve a specific geofence from the database.
  Future<Map<String, dynamic>?> getGeoFence(String identifier) async {
    Database db = await database;
    List<Map<String, dynamic>> geofences = await db
        .query(geofenceTable, where: 'identifier = ?', whereArgs: [identifier]);
    if (geofences.length > 0) {
      return geofences.first;
    } else {
      return null;
    }
  }

  ///Get a list of all the geofences in the table.
  Future<List<Map>> getAllGeofences() async {
    Database db = await database;
    List<Map> geofences = await db.query(geofenceTable); // get everything
    return geofences;
  }

  /// Adds an upload ID to the database for tracking ongoing upload sessions.
  Future<int> addUploadId(String uploadId, String url, String name,
      String length, String md5) async {
    Database db = await database;
    Map<String, dynamic> newIds = {
      'uploadId': uploadId,
      'url': url,
      'name': name,
      'contentLength': length,
      'contentMd5': md5
    };
    return await db.insert(uploadIdTable, newIds);
  }

  /// Retrieves all existing upload sessions.
  Future<List> getAllUploadIds() async {
    Database db = await database;
    List uploadIds = await db.query(uploadIdTable);
    return uploadIds;
  }

  /// Removes an upload session from the internal database
  Future<int> deleteUploadId(String uploadId) async {
    Database db = await database;
    int deletedCount = await db
        .delete(uploadIdTable, where: 'uploadId = ?', whereArgs: [uploadId]);
    return deletedCount;
  }

  /// A debug function that wipes all stored upload sessions
  Future<int> deleteAllUploadIds() async {
    Database db = await database;
    int deletedCount = await db.delete(uploadIdTable);
    return deletedCount;
  }

  /// Get the list of all the participants stored in the database
  Future<List<Participant>> getAllParticipants() async {
    Database db = await database;
    List unparsed = await db.query(participantTable);
    // parse the list as Participants
    List<Participant> parsed =
        unparsed.map((item) => Participant.fromJson(item)).toList();
    return parsed;
  }

  /// Get a specific participant. Specify which field to query from, and value.
  ///
  /// Most queries should use to be anonId or nickname, but can also be used to
  /// find all participants of a specific age from the database if needed.
  Future<Participant?> getParticipant(
      String queryField, String queryText) async {
    Database db = await database;
    List foundParticipants = await db.query(participantTable,
        where: '$queryField = ?', whereArgs: [queryText]);
    if (foundParticipants.length == 0) {
      return null;
    } else {
      // Parse the Map back into a Participant object
      return Participant.fromJson(foundParticipants.first);
    }
  }

  /// add a participant, only used on initial onboarding.
  Future<int> addParticipant(Participant participant) async {
    Database db = await database;

    Map<String, dynamic> newParticipant = participant.toMap();
    // database needs bools as strings.
    newParticipant['anonymized'] = newParticipant['anonymized'].toString();

    return await db.insert(participantTable, newParticipant);
  }

  /// update a participant record, matched by anonId.
  Future<int> updateParticipantRecord(Participant participant) async {
    Database db = await database;

    Map<String, dynamic> updatingParticipant = participant.toMap();
    updatingParticipant['anonymized'] =
        updatingParticipant['anonymized'].toString();
    // first check if this is valid, i.e. if there is a record with that anonId. Otherwise insert.
    Participant? existingRecord =
        await getParticipant('anonId', participant.anonId);

    if (existingRecord == null) {
      return await addParticipant(participant);
    } else {
      return await db.update(participantTable, updatingParticipant,
          where: 'anonId = ?', whereArgs: [participant.anonId]);
    }
  }

  // Functions for onboarding storage and updating

  Future<OnboardingResponse?> getOnboarding() async {
    Database db = await database;
    List<Map<String, dynamic>> onboardings = await db.query(onboardingTable);
    if (onboardings.isNotEmpty) {
      return OnboardingResponse.fromJson(onboardings.first);
    } else {
      return null;
    }
  }

  /// Store an onboarding response.
  ///
  /// Add or update, there is always only one.
  Future<int> storeOnboarding(OnboardingResponse response) async {
    Database db = await database;

    Map<String, dynamic> json = response.toMap();
    OnboardingResponse? checkOnboarding = await getOnboarding();
    if (checkOnboarding == null) {
      // add rather than overwrite. Really should only happen once.
      return await db.insert(onboardingTable,
          json); // TODO: THis format is apparently not working w/the internal DB
    } else {
      // update in this case just overwrites the first one.
      return await db.update(onboardingTable, json);
    }
  }

  // Functions for studies and timelines.

  /// Get all studies stored in the internal database
  Future<List> getAllStudies() async {
    Database db = await database;
    List<Map> studies = await db.query(studyTable);
    return studies;
  }

  /// Adds a study, including date last retrieved.
  Future<int> addStudy(Map<String, Object> studyInfo) async {
    Database db = await database;
    return await db.insert(studyTable, studyInfo);
  }

  /// Get a specific study by identifier
  Future<Map<String, Object?>> getStudy(String identifier) async {
    Database db = await database;
    List<Map<String, Object?>> studies = await db
        .query(studyTable, where: 'identifier = ?', whereArgs: [identifier]);
    print("studies[0]");
    print(studies[0].runtimeType);

    return studies.isNotEmpty ? studies[0] : {};
  }

  /// Updates the timestamp, and just the timestamp, for the timeline of a specified study
  Future<int> updateTimelineDatestamp(
      String identifier, DateTime newTime) async {
    Database db = await database;
    // first retrieve the existing record.
    Map<String, Object?> existingStudy = await getStudy(identifier);
    // the map returned by getStudy is a non-editable object, so we clone it.
    Map<String, Object> updatedStudy = Map.from(existingStudy);

    // simply replace the timestamp in this map, and send it back.
    updatedStudy['timelineUpdated'] = newTime.toIso8601String();

    return await db.update(studyTable, updatedStudy,
        where: 'identifier = ?', whereArgs: [identifier]);
  }

  /// Retrieves all app configs.
  Future<List> getAllAppConfigs() async {
    Database db = await database;
    List<Map> appConfigs = await db.query(appConfigTable);
    return appConfigs;
  }

  /// Retrieves the most recent app config in the database, or gets one by id.
  Future<Map> getAppConfig({int? id}) async {
    // given an id, get the relevant app config entry.
    Database db = await database;
    List appConfigs = [];
    if (id != null) {
      appConfigs =
          await db.query(appConfigTable, where: '_id = ', whereArgs: ['$id']);
      return appConfigs.first;
    } else {
      // if we weren't given an ID, just get the most recent one.
      appConfigs = await db.query(appConfigTable);
      return appConfigs.last;
    }
  }

  /// Add the newest AppConfig to the database.
  Future<int> addAppConfig(AppConfig appConfig) async {
    print("app config");
    print(appConfig.toJson());
    Database db = await database;
    String createdOn = appConfig.createdOn!
        .toIso8601String(); // todo: Watch null-safety on these.
    String modifiedOn = appConfig.modifiedOn!.toIso8601String();

    Map<String, dynamic> configFieldsToStore = {
      'label': appConfig.label,
      'createdOn': createdOn,
      'modifiedOn': modifiedOn,
      'guid': appConfig.guid,
      'version': appConfig.version
    };

    return await db.insert(appConfigTable, configFieldsToStore);
  }

  /// Get list of all ScheduledSessions.
  Future<List<ScheduledSession>> getAllScheduledSessions() async {
    Database db = await database;
    List<Map> allSessionsRaw = await db.query(scheduledSessionTable);
    // convert to session objects.
    List<ScheduledSession> allSessions = [];
    allSessionsRaw.forEach((element) {
      // the format of these things is a map we can convert into a scheduled session object.
      // the catch is the assessmentlist, which are maps unto themselves.
      List<Map> assessmentsRaw =
          List<Map>.from(jsonDecode(element['assessments']));
      List<ScheduledAssessment> assessments = [];
      assessmentsRaw.forEach((item) {
        ScheduledAssessment tempAssessment = ScheduledAssessment(
            refKey: item['refKey'],
            instanceGuid: item['instanceGuid'] ?? null,
            type: 'ScheduledAssessment');
        assessments.add(tempAssessment);
      });
      ScheduledSession tempSession = ScheduledSession(
          refGuid: element['refGuid'],
          instanceGuid: element['instanceGuid'],
          startEventId: element['startEventId'] ?? null,
          startDay: element['startDay'] ?? 0,
          endDay: element['endDay'] ?? null,
          startTime: element['startTime'] ?? null,
          delayTime: element['endTime'] ?? null,
          assessments: assessments);
      allSessions.add(tempSession);
    });
    return allSessions;
  }

  /// Gets a specific scheduled session by one of two criteria
  ///
  /// used for pulling info about the next session when an event is triggered, mostly
  Future<ScheduledSession?> getSpecificScheduledSession(
      {String? startEventId, String? instanceGuid}) async {
    Database db = await database;
    // build the proper query string and arguments
    String whereString = '';
    List<String> whereArgs = [];
    if (startEventId != null) {
      whereString = whereString + 'startEventId = ?';
      whereArgs.add(startEventId);
    }
    if (instanceGuid != null) {
      if (whereString.length > 0) {
        whereString = whereString + ' AND ';
      }
      whereString = whereString + 'instanceGuid = ?';
      whereArgs.add(instanceGuid);
    }
    List<Map> specificSessions = await db.query(scheduledSessionTable,
        where: whereString, whereArgs: whereArgs);
    // fail to find
    if (specificSessions.length == 0) {
      return null;
    }

    // pull last item from list and process into a scheduled session.
    Map lastSessionRaw = specificSessions.last;
    List<ScheduledAssessment> schedAssessments = [];
    List<Map> rawAssessments =
        List<Map>.from(jsonDecode(lastSessionRaw['assessments']));
    rawAssessments.forEach((item) {
      ScheduledAssessment tempAssessment = ScheduledAssessment(
          refKey: item['refKey'],
          instanceGuid: item['instanceGuid'] ?? null,
          type: 'ScheduledAssessment');
      schedAssessments.add(tempAssessment);
    });
    return ScheduledSession(
        refGuid: lastSessionRaw['refGuid'],
        instanceGuid: lastSessionRaw['instanceGuid'],
        startEventId: lastSessionRaw['startEventId'] ?? null,
        startDay: lastSessionRaw['startDay'] ?? 0,
        endDay: lastSessionRaw['endDay'] ?? null,
        startTime: lastSessionRaw['startTime'] ?? null,
        delayTime: lastSessionRaw['endTime'] ?? null,
        assessments: schedAssessments);
  }

  /// Adds a scheduled session to the database.
  Future<int> addScheduledSession(ScheduledSession scheduledSession) async {
    Database db = await database;
    Map<String, Object?> parsedSession = scheduledSession.toJson();
    // potential issues with the assessments, need to encode them prior to saving.
    //parsedSession['assessments'] = jsonEncode(parsedSession['assessments']);
    Map<String, Object?> databaseFields = {
      'refGuid': parsedSession['refGuid'],
      'instanceGuid': parsedSession['instanceGuid'],
      'startEventId': parsedSession['startEventId'] ?? null,
      'startDay': parsedSession['startDay'] ?? 0,
      'endDay': parsedSession['endDay'] ?? null,
      'startTime': parsedSession['startTime'] ?? null,
      'delayTime': parsedSession['endTime'] ?? null,
      'assessments': jsonEncode(parsedSession['assessments'])
    };
    return await db.insert(scheduledSessionTable, databaseFields,
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  /// Deletes a specific session. Should be used very rarely, but just in case.
  Future<int> deleteScheduledSession(String instanceGuid) async {
    Database db = await database;
    return await db.delete(scheduledSessionTable,
        where: 'instanceGuid = ?', whereArgs: [instanceGuid]);
  }

  /// Gets EVERY stored TaskPayload in the database
  Future<List<TaskPayload>> getAllTaskPayloads() async {
    Database db = await database;
    List<TaskPayload> allTasks = [];
    List<Map> allTasksRaw = await db.query(audioTaskTable);
    allTasksRaw.forEach((element) {
      // geofences is a complex field
      List geofences = jsonDecode(element['geofences']);
      Map<String, dynamic> tempMap = element.cast<String, dynamic>();
      tempMap['geofences'] = geofences;
      TaskPayload tempPayload = TaskPayload.fromJson(tempMap);
      allTasks.add(tempPayload);
    });
    return allTasks;
  }

  /// Gets all the payloads associated with a specific assessment type (may have multiple instances)
  Future<List<TaskPayload>> getTaskPayloadOfType(String id) async {
    // this is essentially a clone of the get all function with a modified query
    Database db = await database;
    List<TaskPayload> allTasks = [];
    List<Map> allTasksRaw =
        await db.query(audioTaskTable, where: 'guid = ?', whereArgs: [id]);
    allTasksRaw.forEach((element) {
      // geofences is a complex field
      List geofences = jsonDecode(element['geofences']);
      Map<String, dynamic> tempMap = element.cast<String, dynamic>();
      tempMap['geofences'] = geofences;
      TaskPayload tempPayload = TaskPayload.fromJson(tempMap);
      allTasks.add(tempPayload);
    });
    return allTasks;
  }

  /// Gets a specific TaskPayload object.
  Future<TaskPayload?> getTaskPayloadInstance(String instanceId) async {
    Database db = await database;
    List<Map> allTasksRaw = await db.query(audioTaskTable,
        where: 'instanceId = ?', whereArgs: [instanceId]);
    if (allTasksRaw.length == 0) {
      return null;
    }
    Map<String, dynamic> tempMap = Map<String, dynamic>.from(allTasksRaw.last);
    List<String> geofences =
        List<String>.from(jsonDecode(allTasksRaw.last['geofences']));
    tempMap['geofences'] = geofences;
    tempMap['endTaskQ'] = tempMap['endTaskQ'] == "true";
    // there are two optional pieces of content that might need decoding: participants and endtaskqcontent
    if (tempMap['endTaskQ']) {
      tempMap['endTaskQContent'] = jsonDecode(tempMap['endTaskQContent']);
    }
    if (tempMap.containsKey('participants')) {
      List<Map> encodedParticipants =
          List<Map>.from(jsonDecode(tempMap['participants']));
      tempMap['participants'] = encodedParticipants;
    }
    return TaskPayload.fromJson(tempMap);
  }

  /// Adds a new TaskPayload object to the database.
  Future<int> addTaskPayload(TaskPayload payload) async {
    Database db = await database;
    // the geofences are the only slightly tricky part to this
    Map<String, Object?> payloadMap = payload.toMap();
    payloadMap['geofences'] = jsonEncode(payloadMap['geofences']);
    payloadMap['endTaskQ'] = payloadMap['endTaskQ'].toString();
    if (payload.endTaskQContent != null) {
      payloadMap['endTaskQContent'] = jsonEncode(payloadMap['endTaskQContent']);
    }
    if (payload.participants != null) {
      List<Map> particMaps = [];
      payload.participants?.forEach((element) {
        particMaps.add(element.toMap());
      });
      payloadMap['participants'] = jsonEncode(particMaps);
    }
    return await db.insert(audioTaskTable, payloadMap);
  }

  /// Updates a specific payload in the database, primarily useful for status updates.
  Future<int> updateTaskPayload(TaskPayload payload) async {
    Database db = await database;
    // the geofences are the only slightly tricky part to this
    Map<String, Object?> payloadMap = payload.toMap();
    payloadMap['geofences'] = jsonEncode(payloadMap['geofences']);
    payloadMap['endTaskQ'] = payloadMap['endTaskQ'].toString();
    if (payload.endTaskQContent != null) {
      payloadMap['endTaskQContent'] = jsonEncode(payloadMap['endTaskQContent']);
    }
    if (payload.participants != null) {
      List<Map> particMaps = [];
      payload.participants?.forEach((element) {
        particMaps.add(element.toMap());
      });
      payloadMap['participants'] = jsonEncode(particMaps);
    }
    return await db.update(audioTaskTable, payloadMap,
        where: 'instanceId = ?', whereArgs: [payload.instanceId]);
  }

  /// Retrieves a list of ALL StudyActivityEvents in the database.
  Future<List<StudyActivityEvent>> getAllStudyActivityEvents() async {
    // these are exceedingly simple objects.
    Database db = await database;
    List<Map> allStudyActivityEventsRaw = await db.query(activityEventTable);
    List<StudyActivityEvent> studyActivityEvents = [];
    allStudyActivityEventsRaw.forEach((element) {
      StudyActivityEvent tempEvent = StudyActivityEvent(
          eventId: element['eventId'],
          timestamp: DateTime.parse(element['timestamp']));
      studyActivityEvents.add(tempEvent);
    });
    return studyActivityEvents;
  }

  /// A function that specifically grabs StudyActivityEvents that have not been sent to the server
  Future<List<StudyActivityEvent>> getUnuploadedStudyActivityEvents() async {
    Database db = await database;
    List<Map> rawStudyActivityEvents = await db
        .query(activityEventTable, where: 'uploaded = ?', whereArgs: ["false"]);
    List<StudyActivityEvent> toUpload = [];
    rawStudyActivityEvents.forEach((element) {
      StudyActivityEvent tempEvent = StudyActivityEvent(
          eventId: element['eventId'],
          timestamp: DateTime.parse(element['timestamp']));
      toUpload.add(tempEvent);
    });
    return toUpload;
  }

  /// Gets all instances of a particular StudyActivityEvent
  Future<List<StudyActivityEvent>> getLastStudyActivityEvent(
      String eventId) async {
    Database db = await database;
    List<Map> allStudyActivityEventsRaw = await db
        .query(activityEventTable, where: 'eventId = ?', whereArgs: [eventId]);
    List<StudyActivityEvent> allEventsOfType = [];
    allStudyActivityEventsRaw.forEach((element) {
      StudyActivityEvent tempEvent = StudyActivityEvent(
          eventId: element['eventId'],
          timestamp: DateTime.parse(element['timestamp']));
      allEventsOfType.add(tempEvent);
    });
    return allEventsOfType;
  }

  /// Adds a new StudyActivityEvent entry
  Future<int> addStudyActivityEvent(StudyActivityEvent event,
      {bool? uploaded = true}) async {
    Database db = await database;
    Map<String, Object?> justFields = {
      'eventId': event.eventId,
      'timestamp': event.timestamp!.toIso8601String(),
      'uploaded': uploaded.toString()
    };

    return await db.insert(activityEventTable, justFields);
  }

  /// Deletes a StudyActivityEvent from the table by matching BOTH timestamp AND id.
  Future<int> deleteStudyActivityEvent(StudyActivityEvent event) async {
    Database db = await database;
    return await db.delete(activityEventTable,
        where: 'eventId = ? AND timestamp = ?',
        whereArgs: [event.eventId, event.timestamp!.toIso8601String()]);
  }

  /// Updates a StudyActivityEvent by eventId
  Future<int> updateStudyActivityEvent(StudyActivityEvent event,
      {bool? uploaded = true}) async {
    Database db = await database;
    Map<String, Object?> justFields = {
      'eventId': event.eventId,
      'timestamp': event.timestamp!.toIso8601String(),
      'uploaded': uploaded.toString()
    };
    return await db.update(activityEventTable, justFields,
        where: 'eventId = ?', whereArgs: [event.eventId]);
  }

  /// Updates OR checks a StudyActivityEvent, used for updates from the server.
  Future<int> updateAllStudyActivityEvents(
      StudyActivityEventList eventList) async {
    Database db = await database;
    List<StudyActivityEvent> existingList = eventList.items!;
    int addUpdateCounter = 0;
    existingList.forEach((element) async {
      List<StudyActivityEvent> doesItExist =
          await getLastStudyActivityEvent(element.eventId!);
      if (doesItExist.length > 0) {
        if (doesItExist.last.timestamp!.isAtSameMomentAs(element.timestamp!) ==
            false) {
          int temp = await updateStudyActivityEvent(element);
          addUpdateCounter += temp;
        }
      } else {
        int temp = await addStudyActivityEvent(element);
        addUpdateCounter += temp;
      }
    });
    return addUpdateCounter;
  }
}
