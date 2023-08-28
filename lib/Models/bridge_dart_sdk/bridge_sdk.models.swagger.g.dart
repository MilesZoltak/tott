// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_sdk.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ABTestGroup _$ABTestGroupFromJson(Map<String, dynamic> json) {
  return ABTestGroup(
    percentage: json['percentage'] as int?,
    schedule: json['schedule'] == null
        ? null
        : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ABTestGroupToJson(ABTestGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('percentage', instance.percentage);
  writeNotNull('schedule', instance.schedule?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ABTestScheduleStrategy _$ABTestScheduleStrategyFromJson(
    Map<String, dynamic> json) {
  return ABTestScheduleStrategy(
    scheduleGroups: (json['scheduleGroups'] as List<dynamic>?)
            ?.map((e) => ABTestGroup.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ABTestScheduleStrategyToJson(
    ABTestScheduleStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scheduleGroups',
      instance.scheduleGroups?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

AbstractStudyParticipant _$AbstractStudyParticipantFromJson(
    Map<String, dynamic> json) {
  return AbstractStudyParticipant(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    synapseUserId: json['synapseUserId'] as String?,
    id: json['id'] as String?,
    notifyByEmail: json['notifyByEmail'] as bool? ?? true,
    attributes: json['attributes'] as Map<String, dynamic>?,
    sharingScope: sharingScopeFromJson(json['sharingScope']),
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    emailVerified: json['emailVerified'] as bool?,
    phoneVerified: json['phoneVerified'] as bool?,
    status: accountStatusFromJson(json['status']),
    roles: roleListFromJson(json['roles'] as List?),
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    clientData: json['clientData'] as Map<String, dynamic>?,
    languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    externalIds: json['externalIds'] as Map<String, dynamic>?,
    orgMembership: json['orgMembership'] as String?,
    note: json['note'] as String?,
    clientTimeZone: json['clientTimeZone'] as String?,
  );
}

Map<String, dynamic> _$AbstractStudyParticipantToJson(
    AbstractStudyParticipant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('synapseUserId', instance.synapseUserId);
  writeNotNull('id', instance.id);
  writeNotNull('notifyByEmail', instance.notifyByEmail);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('sharingScope', sharingScopeToJson(instance.sharingScope));
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('emailVerified', instance.emailVerified);
  writeNotNull('phoneVerified', instance.phoneVerified);
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('roles', roleListToJson(instance.roles));
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('clientData', instance.clientData);
  writeNotNull('languages', instance.languages);
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('externalIds', instance.externalIds);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('note', instance.note);
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  return val;
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    synapseUserId: json['synapseUserId'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    password: json['password'] as String?,
    attributes: json['attributes'] as Map<String, dynamic>?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    emailVerified: json['emailVerified'] as bool?,
    phoneVerified: json['phoneVerified'] as bool?,
    status: accountStatusFromJson(json['status']),
    roles: roleListFromJson(json['roles'] as List?),
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    clientData: json['clientData'] as Map<String, dynamic>?,
    languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    orgMembership: json['orgMembership'] as String?,
    type: json['type'] as String?,
    note: json['note'] as String?,
    clientTimeZone: json['clientTimeZone'] as String?,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('synapseUserId', instance.synapseUserId);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('password', instance.password);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('emailVerified', instance.emailVerified);
  writeNotNull('phoneVerified', instance.phoneVerified);
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('roles', roleListToJson(instance.roles));
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('clientData', instance.clientData);
  writeNotNull('languages', instance.languages);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('type', instance.type);
  writeNotNull('note', instance.note);
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  return val;
}

AccountRef _$AccountRefFromJson(Map<String, dynamic> json) {
  return AccountRef(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    synapseUserId: json['synapseUserId'] as String?,
    identifier: json['identifier'] as String?,
    orgMembership: json['orgMembership'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AccountRefToJson(AccountRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('synapseUserId', instance.synapseUserId);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

AccountSummary _$AccountSummaryFromJson(Map<String, dynamic> json) {
  return AccountSummary(
    appId: json['appId'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    id: json['id'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    status: accountStatusFromJson(json['status']),
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    externalIds: json['externalIds'] as Map<String, dynamic>?,
    synapseUserId: json['synapseUserId'] as String?,
    attributes: json['attributes'] as Map<String, dynamic>?,
    orgMembership: json['orgMembership'] as String?,
    roles: roleListFromJson(json['roles'] as List?),
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    note: json['note'] as String?,
    clientTimeZone: json['clientTimeZone'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AccountSummaryToJson(AccountSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('id', instance.id);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('externalIds', instance.externalIds);
  writeNotNull('synapseUserId', instance.synapseUserId);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('roles', roleListToJson(instance.roles));
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('note', instance.note);
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  writeNotNull('type', instance.type);
  return val;
}

AccountSummarySearch _$AccountSummarySearchFromJson(Map<String, dynamic> json) {
  return AccountSummarySearch(
    pageSize: json['pageSize'] as int?,
    offsetBy: json['offsetBy'] as int?,
    emailFilter: json['emailFilter'] as String?,
    phoneFilter: json['phoneFilter'] as String?,
    allOfGroups: (json['allOfGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    noneOfGroups: (json['noneOfGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    language: json['language'] as String?,
    startTime: json['startTime'] == null
        ? null
        : DateTime.parse(json['startTime'] as String),
    endTime: json['endTime'] == null
        ? null
        : DateTime.parse(json['endTime'] as String),
    orgMembership: json['orgMembership'] as String?,
    adminOnly: json['adminOnly'] as bool?,
    enrolledInStudyId: json['enrolledInStudyId'] as String?,
    externalIdFilter: json['externalIdFilter'] as String?,
    status: accountStatusFromJson(json['status']),
    enrollment: enrollmentFilterFromJson(json['enrollment']),
    attributeKey: json['attributeKey'] as String?,
    attributeValueFilter: json['attributeValueFilter'] as String?,
    predicate: searchTermPredicateFromJson(json['predicate']),
    stringSearchPosition:
        stringSearchPositionFromJson(json['stringSearchPosition']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AccountSummarySearchToJson(
    AccountSummarySearch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('offsetBy', instance.offsetBy);
  writeNotNull('emailFilter', instance.emailFilter);
  writeNotNull('phoneFilter', instance.phoneFilter);
  writeNotNull('allOfGroups', instance.allOfGroups);
  writeNotNull('noneOfGroups', instance.noneOfGroups);
  writeNotNull('language', instance.language);
  writeNotNull('startTime', instance.startTime?.toIso8601String());
  writeNotNull('endTime', instance.endTime?.toIso8601String());
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('adminOnly', instance.adminOnly);
  writeNotNull('enrolledInStudyId', instance.enrolledInStudyId);
  writeNotNull('externalIdFilter', instance.externalIdFilter);
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('enrollment', enrollmentFilterToJson(instance.enrollment));
  writeNotNull('attributeKey', instance.attributeKey);
  writeNotNull('attributeValueFilter', instance.attributeValueFilter);
  writeNotNull('predicate', searchTermPredicateToJson(instance.predicate));
  writeNotNull('stringSearchPosition',
      stringSearchPositionToJson(instance.stringSearchPosition));
  writeNotNull('type', instance.type);
  return val;
}

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    label: json['label'] as String?,
    labelDetail: json['labelDetail'] as String?,
    guid: json['guid'] as String?,
    compoundActivity: json['compoundActivity'] == null
        ? null
        : CompoundActivity.fromJson(
            json['compoundActivity'] as Map<String, dynamic>),
    task: json['task'] == null
        ? null
        : TaskReference.fromJson(json['task'] as Map<String, dynamic>),
    survey: json['survey'] == null
        ? null
        : SurveyReference.fromJson(json['survey'] as Map<String, dynamic>),
    activityType: activityTypeFromJson(json['activityType']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  writeNotNull('labelDetail', instance.labelDetail);
  writeNotNull('guid', instance.guid);
  writeNotNull('compoundActivity', instance.compoundActivity?.toJson());
  writeNotNull('task', instance.task?.toJson());
  writeNotNull('survey', instance.survey?.toJson());
  writeNotNull('activityType', activityTypeToJson(instance.activityType));
  writeNotNull('type', instance.type);
  return val;
}

ActivityEvent _$ActivityEventFromJson(Map<String, dynamic> json) {
  return ActivityEvent(
    eventId: json['eventId'] as String?,
    studyId: json['studyId'] as String?,
    answerValue: json['answerValue'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ActivityEventToJson(ActivityEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventId', instance.eventId);
  writeNotNull('studyId', instance.studyId);
  writeNotNull('answerValue', instance.answerValue);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    placeName: json['placeName'] as String?,
    street: json['street'] as String?,
    mailRouting: json['mailRouting'] as String?,
    city: json['city'] as String?,
    division: json['division'] as String?,
    postalCode: json['postalCode'] as String?,
    country: json['country'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('placeName', instance.placeName);
  writeNotNull('street', instance.street);
  writeNotNull('mailRouting', instance.mailRouting);
  writeNotNull('city', instance.city);
  writeNotNull('division', instance.division);
  writeNotNull('postalCode', instance.postalCode);
  writeNotNull('country', instance.country);
  writeNotNull('type', instance.type);
  return val;
}

AdherenceRecord _$AdherenceRecordFromJson(Map<String, dynamic> json) {
  return AdherenceRecord(
    instanceGuid: json['instanceGuid'] as String?,
    startedOn: json['startedOn'] == null
        ? null
        : DateTime.parse(json['startedOn'] as String),
    finishedOn: json['finishedOn'] == null
        ? null
        : DateTime.parse(json['finishedOn'] as String),
    eventTimestamp: json['eventTimestamp'] == null
        ? null
        : DateTime.parse(json['eventTimestamp'] as String),
    clientTimeZone: json['clientTimeZone'] as String?,
    uploadedOn: json['uploadedOn'] == null
        ? null
        : DateTime.parse(json['uploadedOn'] as String),
    declined: json['declined'] as bool?,
    clientData: json['clientData'],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AdherenceRecordToJson(AdherenceRecord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceGuid', instance.instanceGuid);
  writeNotNull('startedOn', instance.startedOn?.toIso8601String());
  writeNotNull('finishedOn', instance.finishedOn?.toIso8601String());
  writeNotNull('eventTimestamp', instance.eventTimestamp?.toIso8601String());
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  writeNotNull('uploadedOn', instance.uploadedOn?.toIso8601String());
  writeNotNull('declined', instance.declined);
  writeNotNull('clientData', instance.clientData);
  writeNotNull('type', instance.type);
  return val;
}

AdherenceRecordUpdates _$AdherenceRecordUpdatesFromJson(
    Map<String, dynamic> json) {
  return AdherenceRecordUpdates(
    records: (json['records'] as List<dynamic>?)
            ?.map((e) => AdherenceRecord.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AdherenceRecordUpdatesToJson(
    AdherenceRecordUpdates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('records', instance.records?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

AdherenceRecordsSearch _$AdherenceRecordsSearchFromJson(
    Map<String, dynamic> json) {
  return AdherenceRecordsSearch(
    instanceGuids: (json['instanceGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    assessmentIds: (json['assessmentIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    sessionGuids: (json['sessionGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    timeWindowGuids: (json['timeWindowGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    adherenceRecordType:
        adherenceRecordTypeFromJson(json['adherenceRecordType']),
    includeRepeats: json['includeRepeats'] as bool?,
    currentTimestampsOnly: json['currentTimestampsOnly'] as bool?,
    eventTimestamps: json['eventTimestamps'] as Map<String, dynamic>?,
    startTime: json['startTime'] == null
        ? null
        : DateTime.parse(json['startTime'] as String),
    endTime: json['endTime'] == null
        ? null
        : DateTime.parse(json['endTime'] as String),
    pageSize: json['pageSize'] as int?,
    offsetBy: json['offsetBy'] as int?,
    sortOrder: sortOrderFromJson(json['sortOrder']),
    predicate: searchTermPredicateFromJson(json['predicate']),
    stringSearchPosition:
        stringSearchPositionFromJson(json['stringSearchPosition']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AdherenceRecordsSearchToJson(
    AdherenceRecordsSearch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceGuids', instance.instanceGuids);
  writeNotNull('assessmentIds', instance.assessmentIds);
  writeNotNull('sessionGuids', instance.sessionGuids);
  writeNotNull('timeWindowGuids', instance.timeWindowGuids);
  writeNotNull('adherenceRecordType',
      adherenceRecordTypeToJson(instance.adherenceRecordType));
  writeNotNull('includeRepeats', instance.includeRepeats);
  writeNotNull('currentTimestampsOnly', instance.currentTimestampsOnly);
  writeNotNull('eventTimestamps', instance.eventTimestamps);
  writeNotNull('startTime', instance.startTime?.toIso8601String());
  writeNotNull('endTime', instance.endTime?.toIso8601String());
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('offsetBy', instance.offsetBy);
  writeNotNull('sortOrder', sortOrderToJson(instance.sortOrder));
  writeNotNull('predicate', searchTermPredicateToJson(instance.predicate));
  writeNotNull('stringSearchPosition',
      stringSearchPositionToJson(instance.stringSearchPosition));
  writeNotNull('type', instance.type);
  return val;
}

AndroidAppLink _$AndroidAppLinkFromJson(Map<String, dynamic> json) {
  return AndroidAppLink(
    namespace: json['namespace'] as String?,
    packageName: json['package_name'] as String?,
    sha256CertFingerprints: (json['sha256_cert_fingerprints'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AndroidAppLinkToJson(AndroidAppLink instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('namespace', instance.namespace);
  writeNotNull('package_name', instance.packageName);
  writeNotNull('sha256_cert_fingerprints', instance.sha256CertFingerprints);
  writeNotNull('type', instance.type);
  return val;
}

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    name: json['name'] as String?,
    shortName: json['shortName'] as String?,
    customEvents: json['customEvents'] as Map<String, dynamic>?,
    automaticCustomEvents:
        json['automaticCustomEvents'] as Map<String, dynamic>?,
    autoVerificationEmailSuppressed:
        json['autoVerificationEmailSuppressed'] as bool?,
    consentNotificationEmailVerified:
        json['consentNotificationEmailVerified'] as bool?,
    exporter3Configuration: json['exporter3Configuration'] == null
        ? null
        : Exporter3Configuration.fromJson(
            json['exporter3Configuration'] as Map<String, dynamic>),
    exporter3Enabled: json['exporter3Enabled'] as bool?,
    fitBitScopes: (json['fitBitScopes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    installLinks: json['installLinks'] as Map<String, dynamic>?,
    participantIpLockingEnabled: json['participantIpLockingEnabled'] as bool?,
    sponsorName: json['sponsorName'] as String?,
    supportEmail: json['supportEmail'] as String?,
    technicalEmail: json['technicalEmail'] as String?,
    uploadMetadataFieldDefinitions:
        (json['uploadMetadataFieldDefinitions'] as List<dynamic>?)
                ?.map((e) =>
                    UploadFieldDefinition.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
    uploadValidationStrictness:
        uploadValidationStrictnessFromJson(json['uploadValidationStrictness']),
    consentNotificationEmail: json['consentNotificationEmail'] as String?,
    identifier: json['identifier'] as String?,
    version: json['version'] as num?,
    minAgeOfConsent: json['minAgeOfConsent'] as int?,
    appIdExcludedInExport: json['appIdExcludedInExport'] as bool?,
    synapseDataAccessTeamId: json['synapseDataAccessTeamId'] as num?,
    synapseProjectId: json['synapseProjectId'] as String?,
    usesCustomExportSchedule: json['usesCustomExportSchedule'] as bool?,
    userProfileAttributes: (json['userProfileAttributes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    taskIdentifiers: (json['taskIdentifiers'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    passwordPolicy: json['passwordPolicy'] == null
        ? null
        : PasswordPolicy.fromJson(
            json['passwordPolicy'] as Map<String, dynamic>),
    active: json['active'] as bool?,
    strictUploadValidationEnabled:
        json['strictUploadValidationEnabled'] as bool?,
    healthCodeExportEnabled: json['healthCodeExportEnabled'] as bool?,
    emailVerificationEnabled: json['emailVerificationEnabled'] as bool?,
    autoVerificationPhoneSuppressed:
        json['autoVerificationPhoneSuppressed'] as bool?,
    emailSignInEnabled: json['emailSignInEnabled'] as bool? ?? false,
    phoneSignInEnabled: json['phoneSignInEnabled'] as bool? ?? false,
    reauthenticationEnabled: json['reauthenticationEnabled'] as bool? ?? true,
    externalIdRequiredOnSignup:
        json['externalIdRequiredOnSignup'] as bool? ?? false,
    verifyChannelOnSignInEnabled:
        json['verifyChannelOnSignInEnabled'] as bool? ?? true,
    accountLimit: json['accountLimit'] as int?,
    disableExport: json['disableExport'] as bool? ?? false,
    minSupportedAppVersions:
        json['minSupportedAppVersions'] as Map<String, dynamic>?,
    oAuthProviders: json['oAuthProviders'] as Map<String, dynamic>?,
    pushNotificationARNs: json['pushNotificationARNs'] as Map<String, dynamic>?,
    appleAppLinks: (json['appleAppLinks'] as List<dynamic>?)
            ?.map((e) => AppleAppLink.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    androidAppLinks: (json['androidAppLinks'] as List<dynamic>?)
            ?.map((e) => AndroidAppLink.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    defaultTemplates: json['defaultTemplates'] as Map<String, dynamic>?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppToJson(App instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('shortName', instance.shortName);
  writeNotNull('customEvents', instance.customEvents);
  writeNotNull('automaticCustomEvents', instance.automaticCustomEvents);
  writeNotNull('autoVerificationEmailSuppressed',
      instance.autoVerificationEmailSuppressed);
  writeNotNull('consentNotificationEmailVerified',
      instance.consentNotificationEmailVerified);
  writeNotNull(
      'exporter3Configuration', instance.exporter3Configuration?.toJson());
  writeNotNull('exporter3Enabled', instance.exporter3Enabled);
  writeNotNull('fitBitScopes', instance.fitBitScopes);
  writeNotNull('installLinks', instance.installLinks);
  writeNotNull(
      'participantIpLockingEnabled', instance.participantIpLockingEnabled);
  writeNotNull('sponsorName', instance.sponsorName);
  writeNotNull('supportEmail', instance.supportEmail);
  writeNotNull('technicalEmail', instance.technicalEmail);
  writeNotNull('uploadMetadataFieldDefinitions',
      instance.uploadMetadataFieldDefinitions?.map((e) => e.toJson()).toList());
  writeNotNull('uploadValidationStrictness',
      uploadValidationStrictnessToJson(instance.uploadValidationStrictness));
  writeNotNull('consentNotificationEmail', instance.consentNotificationEmail);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('version', instance.version);
  writeNotNull('minAgeOfConsent', instance.minAgeOfConsent);
  writeNotNull('appIdExcludedInExport', instance.appIdExcludedInExport);
  writeNotNull('synapseDataAccessTeamId', instance.synapseDataAccessTeamId);
  writeNotNull('synapseProjectId', instance.synapseProjectId);
  writeNotNull('usesCustomExportSchedule', instance.usesCustomExportSchedule);
  writeNotNull('userProfileAttributes', instance.userProfileAttributes);
  writeNotNull('taskIdentifiers', instance.taskIdentifiers);
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('passwordPolicy', instance.passwordPolicy?.toJson());
  writeNotNull('active', instance.active);
  writeNotNull(
      'strictUploadValidationEnabled', instance.strictUploadValidationEnabled);
  writeNotNull('healthCodeExportEnabled', instance.healthCodeExportEnabled);
  writeNotNull('emailVerificationEnabled', instance.emailVerificationEnabled);
  writeNotNull('autoVerificationPhoneSuppressed',
      instance.autoVerificationPhoneSuppressed);
  writeNotNull('emailSignInEnabled', instance.emailSignInEnabled);
  writeNotNull('phoneSignInEnabled', instance.phoneSignInEnabled);
  writeNotNull('reauthenticationEnabled', instance.reauthenticationEnabled);
  writeNotNull(
      'externalIdRequiredOnSignup', instance.externalIdRequiredOnSignup);
  writeNotNull(
      'verifyChannelOnSignInEnabled', instance.verifyChannelOnSignInEnabled);
  writeNotNull('accountLimit', instance.accountLimit);
  writeNotNull('disableExport', instance.disableExport);
  writeNotNull('minSupportedAppVersions', instance.minSupportedAppVersions);
  writeNotNull('oAuthProviders', instance.oAuthProviders);
  writeNotNull('pushNotificationARNs', instance.pushNotificationARNs);
  writeNotNull(
      'appleAppLinks', instance.appleAppLinks?.map((e) => e.toJson()).toList());
  writeNotNull('androidAppLinks',
      instance.androidAppLinks?.map((e) => e.toJson()).toList());
  writeNotNull('defaultTemplates', instance.defaultTemplates);
  writeNotNull('type', instance.type);
  return val;
}

AppAndUsers _$AppAndUsersFromJson(Map<String, dynamic> json) {
  return AppAndUsers(
    adminIds: (json['adminIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    app: json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>),
    users: (json['users'] as List<dynamic>?)
            ?.map((e) => StudyParticipant.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppAndUsersToJson(AppAndUsers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adminIds', instance.adminIds);
  writeNotNull('app', instance.app?.toJson());
  writeNotNull('users', instance.users?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return AppConfig(
    label: json['label'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    guid: json['guid'] as String?,
    deleted: json['deleted'] as bool?,
    criteria: json['criteria'] == null
        ? null
        : Criteria.fromJson(json['criteria'] as Map<String, dynamic>),
    clientData: json['clientData'],
    surveyReferences: (json['surveyReferences'] as List<dynamic>?)
            ?.map((e) => SurveyReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    schemaReferences: (json['schemaReferences'] as List<dynamic>?)
            ?.map((e) => SchemaReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    configReferences: (json['configReferences'] as List<dynamic>?)
            ?.map((e) => ConfigReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    fileReferences: (json['fileReferences'] as List<dynamic>?)
            ?.map((e) => FileReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    assessmentReferences: (json['assessmentReferences'] as List<dynamic>?)
            ?.map(
                (e) => AssessmentReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    configElements: json['configElements'] as Map<String, dynamic>?,
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('guid', instance.guid);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('criteria', instance.criteria?.toJson());
  writeNotNull('clientData', instance.clientData);
  writeNotNull('surveyReferences',
      instance.surveyReferences?.map((e) => e.toJson()).toList());
  writeNotNull('schemaReferences',
      instance.schemaReferences?.map((e) => e.toJson()).toList());
  writeNotNull('configReferences',
      instance.configReferences?.map((e) => e.toJson()).toList());
  writeNotNull('fileReferences',
      instance.fileReferences?.map((e) => e.toJson()).toList());
  writeNotNull('assessmentReferences',
      instance.assessmentReferences?.map((e) => e.toJson()).toList());
  writeNotNull('configElements', instance.configElements);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

AppConfigElement _$AppConfigElementFromJson(Map<String, dynamic> json) {
  return AppConfigElement(
    id: json['id'] as String?,
    revision: json['revision'] as num?,
    deleted: json['deleted'] as bool?,
    data: json['data'],
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppConfigElementToJson(AppConfigElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('revision', instance.revision);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('data', instance.data);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

AppleAppLink _$AppleAppLinkFromJson(Map<String, dynamic> json) {
  return AppleAppLink(
    appID: json['appID'] as String?,
    paths:
        (json['paths'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppleAppLinkToJson(AppleAppLink instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appID', instance.appID);
  writeNotNull('paths', instance.paths);
  writeNotNull('type', instance.type);
  return val;
}

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return Assessment(
    guid: json['guid'] as String?,
    identifier: json['identifier'] as String?,
    revision: json['revision'] as num?,
    ownerId: json['ownerId'] as String?,
    title: json['title'] as String?,
    labels: (json['labels'] as List<dynamic>?)
            ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    colorScheme: json['colorScheme'] == null
        ? null
        : ColorScheme.fromJson(json['colorScheme'] as Map<String, dynamic>),
    summary: json['summary'] as String?,
    osName: json['osName'] as String?,
    originGuid: json['originGuid'] as String?,
    validationStatus: json['validationStatus'] as String?,
    normingStatus: json['normingStatus'] as String?,
    minutesToComplete: json['minutesToComplete'] as int?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    customizationFields: json['customizationFields'] as Map<String, dynamic>?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    deleted: json['deleted'] as bool?,
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AssessmentToJson(Assessment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('revision', instance.revision);
  writeNotNull('ownerId', instance.ownerId);
  writeNotNull('title', instance.title);
  writeNotNull('labels', instance.labels?.map((e) => e.toJson()).toList());
  writeNotNull('colorScheme', instance.colorScheme?.toJson());
  writeNotNull('summary', instance.summary);
  writeNotNull('osName', instance.osName);
  writeNotNull('originGuid', instance.originGuid);
  writeNotNull('validationStatus', instance.validationStatus);
  writeNotNull('normingStatus', instance.normingStatus);
  writeNotNull('minutesToComplete', instance.minutesToComplete);
  writeNotNull('tags', instance.tags);
  writeNotNull('customizationFields', instance.customizationFields);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('deleted', instance.deleted);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

AssessmentConfig _$AssessmentConfigFromJson(Map<String, dynamic> json) {
  return AssessmentConfig(
    config: json['config'],
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AssessmentConfigToJson(AssessmentConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('config', instance.config);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

AssessmentInfo _$AssessmentInfoFromJson(Map<String, dynamic> json) {
  return AssessmentInfo(
    key: json['key'] as String?,
    guid: json['guid'] as String?,
    appId: json['appId'] as String?,
    identifier: json['identifier'] as String?,
    revision: json['revision'] as int?,
    label: json['label'] as String?,
    minutesToComplete: json['minutesToComplete'] as int?,
    colorScheme: json['colorScheme'] == null
        ? null
        : ColorScheme.fromJson(json['colorScheme'] as Map<String, dynamic>),
    configUrl: json['configUrl'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AssessmentInfoToJson(AssessmentInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('guid', instance.guid);
  writeNotNull('appId', instance.appId);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('revision', instance.revision);
  writeNotNull('label', instance.label);
  writeNotNull('minutesToComplete', instance.minutesToComplete);
  writeNotNull('colorScheme', instance.colorScheme?.toJson());
  writeNotNull('configUrl', instance.configUrl);
  writeNotNull('type', instance.type);
  return val;
}

AssessmentReference _$AssessmentReferenceFromJson(Map<String, dynamic> json) {
  return AssessmentReference(
    appId: json['appId'] as String?,
    guid: json['guid'] as String?,
    id: json['id'] as String?,
    originSharedId: json['originSharedId'] as String?,
    configHref: json['configHref'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AssessmentReferenceToJson(AssessmentReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('guid', instance.guid);
  writeNotNull('id', instance.id);
  writeNotNull('originSharedId', instance.originSharedId);
  writeNotNull('configHref', instance.configHref);
  writeNotNull('type', instance.type);
  return val;
}

AssessmentReference2 _$AssessmentReference2FromJson(Map<String, dynamic> json) {
  return AssessmentReference2(
    appId: json['appId'] as String?,
    guid: json['guid'] as String?,
    title: json['title'] as String?,
    identifier: json['identifier'] as String?,
    revision: json['revision'] as int?,
    minutesToComplete: json['minutesToComplete'] as int?,
    labels: (json['labels'] as List<dynamic>?)
            ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    colorScheme: json['colorScheme'] == null
        ? null
        : ColorScheme.fromJson(json['colorScheme'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AssessmentReference2ToJson(
    AssessmentReference2 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('guid', instance.guid);
  writeNotNull('title', instance.title);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('revision', instance.revision);
  writeNotNull('minutesToComplete', instance.minutesToComplete);
  writeNotNull('labels', instance.labels?.map((e) => e.toJson()).toList());
  writeNotNull('colorScheme', instance.colorScheme?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) {
  return ClientInfo(
    appName: json['appName'] as String?,
    appVersion: json['appVersion'] as int?,
    deviceName: json['deviceName'] as String?,
    osName: json['osName'] as String?,
    osVersion: json['osVersion'] as String?,
    sdkName: json['sdkName'] as String?,
    sdkVersion: json['sdkVersion'] as int?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ClientInfoToJson(ClientInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appName', instance.appName);
  writeNotNull('appVersion', instance.appVersion);
  writeNotNull('deviceName', instance.deviceName);
  writeNotNull('osName', instance.osName);
  writeNotNull('osVersion', instance.osVersion);
  writeNotNull('sdkName', instance.sdkName);
  writeNotNull('sdkVersion', instance.sdkVersion);
  writeNotNull('type', instance.type);
  return val;
}

CmsPublicKey _$CmsPublicKeyFromJson(Map<String, dynamic> json) {
  return CmsPublicKey(
    publicKey: json['publicKey'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CmsPublicKeyToJson(CmsPublicKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('publicKey', instance.publicKey);
  writeNotNull('type', instance.type);
  return val;
}

ColorScheme _$ColorSchemeFromJson(Map<String, dynamic> json) {
  return ColorScheme(
    foreground: json['foreground'] as String?,
    background: json['background'] as String?,
    activated: json['activated'] as String?,
    inactivated: json['inactivated'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ColorSchemeToJson(ColorScheme instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foreground', instance.foreground);
  writeNotNull('background', instance.background);
  writeNotNull('activated', instance.activated);
  writeNotNull('inactivated', instance.inactivated);
  writeNotNull('type', instance.type);
  return val;
}

CompoundActivity _$CompoundActivityFromJson(Map<String, dynamic> json) {
  return CompoundActivity(
    schemaList: (json['schemaList'] as List<dynamic>?)
            ?.map((e) => SchemaReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    surveyList: (json['surveyList'] as List<dynamic>?)
            ?.map((e) => SurveyReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    taskIdentifier: json['taskIdentifier'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CompoundActivityToJson(CompoundActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'schemaList', instance.schemaList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'surveyList', instance.surveyList?.map((e) => e.toJson()).toList());
  writeNotNull('taskIdentifier', instance.taskIdentifier);
  writeNotNull('type', instance.type);
  return val;
}

CompoundActivityDefinition _$CompoundActivityDefinitionFromJson(
    Map<String, dynamic> json) {
  return CompoundActivityDefinition(
    schemaList: (json['schemaList'] as List<dynamic>?)
            ?.map((e) => SchemaReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    surveyList: (json['surveyList'] as List<dynamic>?)
            ?.map((e) => SurveyReference.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    taskId: json['taskId'] as String?,
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CompoundActivityDefinitionToJson(
    CompoundActivityDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'schemaList', instance.schemaList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'surveyList', instance.surveyList?.map((e) => e.toJson()).toList());
  writeNotNull('taskId', instance.taskId);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

ConfigReference _$ConfigReferenceFromJson(Map<String, dynamic> json) {
  return ConfigReference(
    id: json['id'] as String?,
    revision: json['revision'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ConfigReferenceToJson(ConfigReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('revision', instance.revision);
  writeNotNull('type', instance.type);
  return val;
}

ConsentSignature _$ConsentSignatureFromJson(Map<String, dynamic> json) {
  return ConsentSignature(
    name: json['name'] as String?,
    birthdate: json['birthdate'] == null
        ? null
        : DateTime.parse(json['birthdate'] as String),
    imageData: json['imageData'] as String?,
    imageMimeType: json['imageMimeType'] as String?,
    signedOn: json['signedOn'] == null
        ? null
        : DateTime.parse(json['signedOn'] as String),
    withdrewOn: json['withdrewOn'] == null
        ? null
        : DateTime.parse(json['withdrewOn'] as String),
    scope: sharingScopeFromJson(json['scope']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ConsentSignatureToJson(ConsentSignature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('birthdate', instance.birthdate?.toIso8601String());
  writeNotNull('imageData', instance.imageData);
  writeNotNull('imageMimeType', instance.imageMimeType);
  writeNotNull('signedOn', instance.signedOn?.toIso8601String());
  writeNotNull('withdrewOn', instance.withdrewOn?.toIso8601String());
  writeNotNull('scope', sharingScopeToJson(instance.scope));
  writeNotNull('type', instance.type);
  return val;
}

ConsentStatus _$ConsentStatusFromJson(Map<String, dynamic> json) {
  return ConsentStatus(
    name: json['name'] as String?,
    subpopulationGuid: json['subpopulationGuid'] as String?,
    required: json['required'] as bool?,
    signedOn: json['signedOn'] == null
        ? null
        : DateTime.parse(json['signedOn'] as String),
    consented: json['consented'] as bool?,
    signedMostRecentConsent: json['signedMostRecentConsent'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ConsentStatusToJson(ConsentStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('subpopulationGuid', instance.subpopulationGuid);
  writeNotNull('required', instance.required);
  writeNotNull('signedOn', instance.signedOn?.toIso8601String());
  writeNotNull('consented', instance.consented);
  writeNotNull('signedMostRecentConsent', instance.signedMostRecentConsent);
  writeNotNull('type', instance.type);
  return val;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    role: contactRoleFromJson(json['role']),
    name: json['name'] as String?,
    position: json['position'] as String?,
    affiliation: json['affiliation'] as String?,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    jurisdiction: json['jurisdiction'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', contactRoleToJson(instance.role));
  writeNotNull('name', instance.name);
  writeNotNull('position', instance.position);
  writeNotNull('affiliation', instance.affiliation);
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('jurisdiction', instance.jurisdiction);
  writeNotNull('type', instance.type);
  return val;
}

CreatedOnHolder _$CreatedOnHolderFromJson(Map<String, dynamic> json) {
  return CreatedOnHolder(
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CreatedOnHolderToJson(CreatedOnHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

Criteria _$CriteriaFromJson(Map<String, dynamic> json) {
  return Criteria(
    language: json['language'] as String?,
    allOfGroups: (json['allOfGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    noneOfGroups: (json['noneOfGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    allOfStudyIds: (json['allOfStudyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    noneOfStudyIds: (json['noneOfStudyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    minAppVersions: json['minAppVersions'] as Map<String, dynamic>?,
    maxAppVersions: json['maxAppVersions'] as Map<String, dynamic>?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CriteriaToJson(Criteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  writeNotNull('allOfGroups', instance.allOfGroups);
  writeNotNull('noneOfGroups', instance.noneOfGroups);
  writeNotNull('allOfStudyIds', instance.allOfStudyIds);
  writeNotNull('noneOfStudyIds', instance.noneOfStudyIds);
  writeNotNull('minAppVersions', instance.minAppVersions);
  writeNotNull('maxAppVersions', instance.maxAppVersions);
  writeNotNull('type', instance.type);
  return val;
}

CriteriaScheduleStrategy _$CriteriaScheduleStrategyFromJson(
    Map<String, dynamic> json) {
  return CriteriaScheduleStrategy(
    scheduleCriteria: (json['scheduleCriteria'] as List<dynamic>?)
            ?.map((e) => ScheduleCriteria.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CriteriaScheduleStrategyToJson(
    CriteriaScheduleStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scheduleCriteria',
      instance.scheduleCriteria?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

CustomActivityEventRequest _$CustomActivityEventRequestFromJson(
    Map<String, dynamic> json) {
  return CustomActivityEventRequest(
    eventId: json['eventId'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CustomActivityEventRequestToJson(
    CustomActivityEventRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventId', instance.eventId);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

CustomEvent _$CustomEventFromJson(Map<String, dynamic> json) {
  return CustomEvent(
    eventId: json['eventId'] as String?,
    updateType: activityEventUpdateTypeFromJson(json['updateType']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CustomEventToJson(CustomEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventId', instance.eventId);
  writeNotNull(
      'updateType', activityEventUpdateTypeToJson(instance.updateType));
  writeNotNull('type', instance.type);
  return val;
}

DataGroups _$DataGroupsFromJson(Map<String, dynamic> json) {
  return DataGroups(
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$DataGroupsToJson(DataGroups instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('type', instance.type);
  return val;
}

DateRange _$DateRangeFromJson(Map<String, dynamic> json) {
  return DateRange(
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
  );
}

Map<String, dynamic> _$DateRangeToJson(DateRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  return val;
}

DayRange _$DayRangeFromJson(Map<String, dynamic> json) {
  return DayRange(
    min: json['min'] as int?,
    max: json['max'] as int?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$DayRangeToJson(DayRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('min', instance.min);
  writeNotNull('max', instance.max);
  writeNotNull('type', instance.type);
  return val;
}

EmailSignIn _$EmailSignInFromJson(Map<String, dynamic> json) {
  return EmailSignIn(
    appId: json['appId'] as String?,
    email: json['email'] as String?,
    token: json['token'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EmailSignInToJson(EmailSignIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('email', instance.email);
  writeNotNull('token', instance.token);
  writeNotNull('type', instance.type);
  return val;
}

EmailSignInRequest _$EmailSignInRequestFromJson(Map<String, dynamic> json) {
  return EmailSignInRequest(
    appId: json['appId'] as String?,
    email: json['email'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EmailSignInRequestToJson(EmailSignInRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('email', instance.email);
  writeNotNull('type', instance.type);
  return val;
}

EmailVerificationStatus _$EmailVerificationStatusFromJson(
    Map<String, dynamic> json) {
  return EmailVerificationStatus(
    status: accountStatusFromJson(json['status']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EmailVerificationStatusToJson(
    EmailVerificationStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('type', instance.type);
  return val;
}

Enrollment _$EnrollmentFromJson(Map<String, dynamic> json) {
  return Enrollment(
    externalId: json['externalId'] as String?,
    userId: json['userId'] as String?,
    consentRequired: json['consentRequired'] as bool? ?? false,
    enrolledOn: json['enrolledOn'] == null
        ? null
        : DateTime.parse(json['enrolledOn'] as String),
    enrolledBy: json['enrolledBy'] as String?,
    withdrawnOn: json['withdrawnOn'] == null
        ? null
        : DateTime.parse(json['withdrawnOn'] as String),
    withdrawnBy: json['withdrawnBy'] as String?,
    withdrawalNote: json['withdrawalNote'] as String?,
    note: json['note'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EnrollmentToJson(Enrollment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('externalId', instance.externalId);
  writeNotNull('userId', instance.userId);
  writeNotNull('consentRequired', instance.consentRequired);
  writeNotNull('enrolledOn', instance.enrolledOn?.toIso8601String());
  writeNotNull('enrolledBy', instance.enrolledBy);
  writeNotNull('withdrawnOn', instance.withdrawnOn?.toIso8601String());
  writeNotNull('withdrawnBy', instance.withdrawnBy);
  writeNotNull('withdrawalNote', instance.withdrawalNote);
  writeNotNull('note', instance.note);
  writeNotNull('type', instance.type);
  return val;
}

EnrollmentDetail _$EnrollmentDetailFromJson(Map<String, dynamic> json) {
  return EnrollmentDetail(
    studyId: json['studyId'] as String?,
    externalId: json['externalId'] as String?,
    participant: json['participant'] == null
        ? null
        : AccountRef.fromJson(json['participant'] as Map<String, dynamic>),
    consentRequired: json['consentRequired'] as bool?,
    enrolledOn: json['enrolledOn'] == null
        ? null
        : DateTime.parse(json['enrolledOn'] as String),
    enrolledBy: json['enrolledBy'] == null
        ? null
        : AccountRef.fromJson(json['enrolledBy'] as Map<String, dynamic>),
    withdrawnOn: json['withdrawnOn'] == null
        ? null
        : DateTime.parse(json['withdrawnOn'] as String),
    withdrawnBy: json['withdrawnBy'] == null
        ? null
        : AccountRef.fromJson(json['withdrawnBy'] as Map<String, dynamic>),
    withdrawalNote: json['withdrawalNote'] as String?,
    note: json['note'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EnrollmentDetailToJson(EnrollmentDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('studyId', instance.studyId);
  writeNotNull('externalId', instance.externalId);
  writeNotNull('participant', instance.participant?.toJson());
  writeNotNull('consentRequired', instance.consentRequired);
  writeNotNull('enrolledOn', instance.enrolledOn?.toIso8601String());
  writeNotNull('enrolledBy', instance.enrolledBy?.toJson());
  writeNotNull('withdrawnOn', instance.withdrawnOn?.toIso8601String());
  writeNotNull('withdrawnBy', instance.withdrawnBy?.toJson());
  writeNotNull('withdrawalNote', instance.withdrawalNote);
  writeNotNull('note', instance.note);
  writeNotNull('type', instance.type);
  return val;
}

EnrollmentInfo _$EnrollmentInfoFromJson(Map<String, dynamic> json) {
  return EnrollmentInfo(
    externalId: json['externalId'] as String?,
    consentRequired: json['consentRequired'] as bool?,
    enrolledOn: json['enrolledOn'] == null
        ? null
        : DateTime.parse(json['enrolledOn'] as String),
    withdrawnOn: json['withdrawnOn'] == null
        ? null
        : DateTime.parse(json['withdrawnOn'] as String),
    enrolledBySelf: json['enrolledBySelf'] as bool?,
    withdrawnBySelf: json['withdrawnBySelf'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EnrollmentInfoToJson(EnrollmentInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('externalId', instance.externalId);
  writeNotNull('consentRequired', instance.consentRequired);
  writeNotNull('enrolledOn', instance.enrolledOn?.toIso8601String());
  writeNotNull('withdrawnOn', instance.withdrawnOn?.toIso8601String());
  writeNotNull('enrolledBySelf', instance.enrolledBySelf);
  writeNotNull('withdrawnBySelf', instance.withdrawnBySelf);
  writeNotNull('type', instance.type);
  return val;
}

EventStream _$EventStreamFromJson(Map<String, dynamic> json) {
  return EventStream(
    startEventId: json['startEventId'] as String?,
    sessionGuids: (json['sessionGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    eventTimestamp: json['eventTimestamp'] == null
        ? null
        : DateTime.parse(json['eventTimestamp'] as String),
    daysSinceEvent: json['daysSinceEvent'] as int?,
    studyBurstId: json['studyBurstId'] as String?,
    studyBurstNum: json['studyBurstNum'] as int?,
    byDayEntries: json['byDayEntries'] as Map<String, dynamic>?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EventStreamToJson(EventStream instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startEventId', instance.startEventId);
  writeNotNull('sessionGuids', instance.sessionGuids);
  writeNotNull('eventTimestamp', instance.eventTimestamp?.toIso8601String());
  writeNotNull('daysSinceEvent', instance.daysSinceEvent);
  writeNotNull('studyBurstId', instance.studyBurstId);
  writeNotNull('studyBurstNum', instance.studyBurstNum);
  writeNotNull('byDayEntries', instance.byDayEntries);
  writeNotNull('type', instance.type);
  return val;
}

EventStreamAdherenceReport _$EventStreamAdherenceReportFromJson(
    Map<String, dynamic> json) {
  return EventStreamAdherenceReport(
    activeOnly: json['activeOnly'] as bool?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    clientTimeZone: json['clientTimeZone'] as String?,
    adherencePercent: json['adherencePercent'] as int?,
    dayRangeOfAllStreams: json['dayRangeOfAllStreams'] == null
        ? null
        : DayRange.fromJson(
            json['dayRangeOfAllStreams'] as Map<String, dynamic>),
    streams: (json['streams'] as List<dynamic>?)
            ?.map((e) => EventStream.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EventStreamAdherenceReportToJson(
    EventStreamAdherenceReport instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('activeOnly', instance.activeOnly);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  writeNotNull('adherencePercent', instance.adherencePercent);
  writeNotNull('dayRangeOfAllStreams', instance.dayRangeOfAllStreams?.toJson());
  writeNotNull('streams', instance.streams?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

EventStreamDay _$EventStreamDayFromJson(Map<String, dynamic> json) {
  return EventStreamDay(
    sessionGuid: json['sessionGuid'] as String?,
    sessionName: json['sessionName'] as String?,
    sessionSymbol: json['sessionSymbol'] as String?,
    week: json['week'] as int?,
    studyBurstId: json['studyBurstId'] as String?,
    studyBurstNum: json['studyBurstNum'] as int?,
    startDay: json['startDay'] as int?,
    startDate: json['startDate'],
    timeWindows: (json['timeWindows'] as List<dynamic>?)
            ?.map((e) => EventStreamWindow.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EventStreamDayToJson(EventStreamDay instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sessionGuid', instance.sessionGuid);
  writeNotNull('sessionName', instance.sessionName);
  writeNotNull('sessionSymbol', instance.sessionSymbol);
  writeNotNull('week', instance.week);
  writeNotNull('studyBurstId', instance.studyBurstId);
  writeNotNull('studyBurstNum', instance.studyBurstNum);
  writeNotNull('startDay', instance.startDay);
  writeNotNull('startDate', instance.startDate);
  writeNotNull(
      'timeWindows', instance.timeWindows?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

EventStreamWindow _$EventStreamWindowFromJson(Map<String, dynamic> json) {
  return EventStreamWindow(
    sessionInstanceGuid: json['sessionInstanceGuid'] as String?,
    timeWindowGuid: json['timeWindowGuid'] as String?,
    state: sessionCompletionStateFromJson(json['state']),
    endDay: json['endDay'] as int?,
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EventStreamWindowToJson(EventStreamWindow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sessionInstanceGuid', instance.sessionInstanceGuid);
  writeNotNull('timeWindowGuid', instance.timeWindowGuid);
  writeNotNull('state', sessionCompletionStateToJson(instance.state));
  writeNotNull('endDay', instance.endDay);
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

Exporter3Configuration _$Exporter3ConfigurationFromJson(
    Map<String, dynamic> json) {
  return Exporter3Configuration(
    configured: json['configured'] as bool?,
    dataAccessTeamId: json['dataAccessTeamId'] as num?,
    projectId: json['projectId'] as String?,
    rawDataFolderId: json['rawDataFolderId'] as String?,
    storageLocationId: json['storageLocationId'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$Exporter3ConfigurationToJson(
    Exporter3Configuration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configured', instance.configured);
  writeNotNull('dataAccessTeamId', instance.dataAccessTeamId);
  writeNotNull('projectId', instance.projectId);
  writeNotNull('rawDataFolderId', instance.rawDataFolderId);
  writeNotNull('storageLocationId', instance.storageLocationId);
  writeNotNull('type', instance.type);
  return val;
}

ExternalIdentifier _$ExternalIdentifierFromJson(Map<String, dynamic> json) {
  return ExternalIdentifier(
    studyId: json['studyId'] as String?,
    identifier: json['identifier'] as String?,
    assigned: json['assigned'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ExternalIdentifierToJson(ExternalIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('studyId', instance.studyId);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('assigned', instance.assigned);
  writeNotNull('type', instance.type);
  return val;
}

ExternalResource _$ExternalResourceFromJson(Map<String, dynamic> json) {
  return ExternalResource(
    guid: json['guid'] as String?,
    title: json['title'] as String?,
    category: resourceCategoryFromJson(json['category']),
    url: json['url'] as String?,
    format: json['format'] as String?,
    date: json['date'] as String?,
    description: json['description'] as String?,
    contributors: (json['contributors'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    creators: (json['creators'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    publishers: (json['publishers'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    language: json['language'] as String?,
    minRevision: json['minRevision'] as int?,
    maxRevision: json['maxRevision'] as int?,
    createdAtRevision: json['createdAtRevision'] as int?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    deleted: json['deleted'] as bool?,
    version: json['version'] as num?,
    upToDate: json['upToDate'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ExternalResourceToJson(ExternalResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('title', instance.title);
  writeNotNull('category', resourceCategoryToJson(instance.category));
  writeNotNull('url', instance.url);
  writeNotNull('format', instance.format);
  writeNotNull('date', instance.date);
  writeNotNull('description', instance.description);
  writeNotNull('contributors', instance.contributors);
  writeNotNull('creators', instance.creators);
  writeNotNull('publishers', instance.publishers);
  writeNotNull('language', instance.language);
  writeNotNull('minRevision', instance.minRevision);
  writeNotNull('maxRevision', instance.maxRevision);
  writeNotNull('createdAtRevision', instance.createdAtRevision);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('deleted', instance.deleted);
  writeNotNull('version', instance.version);
  writeNotNull('upToDate', instance.upToDate);
  writeNotNull('type', instance.type);
  return val;
}

FileReference _$FileReferenceFromJson(Map<String, dynamic> json) {
  return FileReference(
    guid: json['guid'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    href: json['href'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$FileReferenceToJson(FileReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('href', instance.href);
  writeNotNull('type', instance.type);
  return val;
}

GeneratedPassword _$GeneratedPasswordFromJson(Map<String, dynamic> json) {
  return GeneratedPassword(
    externalId: json['externalId'] as String?,
    userId: json['userId'] as String?,
    password: json['password'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$GeneratedPasswordToJson(GeneratedPassword instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('externalId', instance.externalId);
  writeNotNull('userId', instance.userId);
  writeNotNull('password', instance.password);
  writeNotNull('type', instance.type);
  return val;
}

GuidCreatedOnVersionHolder _$GuidCreatedOnVersionHolderFromJson(
    Map<String, dynamic> json) {
  return GuidCreatedOnVersionHolder(
    guid: json['guid'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$GuidCreatedOnVersionHolderToJson(
    GuidCreatedOnVersionHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

GuidHolder _$GuidHolderFromJson(Map<String, dynamic> json) {
  return GuidHolder(
    guid: json['guid'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$GuidHolderToJson(GuidHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('type', instance.type);
  return val;
}

GuidVersionHolder _$GuidVersionHolderFromJson(Map<String, dynamic> json) {
  return GuidVersionHolder(
    guid: json['guid'] as String?,
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$GuidVersionHolderToJson(GuidVersionHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

HealthDataDocumentation _$HealthDataDocumentationFromJson(
    Map<String, dynamic> json) {
  return HealthDataDocumentation(
    title: json['title'] as String?,
    parentId: json['parentId'] as String?,
    identifier: json['identifier'] as String?,
    version: json['version'] as num?,
    documentation: json['documentation'] as String?,
    createdBy: json['createdBy'] as String?,
    createdOn: json['createdOn'],
    modifiedBy: json['modifiedBy'] as String?,
    modifiedOn: json['modifiedOn'],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$HealthDataDocumentationToJson(
    HealthDataDocumentation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('parentId', instance.parentId);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('version', instance.version);
  writeNotNull('documentation', instance.documentation);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdOn', instance.createdOn);
  writeNotNull('modifiedBy', instance.modifiedBy);
  writeNotNull('modifiedOn', instance.modifiedOn);
  writeNotNull('type', instance.type);
  return val;
}

HealthDataRecord _$HealthDataRecordFromJson(Map<String, dynamic> json) {
  return HealthDataRecord(
    appVersion: json['appVersion'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    createdOnTimeZone: json['createdOnTimeZone'] as String?,
    data: json['data'],
    dayInStudy: json['dayInStudy'] as int?,
    id: json['id'] as String?,
    metadata: json['metadata'],
    phoneInfo: json['phoneInfo'] as String?,
    rawDataAttachmentId: json['rawDataAttachmentId'] as String?,
    schemaId: json['schemaId'] as String?,
    schemaRevision: json['schemaRevision'] as num?,
    appId: json['appId'] as String?,
    uploadDate: json['uploadDate'] == null
        ? null
        : DateTime.parse(json['uploadDate'] as String),
    uploadId: json['uploadId'] as String?,
    uploadedOn: json['uploadedOn'] == null
        ? null
        : DateTime.parse(json['uploadedOn'] as String),
    userMetadata: json['userMetadata'],
    userSharingScope: sharingScopeFromJson(json['userSharingScope']),
    userExternalId: json['userExternalId'] as String?,
    userDataGroups: (json['userDataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    userStudyMemberships: json['userStudyMemberships'] as Map<String, dynamic>?,
    validationErrors: json['validationErrors'] as String?,
    version: json['version'] as num?,
    synapseExporterStatus:
        synapseExporterStatusFromJson(json['synapseExporterStatus']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$HealthDataRecordToJson(HealthDataRecord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appVersion', instance.appVersion);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('createdOnTimeZone', instance.createdOnTimeZone);
  writeNotNull('data', instance.data);
  writeNotNull('dayInStudy', instance.dayInStudy);
  writeNotNull('id', instance.id);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('phoneInfo', instance.phoneInfo);
  writeNotNull('rawDataAttachmentId', instance.rawDataAttachmentId);
  writeNotNull('schemaId', instance.schemaId);
  writeNotNull('schemaRevision', instance.schemaRevision);
  writeNotNull('appId', instance.appId);
  writeNotNull('uploadDate', instance.uploadDate?.toIso8601String());
  writeNotNull('uploadId', instance.uploadId);
  writeNotNull('uploadedOn', instance.uploadedOn?.toIso8601String());
  writeNotNull('userMetadata', instance.userMetadata);
  writeNotNull(
      'userSharingScope', sharingScopeToJson(instance.userSharingScope));
  writeNotNull('userExternalId', instance.userExternalId);
  writeNotNull('userDataGroups', instance.userDataGroups);
  writeNotNull('userStudyMemberships', instance.userStudyMemberships);
  writeNotNull('validationErrors', instance.validationErrors);
  writeNotNull('version', instance.version);
  writeNotNull('synapseExporterStatus',
      synapseExporterStatusToJson(instance.synapseExporterStatus));
  writeNotNull('type', instance.type);
  return val;
}

HealthDataRecordEx3 _$HealthDataRecordEx3FromJson(Map<String, dynamic> json) {
  return HealthDataRecordEx3(
    id: json['id'] as String?,
    appId: json['appId'] as String?,
    studyId: json['studyId'] as String?,
    healthCode: json['healthCode'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    clientInfo: json['clientInfo'] as String?,
    exported: json['exported'] as bool? ?? false,
    exportedOn: json['exportedOn'] == null
        ? null
        : DateTime.parse(json['exportedOn'] as String),
    metadata: json['metadata'] as Map<String, dynamic>?,
    sharingScope: sharingScopeFromJson(json['sharingScope']),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$HealthDataRecordEx3ToJson(HealthDataRecordEx3 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('appId', instance.appId);
  writeNotNull('studyId', instance.studyId);
  writeNotNull('healthCode', instance.healthCode);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('clientInfo', instance.clientInfo);
  writeNotNull('exported', instance.exported);
  writeNotNull('exportedOn', instance.exportedOn?.toIso8601String());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('sharingScope', sharingScopeToJson(instance.sharingScope));
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

HealthDataSubmission _$HealthDataSubmissionFromJson(Map<String, dynamic> json) {
  return HealthDataSubmission(
    appVersion: json['appVersion'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    data: json['data'],
    metadata: json['metadata'],
    phoneInfo: json['phoneInfo'] as String?,
    schemaId: json['schemaId'] as String?,
    schemaRevision: json['schemaRevision'] as num?,
    surveyCreatedOn: json['surveyCreatedOn'] == null
        ? null
        : DateTime.parse(json['surveyCreatedOn'] as String),
    surveyGuid: json['surveyGuid'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$HealthDataSubmissionToJson(
    HealthDataSubmission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appVersion', instance.appVersion);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('data', instance.data);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('phoneInfo', instance.phoneInfo);
  writeNotNull('schemaId', instance.schemaId);
  writeNotNull('schemaRevision', instance.schemaRevision);
  writeNotNull('surveyCreatedOn', instance.surveyCreatedOn?.toIso8601String());
  writeNotNull('surveyGuid', instance.surveyGuid);
  writeNotNull('type', instance.type);
  return val;
}

FileMetadata _$FileMetadataFromJson(Map<String, dynamic> json) {
  return FileMetadata(
    name: json['name'] as String?,
    guid: json['guid'] as String?,
    description: json['description'] as String?,
    disposition: fileDispositionFromJson(json['disposition']),
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    deleted: json['deleted'] as bool?,
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$FileMetadataToJson(FileMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('guid', instance.guid);
  writeNotNull('description', instance.description);
  writeNotNull('disposition', fileDispositionToJson(instance.disposition));
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('deleted', instance.deleted);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

FileRevision _$FileRevisionFromJson(Map<String, dynamic> json) {
  return FileRevision(
    name: json['name'] as String?,
    fileGuid: json['fileGuid'] as String?,
    description: json['description'] as String?,
    mimeType: json['mimeType'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    size: json['size'] as num?,
    uploadURL: json['uploadURL'] as String?,
    downloadURL: json['downloadURL'] as String?,
    status: fileRevisionStatusFromJson(json['status']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$FileRevisionToJson(FileRevision instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('fileGuid', instance.fileGuid);
  writeNotNull('description', instance.description);
  writeNotNull('mimeType', instance.mimeType);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('size', instance.size);
  writeNotNull('uploadURL', instance.uploadURL);
  writeNotNull('downloadURL', instance.downloadURL);
  writeNotNull('status', fileRevisionStatusToJson(instance.status));
  writeNotNull('type', instance.type);
  return val;
}

Identifier _$IdentifierFromJson(Map<String, dynamic> json) {
  return Identifier(
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    appId: json['appId'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$IdentifierToJson(Identifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('appId', instance.appId);
  writeNotNull('type', instance.type);
  return val;
}

IdentifierHolder _$IdentifierHolderFromJson(Map<String, dynamic> json) {
  return IdentifierHolder(
    identifier: json['identifier'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$IdentifierHolderToJson(IdentifierHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('type', instance.type);
  return val;
}

IdentifierUpdate _$IdentifierUpdateFromJson(Map<String, dynamic> json) {
  return IdentifierUpdate(
    signIn: json['signIn'] == null
        ? null
        : SignIn.fromJson(json['signIn'] as Map<String, dynamic>),
    emailUpdate: json['emailUpdate'] as String?,
    phoneUpdate: json['phoneUpdate'] == null
        ? null
        : Phone.fromJson(json['phoneUpdate'] as Map<String, dynamic>),
    synapseUserIdUpdate: json['synapseUserIdUpdate'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$IdentifierUpdateToJson(IdentifierUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('signIn', instance.signIn?.toJson());
  writeNotNull('emailUpdate', instance.emailUpdate);
  writeNotNull('phoneUpdate', instance.phoneUpdate?.toJson());
  writeNotNull('synapseUserIdUpdate', instance.synapseUserIdUpdate);
  writeNotNull('type', instance.type);
  return val;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    source: json['source'] as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('type', instance.type);
  return val;
}

IntentToParticipate _$IntentToParticipateFromJson(Map<String, dynamic> json) {
  return IntentToParticipate(
    appId: json['appId'] as String?,
    subpopGuid: json['subpopGuid'] as String?,
    osName: json['osName'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    email: json['email'] as String?,
    consentSignature: json['consentSignature'] == null
        ? null
        : ConsentSignature.fromJson(
            json['consentSignature'] as Map<String, dynamic>),
    scope: sharingScopeFromJson(json['scope']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$IntentToParticipateToJson(IntentToParticipate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('subpopGuid', instance.subpopGuid);
  writeNotNull('osName', instance.osName);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('email', instance.email);
  writeNotNull('consentSignature', instance.consentSignature?.toJson());
  writeNotNull('scope', sharingScopeToJson(instance.scope));
  writeNotNull('type', instance.type);
  return val;
}

InvalidEntity _$InvalidEntityFromJson(Map<String, dynamic> json) {
  return InvalidEntity(
    message: json['message'] as String?,
    errors: json['errors'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$InvalidEntityToJson(InvalidEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('errors', instance.errors);
  return val;
}

Label _$LabelFromJson(Map<String, dynamic> json) {
  return Label(
    lang: json['lang'] as String?,
    value: json['value'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$LabelToJson(Label instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lang', instance.lang);
  writeNotNull('value', instance.value);
  writeNotNull('type', instance.type);
  return val;
}

MasterSchedulerConfig _$MasterSchedulerConfigFromJson(
    Map<String, dynamic> json) {
  return MasterSchedulerConfig(
    scheduleId: json['scheduleId'] as String?,
    cronSchedule: json['cronSchedule'] as String?,
    requestTemplate: json['requestTemplate'],
    sqsQueueUrl: json['sqsQueueUrl'] as String?,
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$MasterSchedulerConfigToJson(
    MasterSchedulerConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scheduleId', instance.scheduleId);
  writeNotNull('cronSchedule', instance.cronSchedule);
  writeNotNull('requestTemplate', instance.requestTemplate);
  writeNotNull('sqsQueueUrl', instance.sqsQueueUrl);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    message: json['message'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('type', instance.type);
  return val;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    notifyAt: notificationTypeFromJson(json['notifyAt']),
    offset: json['offset'] as String?,
    interval: json['interval'] as String?,
    allowSnooze: json['allowSnooze'] as bool? ?? false,
    messages: (json['messages'] as List<dynamic>?)
            ?.map(
                (e) => NotificationMessage.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notifyAt', notificationTypeToJson(instance.notifyAt));
  writeNotNull('offset', instance.offset);
  writeNotNull('interval', instance.interval);
  writeNotNull('allowSnooze', instance.allowSnooze);
  writeNotNull('messages', instance.messages?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

NotificationInfo _$NotificationInfoFromJson(Map<String, dynamic> json) {
  return NotificationInfo(
    notifyAt: notificationTypeFromJson(json['notifyAt']),
    offset: json['offset'] as String?,
    interval: json['interval'] as String?,
    allowSnooze: json['allowSnooze'] as bool? ?? false,
    message: json['message'] == null
        ? null
        : NotificationMessage.fromJson(json['message'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$NotificationInfoToJson(NotificationInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notifyAt', notificationTypeToJson(instance.notifyAt));
  writeNotNull('offset', instance.offset);
  writeNotNull('interval', instance.interval);
  writeNotNull('allowSnooze', instance.allowSnooze);
  writeNotNull('message', instance.message?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

NotificationMessage _$NotificationMessageFromJson(Map<String, dynamic> json) {
  return NotificationMessage(
    lang: json['lang'] as String?,
    subject: json['subject'] as String?,
    message: json['message'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$NotificationMessageToJson(NotificationMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lang', instance.lang);
  writeNotNull('subject', instance.subject);
  writeNotNull('message', instance.message);
  writeNotNull('type', instance.type);
  return val;
}

NotificationRegistration _$NotificationRegistrationFromJson(
    Map<String, dynamic> json) {
  return NotificationRegistration(
    guid: json['guid'] as String?,
    protocol: notificationProtocolFromJson(json['protocol']),
    endpoint: json['endpoint'] as String?,
    deviceId: json['deviceId'] as String?,
    osName: json['osName'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$NotificationRegistrationToJson(
    NotificationRegistration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('protocol', notificationProtocolToJson(instance.protocol));
  writeNotNull('endpoint', instance.endpoint);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('osName', instance.osName);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

NotificationTopic _$NotificationTopicFromJson(Map<String, dynamic> json) {
  return NotificationTopic(
    guid: json['guid'] as String?,
    name: json['name'] as String?,
    shortName: json['shortName'] as String?,
    description: json['description'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    deleted: json['deleted'] as bool?,
    criteria: json['criteria'] == null
        ? null
        : Criteria.fromJson(json['criteria'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$NotificationTopicToJson(NotificationTopic instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('name', instance.name);
  writeNotNull('shortName', instance.shortName);
  writeNotNull('description', instance.description);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('deleted', instance.deleted);
  writeNotNull('criteria', instance.criteria?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

OAuthAccessToken _$OAuthAccessTokenFromJson(Map<String, dynamic> json) {
  return OAuthAccessToken(
    vendorId: json['vendorId'] as String?,
    accessToken: json['accessToken'] as String?,
    expiresOn: json['expiresOn'] == null
        ? null
        : DateTime.parse(json['expiresOn'] as String),
    providerUserId: json['providerUserId'] as String?,
    scopes:
        (json['scopes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$OAuthAccessTokenToJson(OAuthAccessToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vendorId', instance.vendorId);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('expiresOn', instance.expiresOn?.toIso8601String());
  writeNotNull('providerUserId', instance.providerUserId);
  writeNotNull('scopes', instance.scopes);
  writeNotNull('type', instance.type);
  return val;
}

OAuthAuthorizationToken _$OAuthAuthorizationTokenFromJson(
    Map<String, dynamic> json) {
  return OAuthAuthorizationToken(
    appId: json['appId'] as String?,
    vendorId: json['vendorId'] as String?,
    authToken: json['authToken'] as String?,
    callbackUrl: json['callbackUrl'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$OAuthAuthorizationTokenToJson(
    OAuthAuthorizationToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('vendorId', instance.vendorId);
  writeNotNull('authToken', instance.authToken);
  writeNotNull('callbackUrl', instance.callbackUrl);
  writeNotNull('type', instance.type);
  return val;
}

OAuthProvider _$OAuthProviderFromJson(Map<String, dynamic> json) {
  return OAuthProvider(
    clientId: json['clientId'] as String?,
    secret: json['secret'] as String?,
    endpoint: json['endpoint'] as String?,
    callbackUrl: json['callbackUrl'] as String?,
    introspectEndpoint: json['introspectEndpoint'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$OAuthProviderToJson(OAuthProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('secret', instance.secret);
  writeNotNull('endpoint', instance.endpoint);
  writeNotNull('callbackUrl', instance.callbackUrl);
  writeNotNull('introspectEndpoint', instance.introspectEndpoint);
  writeNotNull('type', instance.type);
  return val;
}

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    name: json['name'] as String?,
    identifier: json['identifier'] as String?,
    description: json['description'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('description', instance.description);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

ParticipantData _$ParticipantDataFromJson(Map<String, dynamic> json) {
  return ParticipantData(
    identifier: json['identifier'] as String?,
    data: json['data'],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ParticipantDataToJson(ParticipantData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('data', instance.data);
  writeNotNull('type', instance.type);
  return val;
}

ParticipantFile _$ParticipantFileFromJson(Map<String, dynamic> json) {
  return ParticipantFile(
    fileId: json['fileId'] as String?,
    mimeType: json['mimeType'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    downloadUrl: json['downloadUrl'] as String?,
    uploadUrl: json['uploadUrl'] as String?,
    type: json['type'] as String?,
    expiresOn: json['expiresOn'] == null
        ? null
        : DateTime.parse(json['expiresOn'] as String),
  );
}

Map<String, dynamic> _$ParticipantFileToJson(ParticipantFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fileId', instance.fileId);
  writeNotNull('mimeType', instance.mimeType);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('downloadUrl', instance.downloadUrl);
  writeNotNull('uploadUrl', instance.uploadUrl);
  writeNotNull('type', instance.type);
  writeNotNull('expiresOn', instance.expiresOn?.toIso8601String());
  return val;
}

ParticipantRosterRequest _$ParticipantRosterRequestFromJson(
    Map<String, dynamic> json) {
  return ParticipantRosterRequest(
    password: json['password'] as String?,
    studyId: json['studyId'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ParticipantRosterRequestToJson(
    ParticipantRosterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('studyId', instance.studyId);
  writeNotNull('type', instance.type);
  return val;
}

ParticipantVersion _$ParticipantVersionFromJson(Map<String, dynamic> json) {
  return ParticipantVersion(
    appId: json['appId'] as String?,
    healthCode: json['healthCode'] as String?,
    participantVersion: json['participantVersion'] as int?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    sharingScope: sharingScopeFromJson(json['sharingScope']),
    studyMemberships: json['studyMemberships'] as Map<String, dynamic>?,
    timeZone: json['timeZone'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ParticipantVersionToJson(ParticipantVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('healthCode', instance.healthCode);
  writeNotNull('participantVersion', instance.participantVersion);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('languages', instance.languages);
  writeNotNull('sharingScope', sharingScopeToJson(instance.sharingScope));
  writeNotNull('studyMemberships', instance.studyMemberships);
  writeNotNull('timeZone', instance.timeZone);
  writeNotNull('type', instance.type);
  return val;
}

PasswordPolicy _$PasswordPolicyFromJson(Map<String, dynamic> json) {
  return PasswordPolicy(
    minLength: json['minLength'] as int?,
    numericRequired: json['numericRequired'] as bool? ?? true,
    symbolRequired: json['symbolRequired'] as bool? ?? true,
    lowerCaseRequired: json['lowerCaseRequired'] as bool? ?? true,
    upperCaseRequired: json['upperCaseRequired'] as bool? ?? true,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PasswordPolicyToJson(PasswordPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('minLength', instance.minLength);
  writeNotNull('numericRequired', instance.numericRequired);
  writeNotNull('symbolRequired', instance.symbolRequired);
  writeNotNull('lowerCaseRequired', instance.lowerCaseRequired);
  writeNotNull('upperCaseRequired', instance.upperCaseRequired);
  writeNotNull('type', instance.type);
  return val;
}

PasswordReset _$PasswordResetFromJson(Map<String, dynamic> json) {
  return PasswordReset(
    password: json['password'] as String?,
    sptoken: json['sptoken'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PasswordResetToJson(PasswordReset instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('sptoken', instance.sptoken);
  writeNotNull('type', instance.type);
  return val;
}

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return Phone(
    number: json['number'] as String?,
    regionCode: json['regionCode'] as String?,
    nationalFormat: json['nationalFormat'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PhoneToJson(Phone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('number', instance.number);
  writeNotNull('regionCode', instance.regionCode);
  writeNotNull('nationalFormat', instance.nationalFormat);
  writeNotNull('type', instance.type);
  return val;
}

PhoneSignInRequest _$PhoneSignInRequestFromJson(Map<String, dynamic> json) {
  return PhoneSignInRequest(
    appId: json['appId'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PhoneSignInRequestToJson(PhoneSignInRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

PropertyInfo _$PropertyInfoFromJson(Map<String, dynamic> json) {
  return PropertyInfo(
    propName: json['propName'] as String?,
    label: json['label'] as String?,
    description: json['description'] as String?,
    propType: json['propType'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PropertyInfoToJson(PropertyInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('propName', instance.propName);
  writeNotNull('label', instance.label);
  writeNotNull('description', instance.description);
  writeNotNull('propType', instance.propType);
  writeNotNull('type', instance.type);
  return val;
}

RecordExportStatusRequest _$RecordExportStatusRequestFromJson(
    Map<String, dynamic> json) {
  return RecordExportStatusRequest(
    recordIds: (json['recordIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    synapseExporterStatus:
        synapseExporterStatusFromJson(json['synapseExporterStatus']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$RecordExportStatusRequestToJson(
    RecordExportStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recordIds', instance.recordIds);
  writeNotNull('synapseExporterStatus',
      synapseExporterStatusToJson(instance.synapseExporterStatus));
  writeNotNull('type', instance.type);
  return val;
}

ReportData _$ReportDataFromJson(Map<String, dynamic> json) {
  return ReportData(
    date: json['date'] as String?,
    localDate: json['localDate'] == null
        ? null
        : DateTime.parse(json['localDate'] as String),
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    data: json['data'],
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ReportDataToJson(ReportData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  writeNotNull('localDate', instance.localDate?.toIso8601String());
  writeNotNull('dateTime', instance.dateTime?.toIso8601String());
  writeNotNull('data', instance.data);
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('type', instance.type);
  return val;
}

ReportDataForWorker _$ReportDataForWorkerFromJson(Map<String, dynamic> json) {
  return ReportDataForWorker(
    healthCode: json['healthCode'] as String?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    data: json['data'],
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ReportDataForWorkerToJson(ReportDataForWorker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('healthCode', instance.healthCode);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('dateTime', instance.dateTime?.toIso8601String());
  writeNotNull('data', instance.data);
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('type', instance.type);
  return val;
}

ReportIndex _$ReportIndexFromJson(Map<String, dynamic> json) {
  return ReportIndex(
    identifier: json['identifier'] as String?,
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    public: json['public'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ReportIndexToJson(ReportIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('public', instance.public);
  writeNotNull('type', instance.type);
  return val;
}

RequestInfo _$RequestInfoFromJson(Map<String, dynamic> json) {
  return RequestInfo(
    userId: json['userId'] as String?,
    clientInfo: json['clientInfo'] == null
        ? null
        : ClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>),
    userAgent: json['userAgent'] as String?,
    languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    userDataGroups: (json['userDataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    activitiesAccessedOn: json['activitiesAccessedOn'] == null
        ? null
        : DateTime.parse(json['activitiesAccessedOn'] as String),
    timelineAccessedOn: json['timelineAccessedOn'] == null
        ? null
        : DateTime.parse(json['timelineAccessedOn'] as String),
    signedInOn: json['signedInOn'] == null
        ? null
        : DateTime.parse(json['signedInOn'] as String),
    uploadedOn: json['uploadedOn'] == null
        ? null
        : DateTime.parse(json['uploadedOn'] as String),
    timeZone: json['timeZone'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$RequestInfoToJson(RequestInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('clientInfo', instance.clientInfo?.toJson());
  writeNotNull('userAgent', instance.userAgent);
  writeNotNull('languages', instance.languages);
  writeNotNull('userDataGroups', instance.userDataGroups);
  writeNotNull(
      'activitiesAccessedOn', instance.activitiesAccessedOn?.toIso8601String());
  writeNotNull(
      'timelineAccessedOn', instance.timelineAccessedOn?.toIso8601String());
  writeNotNull('signedInOn', instance.signedInOn?.toIso8601String());
  writeNotNull('uploadedOn', instance.uploadedOn?.toIso8601String());
  writeNotNull('timeZone', instance.timeZone);
  writeNotNull('type', instance.type);
  return val;
}

RequestParams _$RequestParamsFromJson(Map<String, dynamic> json) {
  return RequestParams(
    allOfGroups: (json['allOfGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    assessmentIds: (json['assessmentIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    assignmentFilter: json['assignmentFilter'] as bool?,
    currentTimestampsOnly: json['currentTimestampsOnly'] as bool?,
    emailFilter: json['emailFilter'] as String?,
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    endTime: json['endTime'] == null
        ? null
        : DateTime.parse(json['endTime'] as String),
    eventTimestamps: json['eventTimestamps'] as Map<String, dynamic>?,
    idFilter: json['idFilter'] as String?,
    includeDeleted: json['includeDeleted'] as bool?,
    includeRepeats: json['includeRepeats'] as bool?,
    instanceGuids: (json['instanceGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    language: json['language'] as String?,
    noneOfGroups: (json['noneOfGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    offsetBy: json['offsetBy'] as int?,
    offsetKey: json['offsetKey'] as String?,
    pageSize: json['pageSize'] as int?,
    phoneFilter: json['phoneFilter'] as String?,
    recordType: adherenceRecordTypeFromJson(json['recordType']),
    reportType: reportTypeFromJson(json['reportType']),
    scheduledOnStart: json['scheduledOnStart'] == null
        ? null
        : DateTime.parse(json['scheduledOnStart'] as String),
    scheduledOnEnd: json['scheduledOnEnd'] == null
        ? null
        : DateTime.parse(json['scheduledOnEnd'] as String),
    sessionGuids: (json['sessionGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    sortOrder: sortOrderFromJson(json['sortOrder']),
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    startTime: json['startTime'] == null
        ? null
        : DateTime.parse(json['startTime'] as String),
    studyId: json['studyId'] as String?,
    timeWindowGuids: (json['timeWindowGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    total: json['total'] as int?,
    summary: json['summary'] as bool?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    categories: resourceCategoryListFromJson(json['categories'] as List?),
    minRevision: json['minRevision'] as int?,
    maxRevision: json['maxRevision'] as int?,
    adminOnly: json['adminOnly'] as bool?,
    orgMembership: json['orgMembership'] as String?,
    externalIdFilter: json['externalIdFilter'] as String?,
    status: accountStatusFromJson(json['status']),
    enrollment: enrollmentFilterFromJson(json['enrollment']),
    attributeKey: json['attributeKey'] as String?,
    attributeValueFilter: json['attributeValueFilter'] as String?,
    predicate: searchTermPredicateFromJson(json['predicate']),
    stringSearchPosition:
        stringSearchPositionFromJson(json['stringSearchPosition']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$RequestParamsToJson(RequestParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allOfGroups', instance.allOfGroups);
  writeNotNull('assessmentIds', instance.assessmentIds);
  writeNotNull('assignmentFilter', instance.assignmentFilter);
  writeNotNull('currentTimestampsOnly', instance.currentTimestampsOnly);
  writeNotNull('emailFilter', instance.emailFilter);
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  writeNotNull('endTime', instance.endTime?.toIso8601String());
  writeNotNull('eventTimestamps', instance.eventTimestamps);
  writeNotNull('idFilter', instance.idFilter);
  writeNotNull('includeDeleted', instance.includeDeleted);
  writeNotNull('includeRepeats', instance.includeRepeats);
  writeNotNull('instanceGuids', instance.instanceGuids);
  writeNotNull('language', instance.language);
  writeNotNull('noneOfGroups', instance.noneOfGroups);
  writeNotNull('offsetBy', instance.offsetBy);
  writeNotNull('offsetKey', instance.offsetKey);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('phoneFilter', instance.phoneFilter);
  writeNotNull('recordType', adherenceRecordTypeToJson(instance.recordType));
  writeNotNull('reportType', reportTypeToJson(instance.reportType));
  writeNotNull(
      'scheduledOnStart', instance.scheduledOnStart?.toIso8601String());
  writeNotNull('scheduledOnEnd', instance.scheduledOnEnd?.toIso8601String());
  writeNotNull('sessionGuids', instance.sessionGuids);
  writeNotNull('sortOrder', sortOrderToJson(instance.sortOrder));
  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('startTime', instance.startTime?.toIso8601String());
  writeNotNull('studyId', instance.studyId);
  writeNotNull('timeWindowGuids', instance.timeWindowGuids);
  writeNotNull('total', instance.total);
  writeNotNull('summary', instance.summary);
  writeNotNull('tags', instance.tags);
  writeNotNull('categories', resourceCategoryListToJson(instance.categories));
  writeNotNull('minRevision', instance.minRevision);
  writeNotNull('maxRevision', instance.maxRevision);
  writeNotNull('adminOnly', instance.adminOnly);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('externalIdFilter', instance.externalIdFilter);
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('enrollment', enrollmentFilterToJson(instance.enrollment));
  writeNotNull('attributeKey', instance.attributeKey);
  writeNotNull('attributeValueFilter', instance.attributeValueFilter);
  writeNotNull('predicate', searchTermPredicateToJson(instance.predicate));
  writeNotNull('stringSearchPosition',
      stringSearchPositionToJson(instance.stringSearchPosition));
  writeNotNull('type', instance.type);
  return val;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    label: json['label'] as String?,
    scheduleType: scheduleTypeFromJson(json['scheduleType']),
    eventId: json['eventId'] as String?,
    delay: json['delay'] as String?,
    interval: json['interval'] as String?,
    sequencePeriod: json['sequencePeriod'] as String?,
    expires: json['expires'] as String?,
    cronTrigger: json['cronTrigger'] as String?,
    startsOn: json['startsOn'] == null
        ? null
        : DateTime.parse(json['startsOn'] as String),
    endsOn: json['endsOn'] == null
        ? null
        : DateTime.parse(json['endsOn'] as String),
    times:
        (json['times'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    persistent: json['persistent'] as bool?,
    activities: (json['activities'] as List<dynamic>?)
            ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  writeNotNull('scheduleType', scheduleTypeToJson(instance.scheduleType));
  writeNotNull('eventId', instance.eventId);
  writeNotNull('delay', instance.delay);
  writeNotNull('interval', instance.interval);
  writeNotNull('sequencePeriod', instance.sequencePeriod);
  writeNotNull('expires', instance.expires);
  writeNotNull('cronTrigger', instance.cronTrigger);
  writeNotNull('startsOn', instance.startsOn?.toIso8601String());
  writeNotNull('endsOn', instance.endsOn?.toIso8601String());
  writeNotNull('times', instance.times);
  writeNotNull('persistent', instance.persistent);
  writeNotNull(
      'activities', instance.activities?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

Schedule2 _$Schedule2FromJson(Map<String, dynamic> json) {
  return Schedule2(
    ownerId: json['ownerId'] as String?,
    name: json['name'] as String?,
    guid: json['guid'] as String?,
    duration: json['duration'] as String?,
    published: json['published'] as bool?,
    deleted: json['deleted'] as bool?,
    clientData: json['clientData'] as Map<String, dynamic>?,
    studyBursts: (json['studyBursts'] as List<dynamic>?)
            ?.map((e) => StudyBurst.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    sessions: (json['sessions'] as List<dynamic>?)
            ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$Schedule2ToJson(Schedule2 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ownerId', instance.ownerId);
  writeNotNull('name', instance.name);
  writeNotNull('guid', instance.guid);
  writeNotNull('duration', instance.duration);
  writeNotNull('published', instance.published);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('clientData', instance.clientData);
  writeNotNull(
      'studyBursts', instance.studyBursts?.map((e) => e.toJson()).toList());
  writeNotNull('sessions', instance.sessions?.map((e) => e.toJson()).toList());
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

ScheduleCriteria _$ScheduleCriteriaFromJson(Map<String, dynamic> json) {
  return ScheduleCriteria(
    criteria: json['criteria'] == null
        ? null
        : Criteria.fromJson(json['criteria'] as Map<String, dynamic>),
    schedule: json['schedule'] == null
        ? null
        : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduleCriteriaToJson(ScheduleCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('criteria', instance.criteria?.toJson());
  writeNotNull('schedule', instance.schedule?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ScheduledAssessment _$ScheduledAssessmentFromJson(Map<String, dynamic> json) {
  return ScheduledAssessment(
    refKey: json['refKey'] as String?,
    instanceGuid: json['instanceGuid'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduledAssessmentToJson(ScheduledAssessment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refKey', instance.refKey);
  writeNotNull('instanceGuid', instance.instanceGuid);
  writeNotNull('type', instance.type);
  return val;
}

ScheduledSession _$ScheduledSessionFromJson(Map<String, dynamic> json) {
  return ScheduledSession(
    refGuid: json['refGuid'] as String?,
    instanceGuid: json['instanceGuid'] as String?,
    startEventId: json['startEventId'] as String?,
    startDay: json['startDay'] as int?,
    endDay: json['endDay'] as int?,
    startTime: json['startTime'] as String?,
    delayTime: json['delayTime'] as String?,
    expiration: json['expiration'] as String?,
    persistent: json['persistent'] as bool?,
    studyBurstId: json['studyBurstId'] as String?,
    studyBurstNum: json['studyBurstNum'] as int?,
    timeWindowGuid: json['timeWindowGuid'] as String?,
    assessments: (json['assessments'] as List<dynamic>?)
            ?.map(
                (e) => ScheduledAssessment.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduledSessionToJson(ScheduledSession instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refGuid', instance.refGuid);
  writeNotNull('instanceGuid', instance.instanceGuid);
  writeNotNull('startEventId', instance.startEventId);
  writeNotNull('startDay', instance.startDay);
  writeNotNull('endDay', instance.endDay);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('delayTime', instance.delayTime);
  writeNotNull('expiration', instance.expiration);
  writeNotNull('persistent', instance.persistent);
  writeNotNull('studyBurstId', instance.studyBurstId);
  writeNotNull('studyBurstNum', instance.studyBurstNum);
  writeNotNull('timeWindowGuid', instance.timeWindowGuid);
  writeNotNull(
      'assessments', instance.assessments?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

SchedulePlan _$SchedulePlanFromJson(Map<String, dynamic> json) {
  return SchedulePlan(
    guid: json['guid'] as String?,
    label: json['label'] as String?,
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    deleted: json['deleted'] as bool?,
    strategy: json['strategy'] == null
        ? null
        : ScheduleStrategy.fromJson(json['strategy'] as Map<String, dynamic>),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SchedulePlanToJson(SchedulePlan instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('label', instance.label);
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('deleted', instance.deleted);
  writeNotNull('strategy', instance.strategy?.toJson());
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

ScheduleStrategy _$ScheduleStrategyFromJson(Map<String, dynamic> json) {
  return ScheduleStrategy(
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduleStrategyToJson(ScheduleStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  return val;
}

ScheduledActivity _$ScheduledActivityFromJson(Map<String, dynamic> json) {
  return ScheduledActivity(
    guid: json['guid'] as String?,
    schedulePlanGuid: json['schedulePlanGuid'] as String?,
    startedOn: json['startedOn'] == null
        ? null
        : DateTime.parse(json['startedOn'] as String),
    finishedOn: json['finishedOn'] == null
        ? null
        : DateTime.parse(json['finishedOn'] as String),
    scheduledOn: json['scheduledOn'] == null
        ? null
        : DateTime.parse(json['scheduledOn'] as String),
    expiresOn: json['expiresOn'] == null
        ? null
        : DateTime.parse(json['expiresOn'] as String),
    activity: json['activity'] == null
        ? null
        : Activity.fromJson(json['activity'] as Map<String, dynamic>),
    persistent: json['persistent'] as bool?,
    clientData: json['clientData'],
    status: scheduleStatusFromJson(json['status']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduledActivityToJson(ScheduledActivity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('schedulePlanGuid', instance.schedulePlanGuid);
  writeNotNull('startedOn', instance.startedOn?.toIso8601String());
  writeNotNull('finishedOn', instance.finishedOn?.toIso8601String());
  writeNotNull('scheduledOn', instance.scheduledOn?.toIso8601String());
  writeNotNull('expiresOn', instance.expiresOn?.toIso8601String());
  writeNotNull('activity', instance.activity?.toJson());
  writeNotNull('persistent', instance.persistent);
  writeNotNull('clientData', instance.clientData);
  writeNotNull('status', scheduleStatusToJson(instance.status));
  writeNotNull('type', instance.type);
  return val;
}

SchemaReference _$SchemaReferenceFromJson(Map<String, dynamic> json) {
  return SchemaReference(
    id: json['id'] as String?,
    revision: json['revision'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SchemaReferenceToJson(SchemaReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('revision', instance.revision);
  writeNotNull('type', instance.type);
  return val;
}

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    guid: json['guid'] as String?,
    name: json['name'] as String?,
    symbol: json['symbol'] as String?,
    labels: (json['labels'] as List<dynamic>?)
            ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    startEventIds: (json['startEventIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    studyBurstIds: (json['studyBurstIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    delay: json['delay'] as String?,
    interval: json['interval'] as String?,
    occurrences: json['occurrences'] as int?,
    performanceOrder: performanceOrderFromJson(json['performanceOrder']),
    timeWindows: (json['timeWindows'] as List<dynamic>?)
            ?.map((e) => TimeWindow.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    assessments: (json['assessments'] as List<dynamic>?)
            ?.map(
                (e) => AssessmentReference2.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    notifications: (json['notifications'] as List<dynamic>?)
            ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('name', instance.name);
  writeNotNull('symbol', instance.symbol);
  writeNotNull('labels', instance.labels?.map((e) => e.toJson()).toList());
  writeNotNull('startEventIds', instance.startEventIds);
  writeNotNull('studyBurstIds', instance.studyBurstIds);
  writeNotNull('delay', instance.delay);
  writeNotNull('interval', instance.interval);
  writeNotNull('occurrences', instance.occurrences);
  writeNotNull(
      'performanceOrder', performanceOrderToJson(instance.performanceOrder));
  writeNotNull(
      'timeWindows', instance.timeWindows?.map((e) => e.toJson()).toList());
  writeNotNull(
      'assessments', instance.assessments?.map((e) => e.toJson()).toList());
  writeNotNull(
      'notifications', instance.notifications?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

SessionInfo _$SessionInfoFromJson(Map<String, dynamic> json) {
  return SessionInfo(
    guid: json['guid'] as String?,
    label: json['label'] as String?,
    symbol: json['symbol'] as String?,
    performanceOrder: performanceOrderFromJson(json['performanceOrder']),
    timeWindowGuids: (json['timeWindowGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    minutesToComplete: json['minutesToComplete'] as int?,
    notifications: (json['notifications'] as List<dynamic>?)
            ?.map((e) => NotificationInfo.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SessionInfoToJson(SessionInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('label', instance.label);
  writeNotNull('symbol', instance.symbol);
  writeNotNull(
      'performanceOrder', performanceOrderToJson(instance.performanceOrder));
  writeNotNull('timeWindowGuids', instance.timeWindowGuids);
  writeNotNull('minutesToComplete', instance.minutesToComplete);
  writeNotNull(
      'notifications', instance.notifications?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

SharedModuleImportStatus _$SharedModuleImportStatusFromJson(
    Map<String, dynamic> json) {
  return SharedModuleImportStatus(
    moduleType: sharedModuleTypeFromJson(json['moduleType']),
    schemaId: json['schemaId'] as String?,
    schemaRevision: json['schemaRevision'] as int?,
    surveyCreatedOn: json['surveyCreatedOn'] as String?,
    surveyGuid: json['surveyGuid'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SharedModuleImportStatusToJson(
    SharedModuleImportStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('moduleType', sharedModuleTypeToJson(instance.moduleType));
  writeNotNull('schemaId', instance.schemaId);
  writeNotNull('schemaRevision', instance.schemaRevision);
  writeNotNull('surveyCreatedOn', instance.surveyCreatedOn);
  writeNotNull('surveyGuid', instance.surveyGuid);
  writeNotNull('type', instance.type);
  return val;
}

SharedModuleMetadata _$SharedModuleMetadataFromJson(Map<String, dynamic> json) {
  return SharedModuleMetadata(
    id: json['id'] as String?,
    licenseRestricted: json['licenseRestricted'] as bool?,
    moduleType: sharedModuleTypeFromJson(json['moduleType']),
    name: json['name'] as String?,
    notes: json['notes'] as String?,
    os: json['os'] as String?,
    published: json['published'] as bool?,
    schemaId: json['schemaId'] as String?,
    schemaRevision: json['schemaRevision'] as int?,
    surveyCreatedOn: json['surveyCreatedOn'] as String?,
    surveyGuid: json['surveyGuid'] as String?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    deleted: json['deleted'] as bool?,
    version: json['version'] as int?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SharedModuleMetadataToJson(
    SharedModuleMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('licenseRestricted', instance.licenseRestricted);
  writeNotNull('moduleType', sharedModuleTypeToJson(instance.moduleType));
  writeNotNull('name', instance.name);
  writeNotNull('notes', instance.notes);
  writeNotNull('os', instance.os);
  writeNotNull('published', instance.published);
  writeNotNull('schemaId', instance.schemaId);
  writeNotNull('schemaRevision', instance.schemaRevision);
  writeNotNull('surveyCreatedOn', instance.surveyCreatedOn);
  writeNotNull('surveyGuid', instance.surveyGuid);
  writeNotNull('tags', instance.tags);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

SharingScopeForm _$SharingScopeFormFromJson(Map<String, dynamic> json) {
  return SharingScopeForm(
    scope: sharingScopeFromJson(json['scope']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SharingScopeFormToJson(SharingScopeForm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scope', sharingScopeToJson(instance.scope));
  writeNotNull('type', instance.type);
  return val;
}

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return SignIn(
    appId: json['appId'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    externalId: json['externalId'] as String?,
    password: json['password'] as String?,
    reauthToken: json['reauthToken'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SignInToJson(SignIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('externalId', instance.externalId);
  writeNotNull('password', instance.password);
  writeNotNull('reauthToken', instance.reauthToken);
  writeNotNull('type', instance.type);
  return val;
}

SignUp _$SignUpFromJson(Map<String, dynamic> json) {
  return SignUp(
    appId: json['appId'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    externalId: json['externalId'] as String?,
    password: json['password'] as String?,
    consent: json['consent'] as bool?,
    type: json['type'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    synapseUserId: json['synapseUserId'] as String?,
    id: json['id'] as String?,
    notifyByEmail: json['notifyByEmail'] as bool? ?? true,
    attributes: json['attributes'] as Map<String, dynamic>?,
    sharingScope: sharingScopeFromJson(json['sharingScope']),
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    emailVerified: json['emailVerified'] as bool?,
    phoneVerified: json['phoneVerified'] as bool?,
    status: accountStatusFromJson(json['status']),
    roles: roleListFromJson(json['roles'] as List?),
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    clientData: json['clientData'] as Map<String, dynamic>?,
    languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    externalIds: json['externalIds'] as Map<String, dynamic>?,
    orgMembership: json['orgMembership'] as String?,
    note: json['note'] as String?,
    clientTimeZone: json['clientTimeZone'] as String?,
  );
}

Map<String, dynamic> _$SignUpToJson(SignUp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appId', instance.appId);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('externalId', instance.externalId);
  writeNotNull('password', instance.password);
  writeNotNull('consent', instance.consent);
  writeNotNull('type', instance.type);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('synapseUserId', instance.synapseUserId);
  writeNotNull('id', instance.id);
  writeNotNull('notifyByEmail', instance.notifyByEmail);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('sharingScope', sharingScopeToJson(instance.sharingScope));
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('emailVerified', instance.emailVerified);
  writeNotNull('phoneVerified', instance.phoneVerified);
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('roles', roleListToJson(instance.roles));
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('clientData', instance.clientData);
  writeNotNull('languages', instance.languages);
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('externalIds', instance.externalIds);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('note', instance.note);
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  return val;
}

SimpleScheduleStrategy _$SimpleScheduleStrategyFromJson(
    Map<String, dynamic> json) {
  return SimpleScheduleStrategy(
    schedule: json['schedule'] == null
        ? null
        : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SimpleScheduleStrategyToJson(
    SimpleScheduleStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('schedule', instance.schedule?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

SmsMessage _$SmsMessageFromJson(Map<String, dynamic> json) {
  return SmsMessage(
    phoneNumber: json['phoneNumber'] as String?,
    sentOn: json['sentOn'] == null
        ? null
        : DateTime.parse(json['sentOn'] as String),
    healthCode: json['healthCode'] as String?,
    messageBody: json['messageBody'] as String?,
    messageId: json['messageId'] as String?,
    smsType: smsTypeFromJson(json['smsType']),
    appId: json['appId'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SmsMessageToJson(SmsMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('sentOn', instance.sentOn?.toIso8601String());
  writeNotNull('healthCode', instance.healthCode);
  writeNotNull('messageBody', instance.messageBody);
  writeNotNull('messageId', instance.messageId);
  writeNotNull('smsType', smsTypeToJson(instance.smsType));
  writeNotNull('appId', instance.appId);
  writeNotNull('type', instance.type);
  return val;
}

SmsTemplate _$SmsTemplateFromJson(Map<String, dynamic> json) {
  return SmsTemplate(
    message: json['message'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SmsTemplateToJson(SmsTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('type', instance.type);
  return val;
}

StudyActivityEventRequest _$StudyActivityEventRequestFromJson(
    Map<String, dynamic> json) {
  return StudyActivityEventRequest(
    eventId: json['eventId'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    answerValue: json['answerValue'] as String?,
    clientTimeZone: json['clientTimeZone'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyActivityEventRequestToJson(
    StudyActivityEventRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventId', instance.eventId);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('answerValue', instance.answerValue);
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  writeNotNull('type', instance.type);
  return val;
}

StudyBurst _$StudyBurstFromJson(Map<String, dynamic> json) {
  return StudyBurst(
    identifier: json['identifier'] as String?,
    originEventId: json['originEventId'] as String?,
    delay: json['delay'] as String?,
    interval: json['interval'] as String?,
    occurrences: json['occurrences'] as int?,
    updateType: activityEventUpdateTypeFromJson(json['updateType']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyBurstToJson(StudyBurst instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('originEventId', instance.originEventId);
  writeNotNull('delay', instance.delay);
  writeNotNull('interval', instance.interval);
  writeNotNull('occurrences', instance.occurrences);
  writeNotNull(
      'updateType', activityEventUpdateTypeToJson(instance.updateType));
  writeNotNull('type', instance.type);
  return val;
}

StudyBurstInfo _$StudyBurstInfoFromJson(Map<String, dynamic> json) {
  return StudyBurstInfo(
    identifier: json['identifier'] as String?,
    originEventId: json['originEventId'] as String?,
    delay: json['delay'] as String?,
    interval: json['interval'] as String?,
    occurrences: json['occurrences'] as int?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyBurstInfoToJson(StudyBurstInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('originEventId', instance.originEventId);
  writeNotNull('delay', instance.delay);
  writeNotNull('interval', instance.interval);
  writeNotNull('occurrences', instance.occurrences);
  writeNotNull('type', instance.type);
  return val;
}

StudyConsent _$StudyConsentFromJson(Map<String, dynamic> json) {
  return StudyConsent(
    subpopulationGuid: json['subpopulationGuid'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    documentContent: json['documentContent'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyConsentToJson(StudyConsent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subpopulationGuid', instance.subpopulationGuid);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('documentContent', instance.documentContent);
  writeNotNull('type', instance.type);
  return val;
}

StudyParticipant _$StudyParticipantFromJson(Map<String, dynamic> json) {
  return StudyParticipant(
    healthCode: json['healthCode'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    consentHistories: json['consentHistories'] as Map<String, dynamic>?,
    enrollments: json['enrollments'] as Map<String, dynamic>?,
    consented: json['consented'] as bool?,
    timeZone: json['timeZone'] as String?,
    type: json['type'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    synapseUserId: json['synapseUserId'] as String?,
    id: json['id'] as String?,
    notifyByEmail: json['notifyByEmail'] as bool? ?? true,
    attributes: json['attributes'] as Map<String, dynamic>?,
    sharingScope: sharingScopeFromJson(json['sharingScope']),
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    emailVerified: json['emailVerified'] as bool?,
    phoneVerified: json['phoneVerified'] as bool?,
    status: accountStatusFromJson(json['status']),
    roles: roleListFromJson(json['roles'] as List?),
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    clientData: json['clientData'] as Map<String, dynamic>?,
    languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    externalIds: json['externalIds'] as Map<String, dynamic>?,
    orgMembership: json['orgMembership'] as String?,
    note: json['note'] as String?,
    clientTimeZone: json['clientTimeZone'] as String?,
  );
}

Map<String, dynamic> _$StudyParticipantToJson(StudyParticipant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('healthCode', instance.healthCode);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('consentHistories', instance.consentHistories);
  writeNotNull('enrollments', instance.enrollments);
  writeNotNull('consented', instance.consented);
  writeNotNull('timeZone', instance.timeZone);
  writeNotNull('type', instance.type);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('synapseUserId', instance.synapseUserId);
  writeNotNull('id', instance.id);
  writeNotNull('notifyByEmail', instance.notifyByEmail);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('sharingScope', sharingScopeToJson(instance.sharingScope));
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('emailVerified', instance.emailVerified);
  writeNotNull('phoneVerified', instance.phoneVerified);
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('roles', roleListToJson(instance.roles));
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('clientData', instance.clientData);
  writeNotNull('languages', instance.languages);
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('externalIds', instance.externalIds);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('note', instance.note);
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  return val;
}

Subpopulation _$SubpopulationFromJson(Map<String, dynamic> json) {
  return Subpopulation(
    guid: json['guid'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    criteria: json['criteria'] == null
        ? null
        : Criteria.fromJson(json['criteria'] as Map<String, dynamic>),
    autoSendConsentSuppressed:
        json['autoSendConsentSuppressed'] as bool? ?? false,
    required: json['required'] as bool?,
    defaultGroup: json['defaultGroup'] as bool?,
    publishedConsentCreatedOn: json['publishedConsentCreatedOn'] == null
        ? null
        : DateTime.parse(json['publishedConsentCreatedOn'] as String),
    dataGroupsAssignedWhileConsented:
        (json['dataGroupsAssignedWhileConsented'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
    studyIdsAssignedOnConsent:
        (json['studyIdsAssignedOnConsent'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
    version: json['version'] as num?,
    consentHTML: json['consentHTML'] as String?,
    consentPDF: json['consentPDF'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SubpopulationToJson(Subpopulation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('criteria', instance.criteria?.toJson());
  writeNotNull('autoSendConsentSuppressed', instance.autoSendConsentSuppressed);
  writeNotNull('required', instance.required);
  writeNotNull('defaultGroup', instance.defaultGroup);
  writeNotNull('publishedConsentCreatedOn',
      instance.publishedConsentCreatedOn?.toIso8601String());
  writeNotNull('dataGroupsAssignedWhileConsented',
      instance.dataGroupsAssignedWhileConsented);
  writeNotNull('studyIdsAssignedOnConsent', instance.studyIdsAssignedOnConsent);
  writeNotNull('version', instance.version);
  writeNotNull('consentHTML', instance.consentHTML);
  writeNotNull('consentPDF', instance.consentPDF);
  writeNotNull('type', instance.type);
  return val;
}

SubscriptionRequest _$SubscriptionRequestFromJson(Map<String, dynamic> json) {
  return SubscriptionRequest(
    topicGuids: (json['topicGuids'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SubscriptionRequestToJson(SubscriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('topicGuids', instance.topicGuids);
  writeNotNull('type', instance.type);
  return val;
}

SubscriptionStatus _$SubscriptionStatusFromJson(Map<String, dynamic> json) {
  return SubscriptionStatus(
    topicGuid: json['topicGuid'] as String?,
    topicName: json['topicName'] as String?,
    subscribed: json['subscribed'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SubscriptionStatusToJson(SubscriptionStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('topicGuid', instance.topicGuid);
  writeNotNull('topicName', instance.topicName);
  writeNotNull('subscribed', instance.subscribed);
  writeNotNull('type', instance.type);
  return val;
}

Study _$StudyFromJson(Map<String, dynamic> json) {
  return Study(
    identifier: json['identifier'] as String?,
    name: json['name'] as String?,
    details: json['details'] as String?,
    phase: studyPhaseFromJson(json['phase']),
    clientData: json['clientData'] as Map<String, dynamic>?,
    studyTimeZone: json['studyTimeZone'] as String?,
    adherenceThresholdPercentage: json['adherenceThresholdPercentage'] as int?,
    irbName: json['irbName'] as String?,
    irbDecisionOn: json['irbDecisionOn'] == null
        ? null
        : DateTime.parse(json['irbDecisionOn'] as String),
    irbExpiresOn: json['irbExpiresOn'] == null
        ? null
        : DateTime.parse(json['irbExpiresOn'] as String),
    irbDecisionType: irbDecisionTypeFromJson(json['irbDecisionType']),
    irbProtocolName: json['irbProtocolName'] as String?,
    irbProtocolId: json['irbProtocolId'] as String?,
    studyLogoUrl: json['studyLogoUrl'] as String?,
    colorScheme: json['colorScheme'] == null
        ? null
        : ColorScheme.fromJson(json['colorScheme'] as Map<String, dynamic>),
    institutionId: json['institutionId'] as String?,
    scheduleGuid: json['scheduleGuid'] as String?,
    keywords: json['keywords'] as String?,
    diseases: (json['diseases'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    studyDesignTypes: (json['studyDesignTypes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    signInTypes: signInTypeListFromJson(json['signInTypes'] as List?),
    contacts: (json['contacts'] as List<dynamic>?)
            ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    customEvents: (json['customEvents'] as List<dynamic>?)
            ?.map((e) => CustomEvent.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    deleted: json['deleted'] as bool?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyToJson(Study instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('name', instance.name);
  writeNotNull('details', instance.details);
  writeNotNull('phase', studyPhaseToJson(instance.phase));
  writeNotNull('clientData', instance.clientData);
  writeNotNull('studyTimeZone', instance.studyTimeZone);
  writeNotNull(
      'adherenceThresholdPercentage', instance.adherenceThresholdPercentage);
  writeNotNull('irbName', instance.irbName);
  writeNotNull('irbDecisionOn', instance.irbDecisionOn?.toIso8601String());
  writeNotNull('irbExpiresOn', instance.irbExpiresOn?.toIso8601String());
  writeNotNull(
      'irbDecisionType', irbDecisionTypeToJson(instance.irbDecisionType));
  writeNotNull('irbProtocolName', instance.irbProtocolName);
  writeNotNull('irbProtocolId', instance.irbProtocolId);
  writeNotNull('studyLogoUrl', instance.studyLogoUrl);
  writeNotNull('colorScheme', instance.colorScheme?.toJson());
  writeNotNull('institutionId', instance.institutionId);
  writeNotNull('scheduleGuid', instance.scheduleGuid);
  writeNotNull('keywords', instance.keywords);
  writeNotNull('diseases', instance.diseases);
  writeNotNull('studyDesignTypes', instance.studyDesignTypes);
  writeNotNull('signInTypes', signInTypeListToJson(instance.signInTypes));
  writeNotNull('contacts', instance.contacts?.map((e) => e.toJson()).toList());
  writeNotNull(
      'customEvents', instance.customEvents?.map((e) => e.toJson()).toList());
  writeNotNull('deleted', instance.deleted);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

StudyActivityEvent _$StudyActivityEventFromJson(Map<String, dynamic> json) {
  return StudyActivityEvent(
    eventId: json['eventId'] as String?,
    answerValue: json['answerValue'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    updateType: activityEventUpdateTypeFromJson(json['updateType']),
    clientTimeZone: json['clientTimeZone'] as String?,
    originEventId: json['originEventId'] as String?,
    studyBurstId: json['studyBurstId'] as String?,
    periodFromOrigin: json['periodFromOrigin'] as String?,
    recordCount: json['recordCount'] as int?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyActivityEventToJson(StudyActivityEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventId', instance.eventId);
  writeNotNull('answerValue', instance.answerValue);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull(
      'updateType', activityEventUpdateTypeToJson(instance.updateType));
  writeNotNull('clientTimeZone', instance.clientTimeZone);
  writeNotNull('originEventId', instance.originEventId);
  writeNotNull('studyBurstId', instance.studyBurstId);
  writeNotNull('periodFromOrigin', instance.periodFromOrigin);
  writeNotNull('recordCount', instance.recordCount);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

StudyInfo _$StudyInfoFromJson(Map<String, dynamic> json) {
  return StudyInfo(
    identifier: json['identifier'] as String?,
    name: json['name'] as String?,
    details: json['details'] as String?,
    phase: studyPhaseFromJson(json['phase']),
    studyLogoUrl: json['studyLogoUrl'] as String?,
    colorScheme: json['colorScheme'] == null
        ? null
        : ColorScheme.fromJson(json['colorScheme'] as Map<String, dynamic>),
    signInTypes: signInTypeListFromJson(json['signInTypes'] as List?),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyInfoToJson(StudyInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('name', instance.name);
  writeNotNull('details', instance.details);
  writeNotNull('phase', studyPhaseToJson(instance.phase));
  writeNotNull('studyLogoUrl', instance.studyLogoUrl);
  writeNotNull('colorScheme', instance.colorScheme?.toJson());
  writeNotNull('signInTypes', signInTypeListToJson(instance.signInTypes));
  writeNotNull('type', instance.type);
  return val;
}

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return Survey(
    guid: json['guid'] as String?,
    moduleId: json['moduleId'] as String?,
    moduleVersion: json['moduleVersion'] as int?,
    name: json['name'] as String?,
    identifier: json['identifier'] as String?,
    published: json['published'] as bool?,
    schemaRevision: json['schemaRevision'] as num?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    copyrightNotice: json['copyrightNotice'] as String?,
    deleted: json['deleted'] as bool?,
    version: json['version'] as num?,
    elements: (json['elements'] as List<dynamic>?)
            ?.map((e) => SurveyElement.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyToJson(Survey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('moduleId', instance.moduleId);
  writeNotNull('moduleVersion', instance.moduleVersion);
  writeNotNull('name', instance.name);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('published', instance.published);
  writeNotNull('schemaRevision', instance.schemaRevision);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull('copyrightNotice', instance.copyrightNotice);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('version', instance.version);
  writeNotNull('elements', instance.elements?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

SurveyElement _$SurveyElementFromJson(Map<String, dynamic> json) {
  return SurveyElement(
    guid: json['guid'] as String?,
    beforeRules: (json['beforeRules'] as List<dynamic>?)
            ?.map((e) => SurveyRule.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    afterRules: (json['afterRules'] as List<dynamic>?)
            ?.map((e) => SurveyRule.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    identifier: json['identifier'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyElementToJson(SurveyElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull(
      'beforeRules', instance.beforeRules?.map((e) => e.toJson()).toList());
  writeNotNull(
      'afterRules', instance.afterRules?.map((e) => e.toJson()).toList());
  writeNotNull('identifier', instance.identifier);
  writeNotNull('type', instance.type);
  return val;
}

SurveyInfoScreen _$SurveyInfoScreenFromJson(Map<String, dynamic> json) {
  return SurveyInfoScreen(
    title: json['title'] as String?,
    prompt: json['prompt'] as String?,
    promptDetail: json['promptDetail'] as String?,
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
    guid: json['guid'] as String?,
    beforeRules: (json['beforeRules'] as List<dynamic>?)
            ?.map((e) => SurveyRule.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    afterRules: (json['afterRules'] as List<dynamic>?)
            ?.map((e) => SurveyRule.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    identifier: json['identifier'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyInfoScreenToJson(SurveyInfoScreen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('prompt', instance.prompt);
  writeNotNull('promptDetail', instance.promptDetail);
  writeNotNull('image', instance.image?.toJson());
  writeNotNull('guid', instance.guid);
  writeNotNull(
      'beforeRules', instance.beforeRules?.map((e) => e.toJson()).toList());
  writeNotNull(
      'afterRules', instance.afterRules?.map((e) => e.toJson()).toList());
  writeNotNull('identifier', instance.identifier);
  writeNotNull('type', instance.type);
  return val;
}

SurveyQuestion _$SurveyQuestionFromJson(Map<String, dynamic> json) {
  return SurveyQuestion(
    title: json['title'] as String?,
    prompt: json['prompt'] as String?,
    promptDetail: json['promptDetail'] as String?,
    uiHint: uIHintFromJson(json['uiHint']),
    constraints: json['constraints'] == null
        ? null
        : Constraints.fromJson(json['constraints'] as Map<String, dynamic>),
    guid: json['guid'] as String?,
    beforeRules: (json['beforeRules'] as List<dynamic>?)
            ?.map((e) => SurveyRule.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    afterRules: (json['afterRules'] as List<dynamic>?)
            ?.map((e) => SurveyRule.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    identifier: json['identifier'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyQuestionToJson(SurveyQuestion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('prompt', instance.prompt);
  writeNotNull('promptDetail', instance.promptDetail);
  writeNotNull('uiHint', uIHintToJson(instance.uiHint));
  writeNotNull('constraints', instance.constraints?.toJson());
  writeNotNull('guid', instance.guid);
  writeNotNull(
      'beforeRules', instance.beforeRules?.map((e) => e.toJson()).toList());
  writeNotNull(
      'afterRules', instance.afterRules?.map((e) => e.toJson()).toList());
  writeNotNull('identifier', instance.identifier);
  writeNotNull('type', instance.type);
  return val;
}

SurveyQuestionOption _$SurveyQuestionOptionFromJson(Map<String, dynamic> json) {
  return SurveyQuestionOption(
    label: json['label'] as String?,
    detail: json['detail'] as String?,
    value: json['value'] as String?,
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
    exclusive: json['exclusive'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyQuestionOptionToJson(
    SurveyQuestionOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  writeNotNull('detail', instance.detail);
  writeNotNull('value', instance.value);
  writeNotNull('image', instance.image?.toJson());
  writeNotNull('exclusive', instance.exclusive);
  writeNotNull('type', instance.type);
  return val;
}

SurveyReference _$SurveyReferenceFromJson(Map<String, dynamic> json) {
  return SurveyReference(
    identifier: json['identifier'] as String?,
    guid: json['guid'] as String?,
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    href: json['href'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyReferenceToJson(SurveyReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('guid', instance.guid);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('href', instance.href);
  writeNotNull('type', instance.type);
  return val;
}

SurveyRule _$SurveyRuleFromJson(Map<String, dynamic> json) {
  return SurveyRule(
    $Operator: operatorFromJson(json['operator']),
    value: json['value'] as String?,
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    skipTo: json['skipTo'] as String?,
    endSurvey: json['endSurvey'] as bool?,
    displayIf: json['displayIf'] as bool?,
    displayUnless: json['displayUnless'] as bool?,
    assignDataGroup: json['assignDataGroup'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyRuleToJson(SurveyRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('operator', operatorToJson(instance.$Operator));
  writeNotNull('value', instance.value);
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('skipTo', instance.skipTo);
  writeNotNull('endSurvey', instance.endSurvey);
  writeNotNull('displayIf', instance.displayIf);
  writeNotNull('displayUnless', instance.displayUnless);
  writeNotNull('assignDataGroup', instance.assignDataGroup);
  writeNotNull('type', instance.type);
  return val;
}

TaskReference _$TaskReferenceFromJson(Map<String, dynamic> json) {
  return TaskReference(
    identifier: json['identifier'] as String?,
    schema: json['schema'] == null
        ? null
        : SchemaReference.fromJson(json['schema'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$TaskReferenceToJson(TaskReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('schema', instance.schema?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

Template _$TemplateFromJson(Map<String, dynamic> json) {
  return Template(
    guid: json['guid'] as String?,
    templateType: templateTypeFromJson(json['templateType']),
    name: json['name'] as String?,
    description: json['description'] as String?,
    criteria: json['criteria'] == null
        ? null
        : Criteria.fromJson(json['criteria'] as Map<String, dynamic>),
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    modifiedOn: json['modifiedOn'] == null
        ? null
        : DateTime.parse(json['modifiedOn'] as String),
    publishedCreatedOn: json['publishedCreatedOn'] == null
        ? null
        : DateTime.parse(json['publishedCreatedOn'] as String),
    deleted: json['deleted'] as bool?,
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$TemplateToJson(Template instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('templateType', templateTypeToJson(instance.templateType));
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('criteria', instance.criteria?.toJson());
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('modifiedOn', instance.modifiedOn?.toIso8601String());
  writeNotNull(
      'publishedCreatedOn', instance.publishedCreatedOn?.toIso8601String());
  writeNotNull('deleted', instance.deleted);
  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

TemplateRevision _$TemplateRevisionFromJson(Map<String, dynamic> json) {
  return TemplateRevision(
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    createdBy: json['createdBy'] as String?,
    documentContent: json['documentContent'] as String?,
    subject: json['subject'] as String?,
    mimeType: mimeTypeFromJson(json['mimeType']),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$TemplateRevisionToJson(TemplateRevision instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('documentContent', instance.documentContent);
  writeNotNull('subject', instance.subject);
  writeNotNull('mimeType', mimeTypeToJson(instance.mimeType));
  writeNotNull('type', instance.type);
  return val;
}

Timeline _$TimelineFromJson(Map<String, dynamic> json) {
  return Timeline(
    duration: json['duration'] as String?,
    schedule: (json['schedule'] as List<dynamic>?)
            ?.map((e) => ScheduledSession.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    assessments: (json['assessments'] as List<dynamic>?)
            ?.map((e) => AssessmentInfo.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    sessions: (json['sessions'] as List<dynamic>?)
            ?.map((e) => SessionInfo.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    studyBursts: (json['studyBursts'] as List<dynamic>?)
            ?.map((e) => StudyBurstInfo.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    totalMinutes: json['totalMinutes'] as int?,
    totalNotifications: json['totalNotifications'] as int?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$TimelineToJson(Timeline instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('duration', instance.duration);
  writeNotNull('schedule', instance.schedule?.map((e) => e.toJson()).toList());
  writeNotNull(
      'assessments', instance.assessments?.map((e) => e.toJson()).toList());
  writeNotNull('sessions', instance.sessions?.map((e) => e.toJson()).toList());
  writeNotNull(
      'studyBursts', instance.studyBursts?.map((e) => e.toJson()).toList());
  writeNotNull('totalMinutes', instance.totalMinutes);
  writeNotNull('totalNotifications', instance.totalNotifications);
  writeNotNull('type', instance.type);
  return val;
}

TimeWindow _$TimeWindowFromJson(Map<String, dynamic> json) {
  return TimeWindow(
    guid: json['guid'] as String?,
    startTime: json['startTime'] as String?,
    expiration: json['expiration'] as String?,
    persistent: json['persistent'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$TimeWindowToJson(TimeWindow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('expiration', instance.expiration);
  writeNotNull('persistent', instance.persistent);
  writeNotNull('type', instance.type);
  return val;
}

DateTimeHolder _$DateTimeHolderFromJson(Map<String, dynamic> json) {
  return DateTimeHolder(
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$DateTimeHolderToJson(DateTimeHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dateTime', instance.dateTime?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

Upload _$UploadFromJson(Map<String, dynamic> json) {
  return Upload(
    uploadId: json['uploadId'] as String?,
    encrypted: json['encrypted'] as bool?,
    schemaId: json['schemaId'] as String?,
    schemaRevision: json['schemaRevision'] as num?,
    recordId: json['recordId'] as String?,
    healthData: json['healthData'] == null
        ? null
        : HealthDataRecord.fromJson(json['healthData'] as Map<String, dynamic>),
    contentLength: json['contentLength'] as num?,
    contentMd5: json['contentMd5'] as String?,
    contentType: json['contentType'] as String?,
    filename: json['filename'] as String?,
    status: uploadStatusFromJson(json['status']),
    requestedOn: json['requestedOn'] == null
        ? null
        : DateTime.parse(json['requestedOn'] as String),
    completedOn: json['completedOn'] == null
        ? null
        : DateTime.parse(json['completedOn'] as String),
    completedBy: uploadCompletedByFromJson(json['completedBy']),
    validationMessageList: (json['validationMessageList'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    healthRecordExporterStatus:
        synapseExporterStatusFromJson(json['healthRecordExporterStatus']),
    zipped: json['zipped'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UploadToJson(Upload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uploadId', instance.uploadId);
  writeNotNull('encrypted', instance.encrypted);
  writeNotNull('schemaId', instance.schemaId);
  writeNotNull('schemaRevision', instance.schemaRevision);
  writeNotNull('recordId', instance.recordId);
  writeNotNull('healthData', instance.healthData?.toJson());
  writeNotNull('contentLength', instance.contentLength);
  writeNotNull('contentMd5', instance.contentMd5);
  writeNotNull('contentType', instance.contentType);
  writeNotNull('filename', instance.filename);
  writeNotNull('status', uploadStatusToJson(instance.status));
  writeNotNull('requestedOn', instance.requestedOn?.toIso8601String());
  writeNotNull('completedOn', instance.completedOn?.toIso8601String());
  writeNotNull('completedBy', uploadCompletedByToJson(instance.completedBy));
  writeNotNull('validationMessageList', instance.validationMessageList);
  writeNotNull('healthRecordExporterStatus',
      synapseExporterStatusToJson(instance.healthRecordExporterStatus));
  writeNotNull('zipped', instance.zipped);
  writeNotNull('type', instance.type);
  return val;
}

UploadFieldDefinition _$UploadFieldDefinitionFromJson(
    Map<String, dynamic> json) {
  return UploadFieldDefinition(
    name: json['name'] as String?,
    required: json['required'] as bool? ?? true,
    type: uploadFieldTypeFromJson(json['type']),
    allowOtherChoices: json['allowOtherChoices'] as bool?,
    fileExtension: json['fileExtension'] as String?,
    mimeType: json['mimeType'] as String?,
    maxLength: json['maxLength'] as int?,
    multiChoiceAnswerList: (json['multiChoiceAnswerList'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    unboundedText: json['unboundedText'] as bool?,
  );
}

Map<String, dynamic> _$UploadFieldDefinitionToJson(
    UploadFieldDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('required', instance.required);
  writeNotNull('type', uploadFieldTypeToJson(instance.type));
  writeNotNull('allowOtherChoices', instance.allowOtherChoices);
  writeNotNull('fileExtension', instance.fileExtension);
  writeNotNull('mimeType', instance.mimeType);
  writeNotNull('maxLength', instance.maxLength);
  writeNotNull('multiChoiceAnswerList', instance.multiChoiceAnswerList);
  writeNotNull('unboundedText', instance.unboundedText);
  return val;
}

UploadRequest _$UploadRequestFromJson(Map<String, dynamic> json) {
  return UploadRequest(
    name: json['name'] as String?,
    contentLength: json['contentLength'] as num?,
    contentMd5: json['contentMd5'] as String?,
    contentType: json['contentType'] as String?,
    encrypted: json['encrypted'] as bool? ?? true,
    metadata: json['metadata'] as Map<String, dynamic>?,
    zipped: json['zipped'] as bool? ?? true,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UploadRequestToJson(UploadRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('contentLength', instance.contentLength);
  writeNotNull('contentMd5', instance.contentMd5);
  writeNotNull('contentType', instance.contentType);
  writeNotNull('encrypted', instance.encrypted);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('zipped', instance.zipped);
  writeNotNull('type', instance.type);
  return val;
}

UploadSchema _$UploadSchemaFromJson(Map<String, dynamic> json) {
  return UploadSchema(
    maxAppVersions: json['maxAppVersions'] as Map<String, dynamic>?,
    minAppVersions: json['minAppVersions'] as Map<String, dynamic>?,
    moduleId: json['moduleId'] as String?,
    moduleVersion: json['moduleVersion'] as int?,
    name: json['name'] as String?,
    revision: json['revision'] as num?,
    schemaId: json['schemaId'] as String?,
    surveyGuid: json['surveyGuid'] as String?,
    appId: json['appId'] as String?,
    surveyCreatedOn: json['surveyCreatedOn'] == null
        ? null
        : DateTime.parse(json['surveyCreatedOn'] as String),
    schemaType: uploadSchemaTypeFromJson(json['schemaType']),
    deleted: json['deleted'] as bool?,
    version: json['version'] as num?,
    fieldDefinitions: (json['fieldDefinitions'] as List<dynamic>?)
            ?.map((e) =>
                UploadFieldDefinition.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UploadSchemaToJson(UploadSchema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxAppVersions', instance.maxAppVersions);
  writeNotNull('minAppVersions', instance.minAppVersions);
  writeNotNull('moduleId', instance.moduleId);
  writeNotNull('moduleVersion', instance.moduleVersion);
  writeNotNull('name', instance.name);
  writeNotNull('revision', instance.revision);
  writeNotNull('schemaId', instance.schemaId);
  writeNotNull('surveyGuid', instance.surveyGuid);
  writeNotNull('appId', instance.appId);
  writeNotNull('surveyCreatedOn', instance.surveyCreatedOn?.toIso8601String());
  writeNotNull('schemaType', uploadSchemaTypeToJson(instance.schemaType));
  writeNotNull('deleted', instance.deleted);
  writeNotNull('version', instance.version);
  writeNotNull('fieldDefinitions',
      instance.fieldDefinitions?.map((e) => e.toJson()).toList());
  writeNotNull('type', instance.type);
  return val;
}

UploadSession _$UploadSessionFromJson(Map<String, dynamic> json) {
  return UploadSession(
    id: json['id'] as String?,
    url: json['url'] as String?,
    expires: json['expires'] == null
        ? null
        : DateTime.parse(json['expires'] as String),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UploadSessionToJson(UploadSession instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('url', instance.url);
  writeNotNull('expires', instance.expires?.toIso8601String());
  writeNotNull('type', instance.type);
  return val;
}

UploadValidationStatus _$UploadValidationStatusFromJson(
    Map<String, dynamic> json) {
  return UploadValidationStatus(
    id: json['id'] as String?,
    messageList: (json['messageList'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    status: uploadStatusFromJson(json['status']),
    record: json['record'] == null
        ? null
        : HealthDataRecord.fromJson(json['record'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UploadValidationStatusToJson(
    UploadValidationStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('messageList', instance.messageList);
  writeNotNull('status', uploadStatusToJson(instance.status));
  writeNotNull('record', instance.record?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

UserConsentHistory _$UserConsentHistoryFromJson(Map<String, dynamic> json) {
  return UserConsentHistory(
    subpopulationGuid: json['subpopulationGuid'] as String?,
    consentCreatedOn: json['consentCreatedOn'] == null
        ? null
        : DateTime.parse(json['consentCreatedOn'] as String),
    name: json['name'] as String?,
    birthdate: json['birthdate'] == null
        ? null
        : DateTime.parse(json['birthdate'] as String),
    imageData: json['imageData'] as String?,
    imageMimeType: json['imageMimeType'] as String?,
    signedOn: json['signedOn'] == null
        ? null
        : DateTime.parse(json['signedOn'] as String),
    withdrewOn: json['withdrewOn'] == null
        ? null
        : DateTime.parse(json['withdrewOn'] as String),
    hasSignedActiveConsent: json['hasSignedActiveConsent'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UserConsentHistoryToJson(UserConsentHistory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subpopulationGuid', instance.subpopulationGuid);
  writeNotNull(
      'consentCreatedOn', instance.consentCreatedOn?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('birthdate', instance.birthdate?.toIso8601String());
  writeNotNull('imageData', instance.imageData);
  writeNotNull('imageMimeType', instance.imageMimeType);
  writeNotNull('signedOn', instance.signedOn?.toIso8601String());
  writeNotNull('withdrewOn', instance.withdrewOn?.toIso8601String());
  writeNotNull('hasSignedActiveConsent', instance.hasSignedActiveConsent);
  writeNotNull('type', instance.type);
  return val;
}

UserSessionInfo _$UserSessionInfoFromJson(Map<String, dynamic> json) {
  return UserSessionInfo(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    externalId: json['externalId'] as String?,
    id: json['id'] as String?,
    notifyByEmail: json['notifyByEmail'] as bool? ?? true,
    attributes: json['attributes'] as Map<String, dynamic>?,
    sharingScope: sharingScopeFromJson(json['sharingScope']),
    createdOn: json['createdOn'] == null
        ? null
        : DateTime.parse(json['createdOn'] as String),
    emailVerified: json['emailVerified'] as bool?,
    phoneVerified: json['phoneVerified'] as bool?,
    status: accountStatusFromJson(json['status']),
    roles: roleListFromJson(json['roles'] as List?),
    dataGroups: (json['dataGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    clientData: json['clientData'] as Map<String, dynamic>?,
    languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    studyIds: (json['studyIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    externalIds: json['externalIds'] as Map<String, dynamic>?,
    authenticated: json['authenticated'] as bool?,
    sessionToken: json['sessionToken'] as String?,
    reauthToken: json['reauthToken'] as String?,
    environment: environmentFromJson(json['environment']),
    email: json['email'] as String?,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    dataSharing: json['dataSharing'] as bool?,
    signedMostRecentConsent: json['signedMostRecentConsent'] as bool?,
    synapseUserId: json['synapseUserId'] as String?,
    consented: json['consented'] as bool?,
    consentStatuses: json['consentStatuses'] as Map<String, dynamic>?,
    enrollments: json['enrollments'] as Map<String, dynamic>?,
    orgMembership: json['orgMembership'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UserSessionInfoToJson(UserSessionInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('externalId', instance.externalId);
  writeNotNull('id', instance.id);
  writeNotNull('notifyByEmail', instance.notifyByEmail);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('sharingScope', sharingScopeToJson(instance.sharingScope));
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('emailVerified', instance.emailVerified);
  writeNotNull('phoneVerified', instance.phoneVerified);
  writeNotNull('status', accountStatusToJson(instance.status));
  writeNotNull('roles', roleListToJson(instance.roles));
  writeNotNull('dataGroups', instance.dataGroups);
  writeNotNull('clientData', instance.clientData);
  writeNotNull('languages', instance.languages);
  writeNotNull('studyIds', instance.studyIds);
  writeNotNull('externalIds', instance.externalIds);
  writeNotNull('authenticated', instance.authenticated);
  writeNotNull('sessionToken', instance.sessionToken);
  writeNotNull('reauthToken', instance.reauthToken);
  writeNotNull('environment', environmentToJson(instance.environment));
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone?.toJson());
  writeNotNull('dataSharing', instance.dataSharing);
  writeNotNull('signedMostRecentConsent', instance.signedMostRecentConsent);
  writeNotNull('synapseUserId', instance.synapseUserId);
  writeNotNull('consented', instance.consented);
  writeNotNull('consentStatuses', instance.consentStatuses);
  writeNotNull('enrollments', instance.enrollments);
  writeNotNull('orgMembership', instance.orgMembership);
  writeNotNull('type', instance.type);
  return val;
}

Verification _$VerificationFromJson(Map<String, dynamic> json) {
  return Verification(
    sptoken: json['sptoken'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$VerificationToJson(Verification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sptoken', instance.sptoken);
  writeNotNull('type', instance.type);
  return val;
}

VersionHolder _$VersionHolderFromJson(Map<String, dynamic> json) {
  return VersionHolder(
    version: json['version'] as num?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$VersionHolderToJson(VersionHolder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  writeNotNull('type', instance.type);
  return val;
}

Withdrawal _$WithdrawalFromJson(Map<String, dynamic> json) {
  return Withdrawal(
    reason: json['reason'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$WithdrawalToJson(Withdrawal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reason', instance.reason);
  writeNotNull('type', instance.type);
  return val;
}

ResourceList _$ResourceListFromJson(Map<String, dynamic> json) {
  return ResourceList(
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ResourceListToJson(ResourceList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

PagedResourceList _$PagedResourceListFromJson(Map<String, dynamic> json) {
  return PagedResourceList(
    total: json['total'] as int?,
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PagedResourceListToJson(PagedResourceList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total', instance.total);
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ForwardCursorPagedResourceList _$ForwardCursorPagedResourceListFromJson(
    Map<String, dynamic> json) {
  return ForwardCursorPagedResourceList(
    nextPageOffsetKey: json['nextPageOffsetKey'] as String?,
    hasNext: json['hasNext'] as bool?,
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ForwardCursorPagedResourceListToJson(
    ForwardCursorPagedResourceList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextPageOffsetKey', instance.nextPageOffsetKey);
  writeNotNull('hasNext', instance.hasNext);
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

AccountSummaryList _$AccountSummaryListFromJson(Map<String, dynamic> json) {
  return AccountSummaryList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => AccountSummary.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$AccountSummaryListToJson(AccountSummaryList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ActivityList _$ActivityListFromJson(Map<String, dynamic> json) {
  return ActivityList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ScheduledActivity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ActivityListToJson(ActivityList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ActivityEventList _$ActivityEventListFromJson(Map<String, dynamic> json) {
  return ActivityEventList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ActivityEvent.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ActivityEventListToJson(ActivityEventList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

AdherenceRecordList _$AdherenceRecordListFromJson(Map<String, dynamic> json) {
  return AdherenceRecordList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => AdherenceRecord.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$AdherenceRecordListToJson(AdherenceRecordList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

AppConfigList _$AppConfigListFromJson(Map<String, dynamic> json) {
  return AppConfigList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => AppConfig.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppConfigListToJson(AppConfigList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

AppConfigElementList _$AppConfigElementListFromJson(Map<String, dynamic> json) {
  return AppConfigElementList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => AppConfigElement.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppConfigElementListToJson(
    AppConfigElementList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

AppList _$AppListFromJson(Map<String, dynamic> json) {
  return AppList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => App.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$AppListToJson(AppList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

AssessmentList _$AssessmentListFromJson(Map<String, dynamic> json) {
  return AssessmentList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Assessment.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$AssessmentListToJson(AssessmentList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

CompoundActivityDefinitionList _$CompoundActivityDefinitionListFromJson(
    Map<String, dynamic> json) {
  return CompoundActivityDefinitionList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) =>
                CompoundActivityDefinition.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$CompoundActivityDefinitionListToJson(
    CompoundActivityDefinitionList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

EnrollmentDetailList _$EnrollmentDetailListFromJson(Map<String, dynamic> json) {
  return EnrollmentDetailList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => EnrollmentDetail.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$EnrollmentDetailListToJson(
    EnrollmentDetailList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ExternalIdentifierList _$ExternalIdentifierListFromJson(
    Map<String, dynamic> json) {
  return ExternalIdentifierList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ExternalIdentifier.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ExternalIdentifierListToJson(
    ExternalIdentifierList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ExternalResourceList _$ExternalResourceListFromJson(Map<String, dynamic> json) {
  return ExternalResourceList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ExternalResource.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ExternalResourceListToJson(
    ExternalResourceList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

FileMetadataList _$FileMetadataListFromJson(Map<String, dynamic> json) {
  return FileMetadataList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => FileMetadata.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$FileMetadataListToJson(FileMetadataList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

FileRevisionList _$FileRevisionListFromJson(Map<String, dynamic> json) {
  return FileRevisionList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => FileRevision.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$FileRevisionListToJson(FileRevisionList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

HealthDataDocumentationList _$HealthDataDocumentationListFromJson(
    Map<String, dynamic> json) {
  return HealthDataDocumentationList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) =>
                HealthDataDocumentation.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$HealthDataDocumentationListToJson(
    HealthDataDocumentationList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

HealthDataRecordList _$HealthDataRecordListFromJson(Map<String, dynamic> json) {
  return HealthDataRecordList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => HealthDataRecord.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$HealthDataRecordListToJson(
    HealthDataRecordList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

HealthDataRecordEx3List _$HealthDataRecordEx3ListFromJson(
    Map<String, dynamic> json) {
  return HealthDataRecordEx3List(
    items: (json['items'] as List<dynamic>?)
            ?.map(
                (e) => HealthDataRecordEx3.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$HealthDataRecordEx3ListToJson(
    HealthDataRecordEx3List instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

NotificationRegistrationList _$NotificationRegistrationListFromJson(
    Map<String, dynamic> json) {
  return NotificationRegistrationList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) =>
                NotificationRegistration.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$NotificationRegistrationListToJson(
    NotificationRegistrationList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

NotificationTopicList _$NotificationTopicListFromJson(
    Map<String, dynamic> json) {
  return NotificationTopicList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => NotificationTopic.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$NotificationTopicListToJson(
    NotificationTopicList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

MasterSchedulerConfigList _$MasterSchedulerConfigListFromJson(
    Map<String, dynamic> json) {
  return MasterSchedulerConfigList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) =>
                MasterSchedulerConfig.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$MasterSchedulerConfigListToJson(
    MasterSchedulerConfigList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

PagedExternalResourceList _$PagedExternalResourceListFromJson(
    Map<String, dynamic> json) {
  return PagedExternalResourceList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ExternalResource.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$PagedExternalResourceListToJson(
    PagedExternalResourceList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ReportDataList _$ReportDataListFromJson(Map<String, dynamic> json) {
  return ReportDataList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ReportData.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ReportDataListToJson(ReportDataList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ForwardCursorReportDataList _$ForwardCursorReportDataListFromJson(
    Map<String, dynamic> json) {
  return ForwardCursorReportDataList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ReportData.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ForwardCursorReportDataListToJson(
    ForwardCursorReportDataList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

OrganizationList _$OrganizationListFromJson(Map<String, dynamic> json) {
  return OrganizationList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$OrganizationListToJson(OrganizationList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ParticipantDataList _$ParticipantDataListFromJson(Map<String, dynamic> json) {
  return ParticipantDataList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ParticipantData.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ParticipantDataListToJson(ParticipantDataList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ParticipantFileList _$ParticipantFileListFromJson(Map<String, dynamic> json) {
  return ParticipantFileList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ParticipantFile.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ParticipantFileListToJson(ParticipantFileList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ParticipantVersionList _$ParticipantVersionListFromJson(
    Map<String, dynamic> json) {
  return ParticipantVersionList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ParticipantVersion.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ParticipantVersionListToJson(
    ParticipantVersionList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ReportIndexList _$ReportIndexListFromJson(Map<String, dynamic> json) {
  return ReportIndexList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ReportIndex.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ReportIndexListToJson(ReportIndexList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ScheduleList _$ScheduleListFromJson(Map<String, dynamic> json) {
  return ScheduleList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduleListToJson(ScheduleList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ScheduledActivityList _$ScheduledActivityListFromJson(
    Map<String, dynamic> json) {
  return ScheduledActivityList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ScheduledActivity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduledActivityListToJson(
    ScheduledActivityList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ScheduledActivityListV4 _$ScheduledActivityListV4FromJson(
    Map<String, dynamic> json) {
  return ScheduledActivityListV4(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ScheduledActivity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ScheduledActivityListV4ToJson(
    ScheduledActivityListV4 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

ForwardCursorScheduledActivityList _$ForwardCursorScheduledActivityListFromJson(
    Map<String, dynamic> json) {
  return ForwardCursorScheduledActivityList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ScheduledActivity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ForwardCursorScheduledActivityListToJson(
    ForwardCursorScheduledActivityList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

ForwardCursorStringList _$ForwardCursorStringListFromJson(
    Map<String, dynamic> json) {
  return ForwardCursorStringList(
    items:
        (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
  );
}

Map<String, dynamic> _$ForwardCursorStringListToJson(
    ForwardCursorStringList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items);
  return val;
}

SchedulePlanList _$SchedulePlanListFromJson(Map<String, dynamic> json) {
  return SchedulePlanList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => SchedulePlan.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SchedulePlanListToJson(SchedulePlanList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

SharedModuleMetadataList _$SharedModuleMetadataListFromJson(
    Map<String, dynamic> json) {
  return SharedModuleMetadataList(
    items: (json['items'] as List<dynamic>?)
            ?.map(
                (e) => SharedModuleMetadata.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SharedModuleMetadataListToJson(
    SharedModuleMetadataList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

StringList _$StringListFromJson(Map<String, dynamic> json) {
  return StringList(
    items:
        (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StringListToJson(StringList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items);
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

StudyActivityEventList _$StudyActivityEventListFromJson(
    Map<String, dynamic> json) {
  return StudyActivityEventList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => StudyActivityEvent.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyActivityEventListToJson(
    StudyActivityEventList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

StudyActivityEventPagedList _$StudyActivityEventPagedListFromJson(
    Map<String, dynamic> json) {
  return StudyActivityEventPagedList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => StudyActivityEvent.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$StudyActivityEventPagedListToJson(
    StudyActivityEventPagedList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

StudyConsentList _$StudyConsentListFromJson(Map<String, dynamic> json) {
  return StudyConsentList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => StudyConsent.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StudyConsentListToJson(StudyConsentList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

StudyList _$StudyListFromJson(Map<String, dynamic> json) {
  return StudyList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Study.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$StudyListToJson(StudyList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

SubpopulationList _$SubpopulationListFromJson(Map<String, dynamic> json) {
  return SubpopulationList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Subpopulation.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SubpopulationListToJson(SubpopulationList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

SubscriptionStatusList _$SubscriptionStatusListFromJson(
    Map<String, dynamic> json) {
  return SubscriptionStatusList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => SubscriptionStatus.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SubscriptionStatusListToJson(
    SubscriptionStatusList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

SurveyList _$SurveyListFromJson(Map<String, dynamic> json) {
  return SurveyList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Survey.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SurveyListToJson(SurveyList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

TemplateList _$TemplateListFromJson(Map<String, dynamic> json) {
  return TemplateList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Template.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$TemplateListToJson(TemplateList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

TemplateRevisionList _$TemplateRevisionListFromJson(Map<String, dynamic> json) {
  return TemplateRevisionList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => TemplateRevision.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$TemplateRevisionListToJson(
    TemplateRevisionList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

UploadList _$UploadListFromJson(Map<String, dynamic> json) {
  return UploadList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => Upload.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$UploadListToJson(UploadList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}

UploadSchemaList _$UploadSchemaListFromJson(Map<String, dynamic> json) {
  return UploadSchemaList(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => UploadSchema.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    requestParams: json['requestParams'] == null
        ? null
        : RequestParams.fromJson(json['requestParams'] as Map<String, dynamic>),
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UploadSchemaListToJson(UploadSchemaList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('requestParams', instance.requestParams?.toJson());
  writeNotNull('type', instance.type);
  return val;
}

Constraints _$ConstraintsFromJson(Map<String, dynamic> json) {
  return Constraints(
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ConstraintsToJson(Constraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

MultiValueConstraints _$MultiValueConstraintsFromJson(
    Map<String, dynamic> json) {
  return MultiValueConstraints(
    allowOther: json['allowOther'] as bool?,
    allowMultiple: json['allowMultiple'] as bool?,
    enumeration: (json['enumeration'] as List<dynamic>?)
            ?.map(
                (e) => SurveyQuestionOption.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$MultiValueConstraintsToJson(
    MultiValueConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowOther', instance.allowOther);
  writeNotNull('allowMultiple', instance.allowMultiple);
  writeNotNull(
      'enumeration', instance.enumeration?.map((e) => e.toJson()).toList());
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

BooleanConstraints _$BooleanConstraintsFromJson(Map<String, dynamic> json) {
  return BooleanConstraints();
}

Map<String, dynamic> _$BooleanConstraintsToJson(BooleanConstraints instance) =>
    <String, dynamic>{};

IntegerConstraints _$IntegerConstraintsFromJson(Map<String, dynamic> json) {
  return IntegerConstraints(
    unit: unitFromJson(json['unit']),
    minValue: json['minValue'] as int?,
    maxValue: json['maxValue'] as int?,
    step: json['step'] as int?,
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$IntegerConstraintsToJson(IntegerConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', unitToJson(instance.unit));
  writeNotNull('minValue', instance.minValue);
  writeNotNull('maxValue', instance.maxValue);
  writeNotNull('step', instance.step);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

DecimalConstraints _$DecimalConstraintsFromJson(Map<String, dynamic> json) {
  return DecimalConstraints(
    unit: unitFromJson(json['unit']),
    minValue: (json['minValue'] as num?)?.toDouble(),
    maxValue: (json['maxValue'] as num?)?.toDouble(),
    step: (json['step'] as num?)?.toDouble(),
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$DecimalConstraintsToJson(DecimalConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', unitToJson(instance.unit));
  writeNotNull('minValue', instance.minValue);
  writeNotNull('maxValue', instance.maxValue);
  writeNotNull('step', instance.step);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

StringConstraints _$StringConstraintsFromJson(Map<String, dynamic> json) {
  return StringConstraints(
    minLength: json['minLength'] as int?,
    maxLength: json['maxLength'] as int?,
    pattern: json['pattern'] as String?,
    patternErrorMessage: json['patternErrorMessage'] as String?,
    patternPlaceholder: json['patternPlaceholder'] as String?,
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$StringConstraintsToJson(StringConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('minLength', instance.minLength);
  writeNotNull('maxLength', instance.maxLength);
  writeNotNull('pattern', instance.pattern);
  writeNotNull('patternErrorMessage', instance.patternErrorMessage);
  writeNotNull('patternPlaceholder', instance.patternPlaceholder);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

DateTimeConstraints _$DateTimeConstraintsFromJson(Map<String, dynamic> json) {
  return DateTimeConstraints(
    allowFuture: json['allowFuture'] as bool? ?? false,
    allowPast: json['allowPast'] as bool? ?? true,
    earliestValue: json['earliestValue'] == null
        ? null
        : DateTime.parse(json['earliestValue'] as String),
    latestValue: json['latestValue'] == null
        ? null
        : DateTime.parse(json['latestValue'] as String),
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$DateTimeConstraintsToJson(DateTimeConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowFuture', instance.allowFuture);
  writeNotNull('allowPast', instance.allowPast);
  writeNotNull('earliestValue', instance.earliestValue?.toIso8601String());
  writeNotNull('latestValue', instance.latestValue?.toIso8601String());
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

DateConstraints _$DateConstraintsFromJson(Map<String, dynamic> json) {
  return DateConstraints(
    allowFuture: json['allowFuture'] as bool? ?? false,
    allowPast: json['allowPast'] as bool? ?? true,
    earliestValue: json['earliestValue'] == null
        ? null
        : DateTime.parse(json['earliestValue'] as String),
    latestValue: json['latestValue'] == null
        ? null
        : DateTime.parse(json['latestValue'] as String),
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$DateConstraintsToJson(DateConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowFuture', instance.allowFuture);
  writeNotNull('allowPast', instance.allowPast);
  writeNotNull('earliestValue', instance.earliestValue?.toIso8601String());
  writeNotNull('latestValue', instance.latestValue?.toIso8601String());
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

PostalCodeConstraints _$PostalCodeConstraintsFromJson(
    Map<String, dynamic> json) {
  return PostalCodeConstraints(
    countryCode: countryCodeFromJson(json['countryCode']),
    sparseZipCodePrefixes: (json['sparseZipCodePrefixes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PostalCodeConstraintsToJson(
    PostalCodeConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('countryCode', countryCodeToJson(instance.countryCode));
  writeNotNull('sparseZipCodePrefixes', instance.sparseZipCodePrefixes);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

YearMonthConstraints _$YearMonthConstraintsFromJson(Map<String, dynamic> json) {
  return YearMonthConstraints(
    allowFuture: json['allowFuture'] as bool? ?? false,
    allowPast: json['allowPast'] as bool? ?? true,
    earliestValue: json['earliestValue'] as String?,
    latestValue: json['latestValue'] as String?,
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$YearMonthConstraintsToJson(
    YearMonthConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowFuture', instance.allowFuture);
  writeNotNull('allowPast', instance.allowPast);
  writeNotNull('earliestValue', instance.earliestValue);
  writeNotNull('latestValue', instance.latestValue);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

YearConstraints _$YearConstraintsFromJson(Map<String, dynamic> json) {
  return YearConstraints(
    allowFuture: json['allowFuture'] as bool? ?? false,
    allowPast: json['allowPast'] as bool? ?? true,
    earliestValue: json['earliestValue'] as String?,
    latestValue: json['latestValue'] as String?,
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$YearConstraintsToJson(YearConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowFuture', instance.allowFuture);
  writeNotNull('allowPast', instance.allowPast);
  writeNotNull('earliestValue', instance.earliestValue);
  writeNotNull('latestValue', instance.latestValue);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

TimeConstraints _$TimeConstraintsFromJson(Map<String, dynamic> json) {
  return TimeConstraints();
}

Map<String, dynamic> _$TimeConstraintsToJson(TimeConstraints instance) =>
    <String, dynamic>{};

DurationConstraints _$DurationConstraintsFromJson(Map<String, dynamic> json) {
  return DurationConstraints(
    unit: unitFromJson(json['unit']),
    minValue: json['minValue'] as int?,
    maxValue: json['maxValue'] as int?,
    step: json['step'] as int?,
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$DurationConstraintsToJson(DurationConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', unitToJson(instance.unit));
  writeNotNull('minValue', instance.minValue);
  writeNotNull('maxValue', instance.maxValue);
  writeNotNull('step', instance.step);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

BloodPressureConstraints _$BloodPressureConstraintsFromJson(
    Map<String, dynamic> json) {
  return BloodPressureConstraints(
    unit: unitFromJson(json['unit']),
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$BloodPressureConstraintsToJson(
    BloodPressureConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', unitToJson(instance.unit));
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

HeightConstraints _$HeightConstraintsFromJson(Map<String, dynamic> json) {
  return HeightConstraints(
    unit: unitFromJson(json['unit']),
    forInfant: json['forInfant'] as bool?,
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$HeightConstraintsToJson(HeightConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', unitToJson(instance.unit));
  writeNotNull('forInfant', instance.forInfant);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}

WeightConstraints _$WeightConstraintsFromJson(Map<String, dynamic> json) {
  return WeightConstraints(
    unit: unitFromJson(json['unit']),
    forInfant: json['forInfant'] as bool?,
    dataType: dataTypeFromJson(json['dataType']),
    required: json['required'] as bool?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$WeightConstraintsToJson(WeightConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', unitToJson(instance.unit));
  writeNotNull('forInfant', instance.forInfant);
  writeNotNull('dataType', dataTypeToJson(instance.dataType));
  writeNotNull('required', instance.required);
  writeNotNull('type', instance.type);
  return val;
}
