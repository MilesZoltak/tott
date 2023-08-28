import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'bridge_sdk.enums.swagger.dart' as enums;

part 'bridge_sdk.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ABTestGroup {
  ABTestGroup({
    this.percentage,
    this.schedule,
    this.type,
  });

  factory ABTestGroup.fromJson(Map<String, dynamic> json) =>
      _$ABTestGroupFromJson(json);

  @JsonKey(name: 'percentage', includeIfNull: false)
  final int? percentage;
  @JsonKey(name: 'schedule', includeIfNull: false)
  final Schedule? schedule;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ABTestGroupFromJson;
  static const toJsonFactory = _$ABTestGroupToJson;
  Map<String, dynamic> toJson() => _$ABTestGroupToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ABTestGroup &&
            (identical(other.percentage, percentage) ||
                const DeepCollectionEquality()
                    .equals(other.percentage, percentage)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(percentage) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ABTestGroupExtension on ABTestGroup {
  ABTestGroup copyWith({int? percentage, Schedule? schedule, String? type}) {
    return ABTestGroup(
        percentage: percentage ?? this.percentage,
        schedule: schedule ?? this.schedule,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ABTestScheduleStrategy {
  ABTestScheduleStrategy({
    this.scheduleGroups,
    this.type,
  });

  factory ABTestScheduleStrategy.fromJson(Map<String, dynamic> json) =>
      _$ABTestScheduleStrategyFromJson(json);

  @JsonKey(
      name: 'scheduleGroups',
      includeIfNull: false,
      defaultValue: <ABTestGroup>[])
  final List<ABTestGroup>? scheduleGroups;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ABTestScheduleStrategyFromJson;
  static const toJsonFactory = _$ABTestScheduleStrategyToJson;
  Map<String, dynamic> toJson() => _$ABTestScheduleStrategyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ABTestScheduleStrategy &&
            (identical(other.scheduleGroups, scheduleGroups) ||
                const DeepCollectionEquality()
                    .equals(other.scheduleGroups, scheduleGroups)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(scheduleGroups) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ABTestScheduleStrategyExtension on ABTestScheduleStrategy {
  ABTestScheduleStrategy copyWith(
      {List<ABTestGroup>? scheduleGroups, String? type}) {
    return ABTestScheduleStrategy(
        scheduleGroups: scheduleGroups ?? this.scheduleGroups,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AbstractStudyParticipant {
  AbstractStudyParticipant({
    this.firstName,
    this.lastName,
    this.synapseUserId,
    this.id,
    this.notifyByEmail,
    this.attributes,
    this.sharingScope,
    this.createdOn,
    this.emailVerified,
    this.phoneVerified,
    this.status,
    this.roles,
    this.dataGroups,
    this.clientData,
    this.languages,
    this.studyIds,
    this.externalIds,
    this.orgMembership,
    this.note,
    this.clientTimeZone,
  });

  factory AbstractStudyParticipant.fromJson(Map<String, dynamic> json) =>
      _$AbstractStudyParticipantFromJson(json);

  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'synapseUserId', includeIfNull: false)
  final String? synapseUserId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'notifyByEmail', includeIfNull: false, defaultValue: true)
  final bool? notifyByEmail;
  @JsonKey(name: 'attributes', includeIfNull: false)
  final Map<String, dynamic>? attributes;
  @JsonKey(
      name: 'sharingScope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? sharingScope;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'emailVerified', includeIfNull: false)
  final bool? emailVerified;
  @JsonKey(name: 'phoneVerified', includeIfNull: false)
  final bool? phoneVerified;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(
      name: 'roles',
      includeIfNull: false,
      toJson: roleListToJson,
      fromJson: roleListFromJson)
  final List<enums.Role>? roles;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Map<String, dynamic>? clientData;
  @JsonKey(name: 'languages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? languages;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'externalIds', includeIfNull: false)
  final Map<String, dynamic>? externalIds;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  static const fromJsonFactory = _$AbstractStudyParticipantFromJson;
  static const toJsonFactory = _$AbstractStudyParticipantToJson;
  Map<String, dynamic> toJson() => _$AbstractStudyParticipantToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AbstractStudyParticipant &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.synapseUserId, synapseUserId) ||
                const DeepCollectionEquality()
                    .equals(other.synapseUserId, synapseUserId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.notifyByEmail, notifyByEmail) ||
                const DeepCollectionEquality()
                    .equals(other.notifyByEmail, notifyByEmail)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.sharingScope, sharingScope) ||
                const DeepCollectionEquality()
                    .equals(other.sharingScope, sharingScope)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.phoneVerified, phoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.phoneVerified, phoneVerified)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.externalIds, externalIds) ||
                const DeepCollectionEquality()
                    .equals(other.externalIds, externalIds)) &&
            (identical(other.orgMembership, orgMembership) ||
                const DeepCollectionEquality()
                    .equals(other.orgMembership, orgMembership)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.clientTimeZone, clientTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.clientTimeZone, clientTimeZone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(synapseUserId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(notifyByEmail) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(sharingScope) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(phoneVerified) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(externalIds) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      runtimeType.hashCode;
}

extension $AbstractStudyParticipantExtension on AbstractStudyParticipant {
  AbstractStudyParticipant copyWith(
      {String? firstName,
      String? lastName,
      String? synapseUserId,
      String? id,
      bool? notifyByEmail,
      Map<String, dynamic>? attributes,
      enums.SharingScope? sharingScope,
      DateTime? createdOn,
      bool? emailVerified,
      bool? phoneVerified,
      enums.AccountStatus? status,
      List<enums.Role>? roles,
      List<String>? dataGroups,
      Map<String, dynamic>? clientData,
      List<String>? languages,
      List<String>? studyIds,
      Map<String, dynamic>? externalIds,
      String? orgMembership,
      String? note,
      String? clientTimeZone}) {
    return AbstractStudyParticipant(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        synapseUserId: synapseUserId ?? this.synapseUserId,
        id: id ?? this.id,
        notifyByEmail: notifyByEmail ?? this.notifyByEmail,
        attributes: attributes ?? this.attributes,
        sharingScope: sharingScope ?? this.sharingScope,
        createdOn: createdOn ?? this.createdOn,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneVerified: phoneVerified ?? this.phoneVerified,
        status: status ?? this.status,
        roles: roles ?? this.roles,
        dataGroups: dataGroups ?? this.dataGroups,
        clientData: clientData ?? this.clientData,
        languages: languages ?? this.languages,
        studyIds: studyIds ?? this.studyIds,
        externalIds: externalIds ?? this.externalIds,
        orgMembership: orgMembership ?? this.orgMembership,
        note: note ?? this.note,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone);
  }
}

@JsonSerializable(explicitToJson: true)
class Account {
  Account({
    this.id,
    this.firstName,
    this.lastName,
    this.synapseUserId,
    this.email,
    this.phone,
    this.password,
    this.attributes,
    this.createdOn,
    this.modifiedOn,
    this.emailVerified,
    this.phoneVerified,
    this.status,
    this.roles,
    this.dataGroups,
    this.clientData,
    this.languages,
    this.orgMembership,
    this.type,
    this.note,
    this.clientTimeZone,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'synapseUserId', includeIfNull: false)
  final String? synapseUserId;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'attributes', includeIfNull: false)
  final Map<String, dynamic>? attributes;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'emailVerified', includeIfNull: false)
  final bool? emailVerified;
  @JsonKey(name: 'phoneVerified', includeIfNull: false)
  final bool? phoneVerified;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(
      name: 'roles',
      includeIfNull: false,
      toJson: roleListToJson,
      fromJson: roleListFromJson)
  final List<enums.Role>? roles;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Map<String, dynamic>? clientData;
  @JsonKey(name: 'languages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? languages;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  static const fromJsonFactory = _$AccountFromJson;
  static const toJsonFactory = _$AccountToJson;
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Account &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.synapseUserId, synapseUserId) ||
                const DeepCollectionEquality()
                    .equals(other.synapseUserId, synapseUserId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.phoneVerified, phoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.phoneVerified, phoneVerified)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.orgMembership, orgMembership) ||
                const DeepCollectionEquality()
                    .equals(other.orgMembership, orgMembership)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.clientTimeZone, clientTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.clientTimeZone, clientTimeZone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(synapseUserId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(phoneVerified) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      runtimeType.hashCode;
}

extension $AccountExtension on Account {
  Account copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? synapseUserId,
      String? email,
      Phone? phone,
      String? password,
      Map<String, dynamic>? attributes,
      DateTime? createdOn,
      DateTime? modifiedOn,
      bool? emailVerified,
      bool? phoneVerified,
      enums.AccountStatus? status,
      List<enums.Role>? roles,
      List<String>? dataGroups,
      Map<String, dynamic>? clientData,
      List<String>? languages,
      String? orgMembership,
      String? type,
      String? note,
      String? clientTimeZone}) {
    return Account(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        synapseUserId: synapseUserId ?? this.synapseUserId,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        attributes: attributes ?? this.attributes,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneVerified: phoneVerified ?? this.phoneVerified,
        status: status ?? this.status,
        roles: roles ?? this.roles,
        dataGroups: dataGroups ?? this.dataGroups,
        clientData: clientData ?? this.clientData,
        languages: languages ?? this.languages,
        orgMembership: orgMembership ?? this.orgMembership,
        type: type ?? this.type,
        note: note ?? this.note,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone);
  }
}

@JsonSerializable(explicitToJson: true)
class AccountRef {
  AccountRef({
    this.firstName,
    this.lastName,
    this.synapseUserId,
    this.identifier,
    this.orgMembership,
    this.email,
    this.phone,
    this.type,
  });

  factory AccountRef.fromJson(Map<String, dynamic> json) =>
      _$AccountRefFromJson(json);

  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'synapseUserId', includeIfNull: false)
  final String? synapseUserId;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AccountRefFromJson;
  static const toJsonFactory = _$AccountRefToJson;
  Map<String, dynamic> toJson() => _$AccountRefToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountRef &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.synapseUserId, synapseUserId) ||
                const DeepCollectionEquality()
                    .equals(other.synapseUserId, synapseUserId)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.orgMembership, orgMembership) ||
                const DeepCollectionEquality()
                    .equals(other.orgMembership, orgMembership)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(synapseUserId) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AccountRefExtension on AccountRef {
  AccountRef copyWith(
      {String? firstName,
      String? lastName,
      String? synapseUserId,
      String? identifier,
      String? orgMembership,
      String? email,
      Phone? phone,
      String? type}) {
    return AccountRef(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        synapseUserId: synapseUserId ?? this.synapseUserId,
        identifier: identifier ?? this.identifier,
        orgMembership: orgMembership ?? this.orgMembership,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AccountSummary {
  AccountSummary({
    this.appId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.id,
    this.createdOn,
    this.status,
    this.studyIds,
    this.externalIds,
    this.synapseUserId,
    this.attributes,
    this.orgMembership,
    this.roles,
    this.dataGroups,
    this.note,
    this.clientTimeZone,
    this.type,
  });

  factory AccountSummary.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'externalIds', includeIfNull: false)
  final Map<String, dynamic>? externalIds;
  @JsonKey(name: 'synapseUserId', includeIfNull: false)
  final String? synapseUserId;
  @JsonKey(name: 'attributes', includeIfNull: false)
  final Map<String, dynamic>? attributes;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(
      name: 'roles',
      includeIfNull: false,
      toJson: roleListToJson,
      fromJson: roleListFromJson)
  final List<enums.Role>? roles;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AccountSummaryFromJson;
  static const toJsonFactory = _$AccountSummaryToJson;
  Map<String, dynamic> toJson() => _$AccountSummaryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountSummary &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.externalIds, externalIds) ||
                const DeepCollectionEquality()
                    .equals(other.externalIds, externalIds)) &&
            (identical(other.synapseUserId, synapseUserId) ||
                const DeepCollectionEquality()
                    .equals(other.synapseUserId, synapseUserId)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.orgMembership, orgMembership) ||
                const DeepCollectionEquality()
                    .equals(other.orgMembership, orgMembership)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.clientTimeZone, clientTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.clientTimeZone, clientTimeZone)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(externalIds) ^
      const DeepCollectionEquality().hash(synapseUserId) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AccountSummaryExtension on AccountSummary {
  AccountSummary copyWith(
      {String? appId,
      String? firstName,
      String? lastName,
      String? email,
      Phone? phone,
      String? id,
      DateTime? createdOn,
      enums.AccountStatus? status,
      List<String>? studyIds,
      Map<String, dynamic>? externalIds,
      String? synapseUserId,
      Map<String, dynamic>? attributes,
      String? orgMembership,
      List<enums.Role>? roles,
      List<String>? dataGroups,
      String? note,
      String? clientTimeZone,
      String? type}) {
    return AccountSummary(
        appId: appId ?? this.appId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        id: id ?? this.id,
        createdOn: createdOn ?? this.createdOn,
        status: status ?? this.status,
        studyIds: studyIds ?? this.studyIds,
        externalIds: externalIds ?? this.externalIds,
        synapseUserId: synapseUserId ?? this.synapseUserId,
        attributes: attributes ?? this.attributes,
        orgMembership: orgMembership ?? this.orgMembership,
        roles: roles ?? this.roles,
        dataGroups: dataGroups ?? this.dataGroups,
        note: note ?? this.note,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AccountSummarySearch {
  AccountSummarySearch({
    this.pageSize,
    this.offsetBy,
    this.emailFilter,
    this.phoneFilter,
    this.allOfGroups,
    this.noneOfGroups,
    this.language,
    this.startTime,
    this.endTime,
    this.orgMembership,
    this.adminOnly,
    this.enrolledInStudyId,
    this.externalIdFilter,
    this.status,
    this.enrollment,
    this.attributeKey,
    this.attributeValueFilter,
    this.predicate,
    this.stringSearchPosition,
    this.type,
  });

  factory AccountSummarySearch.fromJson(Map<String, dynamic> json) =>
      _$AccountSummarySearchFromJson(json);

  @JsonKey(name: 'pageSize', includeIfNull: false)
  final int? pageSize;
  @JsonKey(name: 'offsetBy', includeIfNull: false)
  final int? offsetBy;
  @JsonKey(name: 'emailFilter', includeIfNull: false)
  final String? emailFilter;
  @JsonKey(name: 'phoneFilter', includeIfNull: false)
  final String? phoneFilter;
  @JsonKey(name: 'allOfGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? allOfGroups;
  @JsonKey(name: 'noneOfGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? noneOfGroups;
  @JsonKey(name: 'language', includeIfNull: false)
  final String? language;
  @JsonKey(name: 'startTime', includeIfNull: false)
  final DateTime? startTime;
  @JsonKey(name: 'endTime', includeIfNull: false)
  final DateTime? endTime;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'adminOnly', includeIfNull: false)
  final bool? adminOnly;
  @JsonKey(name: 'enrolledInStudyId', includeIfNull: false)
  final String? enrolledInStudyId;
  @JsonKey(name: 'externalIdFilter', includeIfNull: false)
  final String? externalIdFilter;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(
      name: 'enrollment',
      includeIfNull: false,
      toJson: enrollmentFilterToJson,
      fromJson: enrollmentFilterFromJson)
  final enums.EnrollmentFilter? enrollment;
  @JsonKey(name: 'attributeKey', includeIfNull: false)
  final String? attributeKey;
  @JsonKey(name: 'attributeValueFilter', includeIfNull: false)
  final String? attributeValueFilter;
  @JsonKey(
      name: 'predicate',
      includeIfNull: false,
      toJson: searchTermPredicateToJson,
      fromJson: searchTermPredicateFromJson)
  final enums.SearchTermPredicate? predicate;
  @JsonKey(
      name: 'stringSearchPosition',
      includeIfNull: false,
      toJson: stringSearchPositionToJson,
      fromJson: stringSearchPositionFromJson)
  final enums.StringSearchPosition? stringSearchPosition;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AccountSummarySearchFromJson;
  static const toJsonFactory = _$AccountSummarySearchToJson;
  Map<String, dynamic> toJson() => _$AccountSummarySearchToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountSummarySearch &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.offsetBy, offsetBy) ||
                const DeepCollectionEquality()
                    .equals(other.offsetBy, offsetBy)) &&
            (identical(other.emailFilter, emailFilter) ||
                const DeepCollectionEquality()
                    .equals(other.emailFilter, emailFilter)) &&
            (identical(other.phoneFilter, phoneFilter) ||
                const DeepCollectionEquality()
                    .equals(other.phoneFilter, phoneFilter)) &&
            (identical(other.allOfGroups, allOfGroups) ||
                const DeepCollectionEquality()
                    .equals(other.allOfGroups, allOfGroups)) &&
            (identical(other.noneOfGroups, noneOfGroups) ||
                const DeepCollectionEquality()
                    .equals(other.noneOfGroups, noneOfGroups)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.orgMembership, orgMembership) ||
                const DeepCollectionEquality()
                    .equals(other.orgMembership, orgMembership)) &&
            (identical(other.adminOnly, adminOnly) ||
                const DeepCollectionEquality()
                    .equals(other.adminOnly, adminOnly)) &&
            (identical(other.enrolledInStudyId, enrolledInStudyId) ||
                const DeepCollectionEquality()
                    .equals(other.enrolledInStudyId, enrolledInStudyId)) &&
            (identical(other.externalIdFilter, externalIdFilter) ||
                const DeepCollectionEquality()
                    .equals(other.externalIdFilter, externalIdFilter)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.enrollment, enrollment) ||
                const DeepCollectionEquality()
                    .equals(other.enrollment, enrollment)) &&
            (identical(other.attributeKey, attributeKey) ||
                const DeepCollectionEquality()
                    .equals(other.attributeKey, attributeKey)) &&
            (identical(other.attributeValueFilter, attributeValueFilter) ||
                const DeepCollectionEquality().equals(
                    other.attributeValueFilter, attributeValueFilter)) &&
            (identical(other.predicate, predicate) ||
                const DeepCollectionEquality()
                    .equals(other.predicate, predicate)) &&
            (identical(other.stringSearchPosition, stringSearchPosition) ||
                const DeepCollectionEquality().equals(
                    other.stringSearchPosition, stringSearchPosition)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(offsetBy) ^
      const DeepCollectionEquality().hash(emailFilter) ^
      const DeepCollectionEquality().hash(phoneFilter) ^
      const DeepCollectionEquality().hash(allOfGroups) ^
      const DeepCollectionEquality().hash(noneOfGroups) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(adminOnly) ^
      const DeepCollectionEquality().hash(enrolledInStudyId) ^
      const DeepCollectionEquality().hash(externalIdFilter) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(enrollment) ^
      const DeepCollectionEquality().hash(attributeKey) ^
      const DeepCollectionEquality().hash(attributeValueFilter) ^
      const DeepCollectionEquality().hash(predicate) ^
      const DeepCollectionEquality().hash(stringSearchPosition) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AccountSummarySearchExtension on AccountSummarySearch {
  AccountSummarySearch copyWith(
      {int? pageSize,
      int? offsetBy,
      String? emailFilter,
      String? phoneFilter,
      List<String>? allOfGroups,
      List<String>? noneOfGroups,
      String? language,
      DateTime? startTime,
      DateTime? endTime,
      String? orgMembership,
      bool? adminOnly,
      String? enrolledInStudyId,
      String? externalIdFilter,
      enums.AccountStatus? status,
      enums.EnrollmentFilter? enrollment,
      String? attributeKey,
      String? attributeValueFilter,
      enums.SearchTermPredicate? predicate,
      enums.StringSearchPosition? stringSearchPosition,
      String? type}) {
    return AccountSummarySearch(
        pageSize: pageSize ?? this.pageSize,
        offsetBy: offsetBy ?? this.offsetBy,
        emailFilter: emailFilter ?? this.emailFilter,
        phoneFilter: phoneFilter ?? this.phoneFilter,
        allOfGroups: allOfGroups ?? this.allOfGroups,
        noneOfGroups: noneOfGroups ?? this.noneOfGroups,
        language: language ?? this.language,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        orgMembership: orgMembership ?? this.orgMembership,
        adminOnly: adminOnly ?? this.adminOnly,
        enrolledInStudyId: enrolledInStudyId ?? this.enrolledInStudyId,
        externalIdFilter: externalIdFilter ?? this.externalIdFilter,
        status: status ?? this.status,
        enrollment: enrollment ?? this.enrollment,
        attributeKey: attributeKey ?? this.attributeKey,
        attributeValueFilter: attributeValueFilter ?? this.attributeValueFilter,
        predicate: predicate ?? this.predicate,
        stringSearchPosition: stringSearchPosition ?? this.stringSearchPosition,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Activity {
  Activity({
    this.label,
    this.labelDetail,
    this.guid,
    this.compoundActivity,
    this.task,
    this.survey,
    this.activityType,
    this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(name: 'labelDetail', includeIfNull: false)
  final String? labelDetail;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'compoundActivity', includeIfNull: false)
  final CompoundActivity? compoundActivity;
  @JsonKey(name: 'task', includeIfNull: false)
  final TaskReference? task;
  @JsonKey(name: 'survey', includeIfNull: false)
  final SurveyReference? survey;
  @JsonKey(
      name: 'activityType',
      includeIfNull: false,
      toJson: activityTypeToJson,
      fromJson: activityTypeFromJson)
  final enums.ActivityType? activityType;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ActivityFromJson;
  static const toJsonFactory = _$ActivityToJson;
  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Activity &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.labelDetail, labelDetail) ||
                const DeepCollectionEquality()
                    .equals(other.labelDetail, labelDetail)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.compoundActivity, compoundActivity) ||
                const DeepCollectionEquality()
                    .equals(other.compoundActivity, compoundActivity)) &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)) &&
            (identical(other.survey, survey) ||
                const DeepCollectionEquality().equals(other.survey, survey)) &&
            (identical(other.activityType, activityType) ||
                const DeepCollectionEquality()
                    .equals(other.activityType, activityType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(labelDetail) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(compoundActivity) ^
      const DeepCollectionEquality().hash(task) ^
      const DeepCollectionEquality().hash(survey) ^
      const DeepCollectionEquality().hash(activityType) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ActivityExtension on Activity {
  Activity copyWith(
      {String? label,
      String? labelDetail,
      String? guid,
      CompoundActivity? compoundActivity,
      TaskReference? task,
      SurveyReference? survey,
      enums.ActivityType? activityType,
      String? type}) {
    return Activity(
        label: label ?? this.label,
        labelDetail: labelDetail ?? this.labelDetail,
        guid: guid ?? this.guid,
        compoundActivity: compoundActivity ?? this.compoundActivity,
        task: task ?? this.task,
        survey: survey ?? this.survey,
        activityType: activityType ?? this.activityType,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivityEvent {
  ActivityEvent({
    this.eventId,
    this.studyId,
    this.answerValue,
    this.timestamp,
    this.type,
  });

  factory ActivityEvent.fromJson(Map<String, dynamic> json) =>
      _$ActivityEventFromJson(json);

  @JsonKey(name: 'eventId', includeIfNull: false)
  final String? eventId;
  @JsonKey(name: 'studyId', includeIfNull: false)
  final String? studyId;
  @JsonKey(name: 'answerValue', includeIfNull: false)
  final String? answerValue;
  @JsonKey(name: 'timestamp', includeIfNull: false)
  final DateTime? timestamp;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ActivityEventFromJson;
  static const toJsonFactory = _$ActivityEventToJson;
  Map<String, dynamic> toJson() => _$ActivityEventToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivityEvent &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.studyId, studyId) ||
                const DeepCollectionEquality()
                    .equals(other.studyId, studyId)) &&
            (identical(other.answerValue, answerValue) ||
                const DeepCollectionEquality()
                    .equals(other.answerValue, answerValue)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(studyId) ^
      const DeepCollectionEquality().hash(answerValue) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ActivityEventExtension on ActivityEvent {
  ActivityEvent copyWith(
      {String? eventId,
      String? studyId,
      String? answerValue,
      DateTime? timestamp,
      String? type}) {
    return ActivityEvent(
        eventId: eventId ?? this.eventId,
        studyId: studyId ?? this.studyId,
        answerValue: answerValue ?? this.answerValue,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Address {
  Address({
    this.placeName,
    this.street,
    this.mailRouting,
    this.city,
    this.division,
    this.postalCode,
    this.country,
    this.type,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @JsonKey(name: 'placeName', includeIfNull: false)
  final String? placeName;
  @JsonKey(name: 'street', includeIfNull: false)
  final String? street;
  @JsonKey(name: 'mailRouting', includeIfNull: false)
  final String? mailRouting;
  @JsonKey(name: 'city', includeIfNull: false)
  final String? city;
  @JsonKey(name: 'division', includeIfNull: false)
  final String? division;
  @JsonKey(name: 'postalCode', includeIfNull: false)
  final String? postalCode;
  @JsonKey(name: 'country', includeIfNull: false)
  final String? country;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AddressFromJson;
  static const toJsonFactory = _$AddressToJson;
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Address &&
            (identical(other.placeName, placeName) ||
                const DeepCollectionEquality()
                    .equals(other.placeName, placeName)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.mailRouting, mailRouting) ||
                const DeepCollectionEquality()
                    .equals(other.mailRouting, mailRouting)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.division, division) ||
                const DeepCollectionEquality()
                    .equals(other.division, division)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(placeName) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(mailRouting) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(division) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AddressExtension on Address {
  Address copyWith(
      {String? placeName,
      String? street,
      String? mailRouting,
      String? city,
      String? division,
      String? postalCode,
      String? country,
      String? type}) {
    return Address(
        placeName: placeName ?? this.placeName,
        street: street ?? this.street,
        mailRouting: mailRouting ?? this.mailRouting,
        city: city ?? this.city,
        division: division ?? this.division,
        postalCode: postalCode ?? this.postalCode,
        country: country ?? this.country,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AdherenceRecord {
  AdherenceRecord({
    this.instanceGuid,
    this.startedOn,
    this.finishedOn,
    this.eventTimestamp,
    this.clientTimeZone,
    this.uploadedOn,
    this.declined,
    this.clientData,
    this.type,
  });

  factory AdherenceRecord.fromJson(Map<String, dynamic> json) =>
      _$AdherenceRecordFromJson(json);

  @JsonKey(name: 'instanceGuid', includeIfNull: false)
  final String? instanceGuid;
  @JsonKey(name: 'startedOn', includeIfNull: false)
  final DateTime? startedOn;
  @JsonKey(name: 'finishedOn', includeIfNull: false)
  final DateTime? finishedOn;
  @JsonKey(name: 'eventTimestamp', includeIfNull: false)
  final DateTime? eventTimestamp;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  @JsonKey(name: 'uploadedOn', includeIfNull: false)
  final DateTime? uploadedOn;
  @JsonKey(name: 'declined', includeIfNull: false)
  final bool? declined;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Object? clientData;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AdherenceRecordFromJson;
  static const toJsonFactory = _$AdherenceRecordToJson;
  Map<String, dynamic> toJson() => _$AdherenceRecordToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AdherenceRecord &&
            (identical(other.instanceGuid, instanceGuid) ||
                const DeepCollectionEquality()
                    .equals(other.instanceGuid, instanceGuid)) &&
            (identical(other.startedOn, startedOn) ||
                const DeepCollectionEquality()
                    .equals(other.startedOn, startedOn)) &&
            (identical(other.finishedOn, finishedOn) ||
                const DeepCollectionEquality()
                    .equals(other.finishedOn, finishedOn)) &&
            (identical(other.eventTimestamp, eventTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.eventTimestamp, eventTimestamp)) &&
            (identical(other.clientTimeZone, clientTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.clientTimeZone, clientTimeZone)) &&
            (identical(other.uploadedOn, uploadedOn) ||
                const DeepCollectionEquality()
                    .equals(other.uploadedOn, uploadedOn)) &&
            (identical(other.declined, declined) ||
                const DeepCollectionEquality()
                    .equals(other.declined, declined)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(instanceGuid) ^
      const DeepCollectionEquality().hash(startedOn) ^
      const DeepCollectionEquality().hash(finishedOn) ^
      const DeepCollectionEquality().hash(eventTimestamp) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      const DeepCollectionEquality().hash(uploadedOn) ^
      const DeepCollectionEquality().hash(declined) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AdherenceRecordExtension on AdherenceRecord {
  AdherenceRecord copyWith(
      {String? instanceGuid,
      DateTime? startedOn,
      DateTime? finishedOn,
      DateTime? eventTimestamp,
      String? clientTimeZone,
      DateTime? uploadedOn,
      bool? declined,
      Object? clientData,
      String? type}) {
    return AdherenceRecord(
        instanceGuid: instanceGuid ?? this.instanceGuid,
        startedOn: startedOn ?? this.startedOn,
        finishedOn: finishedOn ?? this.finishedOn,
        eventTimestamp: eventTimestamp ?? this.eventTimestamp,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone,
        uploadedOn: uploadedOn ?? this.uploadedOn,
        declined: declined ?? this.declined,
        clientData: clientData ?? this.clientData,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AdherenceRecordUpdates {
  AdherenceRecordUpdates({
    this.records,
    this.type,
  });

  factory AdherenceRecordUpdates.fromJson(Map<String, dynamic> json) =>
      _$AdherenceRecordUpdatesFromJson(json);

  @JsonKey(
      name: 'records', includeIfNull: false, defaultValue: <AdherenceRecord>[])
  final List<AdherenceRecord>? records;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AdherenceRecordUpdatesFromJson;
  static const toJsonFactory = _$AdherenceRecordUpdatesToJson;
  Map<String, dynamic> toJson() => _$AdherenceRecordUpdatesToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AdherenceRecordUpdates &&
            (identical(other.records, records) ||
                const DeepCollectionEquality()
                    .equals(other.records, records)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(records) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AdherenceRecordUpdatesExtension on AdherenceRecordUpdates {
  AdherenceRecordUpdates copyWith(
      {List<AdherenceRecord>? records, String? type}) {
    return AdherenceRecordUpdates(
        records: records ?? this.records, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AdherenceRecordsSearch {
  AdherenceRecordsSearch({
    this.instanceGuids,
    this.assessmentIds,
    this.sessionGuids,
    this.timeWindowGuids,
    this.adherenceRecordType,
    this.includeRepeats,
    this.currentTimestampsOnly,
    this.eventTimestamps,
    this.startTime,
    this.endTime,
    this.pageSize,
    this.offsetBy,
    this.sortOrder,
    this.predicate,
    this.stringSearchPosition,
    this.type,
  });

  factory AdherenceRecordsSearch.fromJson(Map<String, dynamic> json) =>
      _$AdherenceRecordsSearchFromJson(json);

  @JsonKey(
      name: 'instanceGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? instanceGuids;
  @JsonKey(
      name: 'assessmentIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? assessmentIds;
  @JsonKey(name: 'sessionGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? sessionGuids;
  @JsonKey(
      name: 'timeWindowGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? timeWindowGuids;
  @JsonKey(
      name: 'adherenceRecordType',
      includeIfNull: false,
      toJson: adherenceRecordTypeToJson,
      fromJson: adherenceRecordTypeFromJson)
  final enums.AdherenceRecordType? adherenceRecordType;
  @JsonKey(name: 'includeRepeats', includeIfNull: false)
  final bool? includeRepeats;
  @JsonKey(name: 'currentTimestampsOnly', includeIfNull: false)
  final bool? currentTimestampsOnly;
  @JsonKey(name: 'eventTimestamps', includeIfNull: false)
  final Map<String, dynamic>? eventTimestamps;
  @JsonKey(name: 'startTime', includeIfNull: false)
  final DateTime? startTime;
  @JsonKey(name: 'endTime', includeIfNull: false)
  final DateTime? endTime;
  @JsonKey(name: 'pageSize', includeIfNull: false)
  final int? pageSize;
  @JsonKey(name: 'offsetBy', includeIfNull: false)
  final int? offsetBy;
  @JsonKey(
      name: 'sortOrder',
      includeIfNull: false,
      toJson: sortOrderToJson,
      fromJson: sortOrderFromJson)
  final enums.SortOrder? sortOrder;
  @JsonKey(
      name: 'predicate',
      includeIfNull: false,
      toJson: searchTermPredicateToJson,
      fromJson: searchTermPredicateFromJson)
  final enums.SearchTermPredicate? predicate;
  @JsonKey(
      name: 'stringSearchPosition',
      includeIfNull: false,
      toJson: stringSearchPositionToJson,
      fromJson: stringSearchPositionFromJson)
  final enums.StringSearchPosition? stringSearchPosition;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AdherenceRecordsSearchFromJson;
  static const toJsonFactory = _$AdherenceRecordsSearchToJson;
  Map<String, dynamic> toJson() => _$AdherenceRecordsSearchToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AdherenceRecordsSearch &&
            (identical(other.instanceGuids, instanceGuids) ||
                const DeepCollectionEquality()
                    .equals(other.instanceGuids, instanceGuids)) &&
            (identical(other.assessmentIds, assessmentIds) ||
                const DeepCollectionEquality()
                    .equals(other.assessmentIds, assessmentIds)) &&
            (identical(other.sessionGuids, sessionGuids) ||
                const DeepCollectionEquality()
                    .equals(other.sessionGuids, sessionGuids)) &&
            (identical(other.timeWindowGuids, timeWindowGuids) ||
                const DeepCollectionEquality()
                    .equals(other.timeWindowGuids, timeWindowGuids)) &&
            (identical(other.adherenceRecordType, adherenceRecordType) ||
                const DeepCollectionEquality()
                    .equals(other.adherenceRecordType, adherenceRecordType)) &&
            (identical(other.includeRepeats, includeRepeats) ||
                const DeepCollectionEquality()
                    .equals(other.includeRepeats, includeRepeats)) &&
            (identical(other.currentTimestampsOnly, currentTimestampsOnly) ||
                const DeepCollectionEquality().equals(
                    other.currentTimestampsOnly, currentTimestampsOnly)) &&
            (identical(other.eventTimestamps, eventTimestamps) ||
                const DeepCollectionEquality()
                    .equals(other.eventTimestamps, eventTimestamps)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.offsetBy, offsetBy) ||
                const DeepCollectionEquality()
                    .equals(other.offsetBy, offsetBy)) &&
            (identical(other.sortOrder, sortOrder) ||
                const DeepCollectionEquality()
                    .equals(other.sortOrder, sortOrder)) &&
            (identical(other.predicate, predicate) ||
                const DeepCollectionEquality()
                    .equals(other.predicate, predicate)) &&
            (identical(other.stringSearchPosition, stringSearchPosition) ||
                const DeepCollectionEquality().equals(
                    other.stringSearchPosition, stringSearchPosition)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(instanceGuids) ^
      const DeepCollectionEquality().hash(assessmentIds) ^
      const DeepCollectionEquality().hash(sessionGuids) ^
      const DeepCollectionEquality().hash(timeWindowGuids) ^
      const DeepCollectionEquality().hash(adherenceRecordType) ^
      const DeepCollectionEquality().hash(includeRepeats) ^
      const DeepCollectionEquality().hash(currentTimestampsOnly) ^
      const DeepCollectionEquality().hash(eventTimestamps) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(offsetBy) ^
      const DeepCollectionEquality().hash(sortOrder) ^
      const DeepCollectionEquality().hash(predicate) ^
      const DeepCollectionEquality().hash(stringSearchPosition) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AdherenceRecordsSearchExtension on AdherenceRecordsSearch {
  AdherenceRecordsSearch copyWith(
      {List<String>? instanceGuids,
      List<String>? assessmentIds,
      List<String>? sessionGuids,
      List<String>? timeWindowGuids,
      enums.AdherenceRecordType? adherenceRecordType,
      bool? includeRepeats,
      bool? currentTimestampsOnly,
      Map<String, dynamic>? eventTimestamps,
      DateTime? startTime,
      DateTime? endTime,
      int? pageSize,
      int? offsetBy,
      enums.SortOrder? sortOrder,
      enums.SearchTermPredicate? predicate,
      enums.StringSearchPosition? stringSearchPosition,
      String? type}) {
    return AdherenceRecordsSearch(
        instanceGuids: instanceGuids ?? this.instanceGuids,
        assessmentIds: assessmentIds ?? this.assessmentIds,
        sessionGuids: sessionGuids ?? this.sessionGuids,
        timeWindowGuids: timeWindowGuids ?? this.timeWindowGuids,
        adherenceRecordType: adherenceRecordType ?? this.adherenceRecordType,
        includeRepeats: includeRepeats ?? this.includeRepeats,
        currentTimestampsOnly:
            currentTimestampsOnly ?? this.currentTimestampsOnly,
        eventTimestamps: eventTimestamps ?? this.eventTimestamps,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        pageSize: pageSize ?? this.pageSize,
        offsetBy: offsetBy ?? this.offsetBy,
        sortOrder: sortOrder ?? this.sortOrder,
        predicate: predicate ?? this.predicate,
        stringSearchPosition: stringSearchPosition ?? this.stringSearchPosition,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AndroidAppLink {
  AndroidAppLink({
    this.namespace,
    this.packageName,
    this.sha256CertFingerprints,
    this.type,
  });

  factory AndroidAppLink.fromJson(Map<String, dynamic> json) =>
      _$AndroidAppLinkFromJson(json);

  @JsonKey(name: 'namespace', includeIfNull: false)
  final String? namespace;
  @JsonKey(name: 'package_name', includeIfNull: false)
  final String? packageName;
  @JsonKey(
      name: 'sha256_cert_fingerprints',
      includeIfNull: false,
      defaultValue: <String>[])
  final List<String>? sha256CertFingerprints;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AndroidAppLinkFromJson;
  static const toJsonFactory = _$AndroidAppLinkToJson;
  Map<String, dynamic> toJson() => _$AndroidAppLinkToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AndroidAppLink &&
            (identical(other.namespace, namespace) ||
                const DeepCollectionEquality()
                    .equals(other.namespace, namespace)) &&
            (identical(other.packageName, packageName) ||
                const DeepCollectionEquality()
                    .equals(other.packageName, packageName)) &&
            (identical(other.sha256CertFingerprints, sha256CertFingerprints) ||
                const DeepCollectionEquality().equals(
                    other.sha256CertFingerprints, sha256CertFingerprints)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(namespace) ^
      const DeepCollectionEquality().hash(packageName) ^
      const DeepCollectionEquality().hash(sha256CertFingerprints) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AndroidAppLinkExtension on AndroidAppLink {
  AndroidAppLink copyWith(
      {String? namespace,
      String? packageName,
      List<String>? sha256CertFingerprints,
      String? type}) {
    return AndroidAppLink(
        namespace: namespace ?? this.namespace,
        packageName: packageName ?? this.packageName,
        sha256CertFingerprints:
            sha256CertFingerprints ?? this.sha256CertFingerprints,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class App {
  App({
    this.name,
    this.shortName,
    this.customEvents,
    this.automaticCustomEvents,
    this.autoVerificationEmailSuppressed,
    this.consentNotificationEmailVerified,
    this.exporter3Configuration,
    this.exporter3Enabled,
    this.fitBitScopes,
    this.installLinks,
    this.participantIpLockingEnabled,
    this.sponsorName,
    this.supportEmail,
    this.technicalEmail,
    this.uploadMetadataFieldDefinitions,
    this.uploadValidationStrictness,
    this.consentNotificationEmail,
    this.identifier,
    this.version,
    this.minAgeOfConsent,
    this.appIdExcludedInExport,
    this.synapseDataAccessTeamId,
    this.synapseProjectId,
    this.usesCustomExportSchedule,
    this.userProfileAttributes,
    this.taskIdentifiers,
    this.dataGroups,
    this.passwordPolicy,
    this.active,
    this.strictUploadValidationEnabled,
    this.healthCodeExportEnabled,
    this.emailVerificationEnabled,
    this.autoVerificationPhoneSuppressed,
    this.emailSignInEnabled,
    this.phoneSignInEnabled,
    this.reauthenticationEnabled,
    this.externalIdRequiredOnSignup,
    this.verifyChannelOnSignInEnabled,
    this.accountLimit,
    this.disableExport,
    this.minSupportedAppVersions,
    this.oAuthProviders,
    this.pushNotificationARNs,
    this.appleAppLinks,
    this.androidAppLinks,
    this.defaultTemplates,
    this.type,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'shortName', includeIfNull: false)
  final String? shortName;
  @JsonKey(name: 'customEvents', includeIfNull: false)
  final Map<String, dynamic>? customEvents;
  @JsonKey(name: 'automaticCustomEvents', includeIfNull: false)
  final Map<String, dynamic>? automaticCustomEvents;
  @JsonKey(name: 'autoVerificationEmailSuppressed', includeIfNull: false)
  final bool? autoVerificationEmailSuppressed;
  @JsonKey(name: 'consentNotificationEmailVerified', includeIfNull: false)
  final bool? consentNotificationEmailVerified;
  @JsonKey(name: 'exporter3Configuration', includeIfNull: false)
  final Exporter3Configuration? exporter3Configuration;
  @JsonKey(name: 'exporter3Enabled', includeIfNull: false)
  final bool? exporter3Enabled;
  @JsonKey(name: 'fitBitScopes', includeIfNull: false, defaultValue: <String>[])
  final List<String>? fitBitScopes;
  @JsonKey(name: 'installLinks', includeIfNull: false)
  final Map<String, dynamic>? installLinks;
  @JsonKey(name: 'participantIpLockingEnabled', includeIfNull: false)
  final bool? participantIpLockingEnabled;
  @JsonKey(name: 'sponsorName', includeIfNull: false)
  final String? sponsorName;
  @JsonKey(name: 'supportEmail', includeIfNull: false)
  final String? supportEmail;
  @JsonKey(name: 'technicalEmail', includeIfNull: false)
  final String? technicalEmail;
  @JsonKey(
      name: 'uploadMetadataFieldDefinitions',
      includeIfNull: false,
      defaultValue: <UploadFieldDefinition>[])
  final List<UploadFieldDefinition>? uploadMetadataFieldDefinitions;
  @JsonKey(
      name: 'uploadValidationStrictness',
      includeIfNull: false,
      toJson: uploadValidationStrictnessToJson,
      fromJson: uploadValidationStrictnessFromJson)
  final enums.UploadValidationStrictness? uploadValidationStrictness;
  @JsonKey(name: 'consentNotificationEmail', includeIfNull: false)
  final String? consentNotificationEmail;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'minAgeOfConsent', includeIfNull: false)
  final int? minAgeOfConsent;
  @JsonKey(name: 'appIdExcludedInExport', includeIfNull: false)
  final bool? appIdExcludedInExport;
  @JsonKey(name: 'synapseDataAccessTeamId', includeIfNull: false)
  final num? synapseDataAccessTeamId;
  @JsonKey(name: 'synapseProjectId', includeIfNull: false)
  final String? synapseProjectId;
  @JsonKey(name: 'usesCustomExportSchedule', includeIfNull: false)
  final bool? usesCustomExportSchedule;
  @JsonKey(
      name: 'userProfileAttributes',
      includeIfNull: false,
      defaultValue: <String>[])
  final List<String>? userProfileAttributes;
  @JsonKey(
      name: 'taskIdentifiers', includeIfNull: false, defaultValue: <String>[])
  final List<String>? taskIdentifiers;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'passwordPolicy', includeIfNull: false)
  final PasswordPolicy? passwordPolicy;
  @JsonKey(name: 'active', includeIfNull: false)
  final bool? active;
  @JsonKey(name: 'strictUploadValidationEnabled', includeIfNull: false)
  final bool? strictUploadValidationEnabled;
  @JsonKey(name: 'healthCodeExportEnabled', includeIfNull: false)
  final bool? healthCodeExportEnabled;
  @JsonKey(name: 'emailVerificationEnabled', includeIfNull: false)
  final bool? emailVerificationEnabled;
  @JsonKey(name: 'autoVerificationPhoneSuppressed', includeIfNull: false)
  final bool? autoVerificationPhoneSuppressed;
  @JsonKey(
      name: 'emailSignInEnabled', includeIfNull: false, defaultValue: false)
  final bool? emailSignInEnabled;
  @JsonKey(
      name: 'phoneSignInEnabled', includeIfNull: false, defaultValue: false)
  final bool? phoneSignInEnabled;
  @JsonKey(
      name: 'reauthenticationEnabled', includeIfNull: false, defaultValue: true)
  final bool? reauthenticationEnabled;
  @JsonKey(
      name: 'externalIdRequiredOnSignup',
      includeIfNull: false,
      defaultValue: false)
  final bool? externalIdRequiredOnSignup;
  @JsonKey(
      name: 'verifyChannelOnSignInEnabled',
      includeIfNull: false,
      defaultValue: true)
  final bool? verifyChannelOnSignInEnabled;
  @JsonKey(name: 'accountLimit', includeIfNull: false)
  final int? accountLimit;
  @JsonKey(name: 'disableExport', includeIfNull: false, defaultValue: false)
  final bool? disableExport;
  @JsonKey(name: 'minSupportedAppVersions', includeIfNull: false)
  final Map<String, dynamic>? minSupportedAppVersions;
  @JsonKey(name: 'oAuthProviders', includeIfNull: false)
  final Map<String, dynamic>? oAuthProviders;
  @JsonKey(name: 'pushNotificationARNs', includeIfNull: false)
  final Map<String, dynamic>? pushNotificationARNs;
  @JsonKey(
      name: 'appleAppLinks',
      includeIfNull: false,
      defaultValue: <AppleAppLink>[])
  final List<AppleAppLink>? appleAppLinks;
  @JsonKey(
      name: 'androidAppLinks',
      includeIfNull: false,
      defaultValue: <AndroidAppLink>[])
  final List<AndroidAppLink>? androidAppLinks;
  @JsonKey(name: 'defaultTemplates', includeIfNull: false)
  final Map<String, dynamic>? defaultTemplates;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppFromJson;
  static const toJsonFactory = _$AppToJson;
  Map<String, dynamic> toJson() => _$AppToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is App &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.shortName, shortName) ||
                const DeepCollectionEquality()
                    .equals(other.shortName, shortName)) &&
            (identical(other.customEvents, customEvents) ||
                const DeepCollectionEquality()
                    .equals(other.customEvents, customEvents)) &&
            (identical(other.automaticCustomEvents, automaticCustomEvents) ||
                const DeepCollectionEquality().equals(
                    other.automaticCustomEvents, automaticCustomEvents)) &&
            (identical(other.autoVerificationEmailSuppressed, autoVerificationEmailSuppressed) ||
                const DeepCollectionEquality().equals(
                    other.autoVerificationEmailSuppressed,
                    autoVerificationEmailSuppressed)) &&
            (identical(other.consentNotificationEmailVerified, consentNotificationEmailVerified) ||
                const DeepCollectionEquality().equals(
                    other.consentNotificationEmailVerified,
                    consentNotificationEmailVerified)) &&
            (identical(other.exporter3Configuration, exporter3Configuration) ||
                const DeepCollectionEquality().equals(
                    other.exporter3Configuration, exporter3Configuration)) &&
            (identical(other.exporter3Enabled, exporter3Enabled) ||
                const DeepCollectionEquality()
                    .equals(other.exporter3Enabled, exporter3Enabled)) &&
            (identical(other.fitBitScopes, fitBitScopes) ||
                const DeepCollectionEquality()
                    .equals(other.fitBitScopes, fitBitScopes)) &&
            (identical(other.installLinks, installLinks) ||
                const DeepCollectionEquality()
                    .equals(other.installLinks, installLinks)) &&
            (identical(other.participantIpLockingEnabled, participantIpLockingEnabled) ||
                const DeepCollectionEquality().equals(
                    other.participantIpLockingEnabled,
                    participantIpLockingEnabled)) &&
            (identical(other.sponsorName, sponsorName) ||
                const DeepCollectionEquality()
                    .equals(other.sponsorName, sponsorName)) &&
            (identical(other.supportEmail, supportEmail) ||
                const DeepCollectionEquality()
                    .equals(other.supportEmail, supportEmail)) &&
            (identical(other.technicalEmail, technicalEmail) ||
                const DeepCollectionEquality().equals(other.technicalEmail, technicalEmail)) &&
            (identical(other.uploadMetadataFieldDefinitions, uploadMetadataFieldDefinitions) || const DeepCollectionEquality().equals(other.uploadMetadataFieldDefinitions, uploadMetadataFieldDefinitions)) &&
            (identical(other.uploadValidationStrictness, uploadValidationStrictness) || const DeepCollectionEquality().equals(other.uploadValidationStrictness, uploadValidationStrictness)) &&
            (identical(other.consentNotificationEmail, consentNotificationEmail) || const DeepCollectionEquality().equals(other.consentNotificationEmail, consentNotificationEmail)) &&
            (identical(other.identifier, identifier) || const DeepCollectionEquality().equals(other.identifier, identifier)) &&
            (identical(other.version, version) || const DeepCollectionEquality().equals(other.version, version)) &&
            (identical(other.minAgeOfConsent, minAgeOfConsent) || const DeepCollectionEquality().equals(other.minAgeOfConsent, minAgeOfConsent)) &&
            (identical(other.appIdExcludedInExport, appIdExcludedInExport) || const DeepCollectionEquality().equals(other.appIdExcludedInExport, appIdExcludedInExport)) &&
            (identical(other.synapseDataAccessTeamId, synapseDataAccessTeamId) || const DeepCollectionEquality().equals(other.synapseDataAccessTeamId, synapseDataAccessTeamId)) &&
            (identical(other.synapseProjectId, synapseProjectId) || const DeepCollectionEquality().equals(other.synapseProjectId, synapseProjectId)) &&
            (identical(other.usesCustomExportSchedule, usesCustomExportSchedule) || const DeepCollectionEquality().equals(other.usesCustomExportSchedule, usesCustomExportSchedule)) &&
            (identical(other.userProfileAttributes, userProfileAttributes) || const DeepCollectionEquality().equals(other.userProfileAttributes, userProfileAttributes)) &&
            (identical(other.taskIdentifiers, taskIdentifiers) || const DeepCollectionEquality().equals(other.taskIdentifiers, taskIdentifiers)) &&
            (identical(other.dataGroups, dataGroups) || const DeepCollectionEquality().equals(other.dataGroups, dataGroups)) &&
            (identical(other.passwordPolicy, passwordPolicy) || const DeepCollectionEquality().equals(other.passwordPolicy, passwordPolicy)) &&
            (identical(other.active, active) || const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.strictUploadValidationEnabled, strictUploadValidationEnabled) || const DeepCollectionEquality().equals(other.strictUploadValidationEnabled, strictUploadValidationEnabled)) &&
            (identical(other.healthCodeExportEnabled, healthCodeExportEnabled) || const DeepCollectionEquality().equals(other.healthCodeExportEnabled, healthCodeExportEnabled)) &&
            (identical(other.emailVerificationEnabled, emailVerificationEnabled) || const DeepCollectionEquality().equals(other.emailVerificationEnabled, emailVerificationEnabled)) &&
            (identical(other.autoVerificationPhoneSuppressed, autoVerificationPhoneSuppressed) || const DeepCollectionEquality().equals(other.autoVerificationPhoneSuppressed, autoVerificationPhoneSuppressed)) &&
            (identical(other.emailSignInEnabled, emailSignInEnabled) || const DeepCollectionEquality().equals(other.emailSignInEnabled, emailSignInEnabled)) &&
            (identical(other.phoneSignInEnabled, phoneSignInEnabled) || const DeepCollectionEquality().equals(other.phoneSignInEnabled, phoneSignInEnabled)) &&
            (identical(other.reauthenticationEnabled, reauthenticationEnabled) || const DeepCollectionEquality().equals(other.reauthenticationEnabled, reauthenticationEnabled)) &&
            (identical(other.externalIdRequiredOnSignup, externalIdRequiredOnSignup) || const DeepCollectionEquality().equals(other.externalIdRequiredOnSignup, externalIdRequiredOnSignup)) &&
            (identical(other.verifyChannelOnSignInEnabled, verifyChannelOnSignInEnabled) || const DeepCollectionEquality().equals(other.verifyChannelOnSignInEnabled, verifyChannelOnSignInEnabled)) &&
            (identical(other.accountLimit, accountLimit) || const DeepCollectionEquality().equals(other.accountLimit, accountLimit)) &&
            (identical(other.disableExport, disableExport) || const DeepCollectionEquality().equals(other.disableExport, disableExport)) &&
            (identical(other.minSupportedAppVersions, minSupportedAppVersions) || const DeepCollectionEquality().equals(other.minSupportedAppVersions, minSupportedAppVersions)) &&
            (identical(other.oAuthProviders, oAuthProviders) || const DeepCollectionEquality().equals(other.oAuthProviders, oAuthProviders)) &&
            (identical(other.pushNotificationARNs, pushNotificationARNs) || const DeepCollectionEquality().equals(other.pushNotificationARNs, pushNotificationARNs)) &&
            (identical(other.appleAppLinks, appleAppLinks) || const DeepCollectionEquality().equals(other.appleAppLinks, appleAppLinks)) &&
            (identical(other.androidAppLinks, androidAppLinks) || const DeepCollectionEquality().equals(other.androidAppLinks, androidAppLinks)) &&
            (identical(other.defaultTemplates, defaultTemplates) || const DeepCollectionEquality().equals(other.defaultTemplates, defaultTemplates)) &&
            (identical(other.type, type) || const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(shortName) ^
      const DeepCollectionEquality().hash(customEvents) ^
      const DeepCollectionEquality().hash(automaticCustomEvents) ^
      const DeepCollectionEquality().hash(autoVerificationEmailSuppressed) ^
      const DeepCollectionEquality().hash(consentNotificationEmailVerified) ^
      const DeepCollectionEquality().hash(exporter3Configuration) ^
      const DeepCollectionEquality().hash(exporter3Enabled) ^
      const DeepCollectionEquality().hash(fitBitScopes) ^
      const DeepCollectionEquality().hash(installLinks) ^
      const DeepCollectionEquality().hash(participantIpLockingEnabled) ^
      const DeepCollectionEquality().hash(sponsorName) ^
      const DeepCollectionEquality().hash(supportEmail) ^
      const DeepCollectionEquality().hash(technicalEmail) ^
      const DeepCollectionEquality().hash(uploadMetadataFieldDefinitions) ^
      const DeepCollectionEquality().hash(uploadValidationStrictness) ^
      const DeepCollectionEquality().hash(consentNotificationEmail) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(minAgeOfConsent) ^
      const DeepCollectionEquality().hash(appIdExcludedInExport) ^
      const DeepCollectionEquality().hash(synapseDataAccessTeamId) ^
      const DeepCollectionEquality().hash(synapseProjectId) ^
      const DeepCollectionEquality().hash(usesCustomExportSchedule) ^
      const DeepCollectionEquality().hash(userProfileAttributes) ^
      const DeepCollectionEquality().hash(taskIdentifiers) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(passwordPolicy) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(strictUploadValidationEnabled) ^
      const DeepCollectionEquality().hash(healthCodeExportEnabled) ^
      const DeepCollectionEquality().hash(emailVerificationEnabled) ^
      const DeepCollectionEquality().hash(autoVerificationPhoneSuppressed) ^
      const DeepCollectionEquality().hash(emailSignInEnabled) ^
      const DeepCollectionEquality().hash(phoneSignInEnabled) ^
      const DeepCollectionEquality().hash(reauthenticationEnabled) ^
      const DeepCollectionEquality().hash(externalIdRequiredOnSignup) ^
      const DeepCollectionEquality().hash(verifyChannelOnSignInEnabled) ^
      const DeepCollectionEquality().hash(accountLimit) ^
      const DeepCollectionEquality().hash(disableExport) ^
      const DeepCollectionEquality().hash(minSupportedAppVersions) ^
      const DeepCollectionEquality().hash(oAuthProviders) ^
      const DeepCollectionEquality().hash(pushNotificationARNs) ^
      const DeepCollectionEquality().hash(appleAppLinks) ^
      const DeepCollectionEquality().hash(androidAppLinks) ^
      const DeepCollectionEquality().hash(defaultTemplates) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppExtension on App {
  App copyWith(
      {String? name,
      String? shortName,
      Map<String, dynamic>? customEvents,
      Map<String, dynamic>? automaticCustomEvents,
      bool? autoVerificationEmailSuppressed,
      bool? consentNotificationEmailVerified,
      Exporter3Configuration? exporter3Configuration,
      bool? exporter3Enabled,
      List<String>? fitBitScopes,
      Map<String, dynamic>? installLinks,
      bool? participantIpLockingEnabled,
      String? sponsorName,
      String? supportEmail,
      String? technicalEmail,
      List<UploadFieldDefinition>? uploadMetadataFieldDefinitions,
      enums.UploadValidationStrictness? uploadValidationStrictness,
      String? consentNotificationEmail,
      String? identifier,
      num? version,
      int? minAgeOfConsent,
      bool? appIdExcludedInExport,
      num? synapseDataAccessTeamId,
      String? synapseProjectId,
      bool? usesCustomExportSchedule,
      List<String>? userProfileAttributes,
      List<String>? taskIdentifiers,
      List<String>? dataGroups,
      PasswordPolicy? passwordPolicy,
      bool? active,
      bool? strictUploadValidationEnabled,
      bool? healthCodeExportEnabled,
      bool? emailVerificationEnabled,
      bool? autoVerificationPhoneSuppressed,
      bool? emailSignInEnabled,
      bool? phoneSignInEnabled,
      bool? reauthenticationEnabled,
      bool? externalIdRequiredOnSignup,
      bool? verifyChannelOnSignInEnabled,
      int? accountLimit,
      bool? disableExport,
      Map<String, dynamic>? minSupportedAppVersions,
      Map<String, dynamic>? oAuthProviders,
      Map<String, dynamic>? pushNotificationARNs,
      List<AppleAppLink>? appleAppLinks,
      List<AndroidAppLink>? androidAppLinks,
      Map<String, dynamic>? defaultTemplates,
      String? type}) {
    return App(
        name: name ?? this.name,
        shortName: shortName ?? this.shortName,
        customEvents: customEvents ?? this.customEvents,
        automaticCustomEvents:
            automaticCustomEvents ?? this.automaticCustomEvents,
        autoVerificationEmailSuppressed: autoVerificationEmailSuppressed ??
            this.autoVerificationEmailSuppressed,
        consentNotificationEmailVerified: consentNotificationEmailVerified ??
            this.consentNotificationEmailVerified,
        exporter3Configuration:
            exporter3Configuration ?? this.exporter3Configuration,
        exporter3Enabled: exporter3Enabled ?? this.exporter3Enabled,
        fitBitScopes: fitBitScopes ?? this.fitBitScopes,
        installLinks: installLinks ?? this.installLinks,
        participantIpLockingEnabled:
            participantIpLockingEnabled ?? this.participantIpLockingEnabled,
        sponsorName: sponsorName ?? this.sponsorName,
        supportEmail: supportEmail ?? this.supportEmail,
        technicalEmail: technicalEmail ?? this.technicalEmail,
        uploadMetadataFieldDefinitions: uploadMetadataFieldDefinitions ??
            this.uploadMetadataFieldDefinitions,
        uploadValidationStrictness:
            uploadValidationStrictness ?? this.uploadValidationStrictness,
        consentNotificationEmail:
            consentNotificationEmail ?? this.consentNotificationEmail,
        identifier: identifier ?? this.identifier,
        version: version ?? this.version,
        minAgeOfConsent: minAgeOfConsent ?? this.minAgeOfConsent,
        appIdExcludedInExport:
            appIdExcludedInExport ?? this.appIdExcludedInExport,
        synapseDataAccessTeamId:
            synapseDataAccessTeamId ?? this.synapseDataAccessTeamId,
        synapseProjectId: synapseProjectId ?? this.synapseProjectId,
        usesCustomExportSchedule:
            usesCustomExportSchedule ?? this.usesCustomExportSchedule,
        userProfileAttributes:
            userProfileAttributes ?? this.userProfileAttributes,
        taskIdentifiers: taskIdentifiers ?? this.taskIdentifiers,
        dataGroups: dataGroups ?? this.dataGroups,
        passwordPolicy: passwordPolicy ?? this.passwordPolicy,
        active: active ?? this.active,
        strictUploadValidationEnabled:
            strictUploadValidationEnabled ?? this.strictUploadValidationEnabled,
        healthCodeExportEnabled:
            healthCodeExportEnabled ?? this.healthCodeExportEnabled,
        emailVerificationEnabled:
            emailVerificationEnabled ?? this.emailVerificationEnabled,
        autoVerificationPhoneSuppressed: autoVerificationPhoneSuppressed ??
            this.autoVerificationPhoneSuppressed,
        emailSignInEnabled: emailSignInEnabled ?? this.emailSignInEnabled,
        phoneSignInEnabled: phoneSignInEnabled ?? this.phoneSignInEnabled,
        reauthenticationEnabled:
            reauthenticationEnabled ?? this.reauthenticationEnabled,
        externalIdRequiredOnSignup:
            externalIdRequiredOnSignup ?? this.externalIdRequiredOnSignup,
        verifyChannelOnSignInEnabled:
            verifyChannelOnSignInEnabled ?? this.verifyChannelOnSignInEnabled,
        accountLimit: accountLimit ?? this.accountLimit,
        disableExport: disableExport ?? this.disableExport,
        minSupportedAppVersions:
            minSupportedAppVersions ?? this.minSupportedAppVersions,
        oAuthProviders: oAuthProviders ?? this.oAuthProviders,
        pushNotificationARNs: pushNotificationARNs ?? this.pushNotificationARNs,
        appleAppLinks: appleAppLinks ?? this.appleAppLinks,
        androidAppLinks: androidAppLinks ?? this.androidAppLinks,
        defaultTemplates: defaultTemplates ?? this.defaultTemplates,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AppAndUsers {
  AppAndUsers({
    this.adminIds,
    this.app,
    this.users,
    this.type,
  });

  factory AppAndUsers.fromJson(Map<String, dynamic> json) =>
      _$AppAndUsersFromJson(json);

  @JsonKey(name: 'adminIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? adminIds;
  @JsonKey(name: 'app', includeIfNull: false)
  final App? app;
  @JsonKey(
      name: 'users', includeIfNull: false, defaultValue: <StudyParticipant>[])
  final List<StudyParticipant>? users;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppAndUsersFromJson;
  static const toJsonFactory = _$AppAndUsersToJson;
  Map<String, dynamic> toJson() => _$AppAndUsersToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppAndUsers &&
            (identical(other.adminIds, adminIds) ||
                const DeepCollectionEquality()
                    .equals(other.adminIds, adminIds)) &&
            (identical(other.app, app) ||
                const DeepCollectionEquality().equals(other.app, app)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(adminIds) ^
      const DeepCollectionEquality().hash(app) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppAndUsersExtension on AppAndUsers {
  AppAndUsers copyWith(
      {List<String>? adminIds,
      App? app,
      List<StudyParticipant>? users,
      String? type}) {
    return AppAndUsers(
        adminIds: adminIds ?? this.adminIds,
        app: app ?? this.app,
        users: users ?? this.users,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AppConfig {
  AppConfig({
    this.label,
    this.createdOn,
    this.modifiedOn,
    this.guid,
    this.deleted,
    this.criteria,
    this.clientData,
    this.surveyReferences,
    this.schemaReferences,
    this.configReferences,
    this.fileReferences,
    this.assessmentReferences,
    this.configElements,
    this.version,
    this.type,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'criteria', includeIfNull: false)
  final Criteria? criteria;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Object? clientData;
  @JsonKey(
      name: 'surveyReferences',
      includeIfNull: false,
      defaultValue: <SurveyReference>[])
  final List<SurveyReference>? surveyReferences;
  @JsonKey(
      name: 'schemaReferences',
      includeIfNull: false,
      defaultValue: <SchemaReference>[])
  final List<SchemaReference>? schemaReferences;
  @JsonKey(
      name: 'configReferences',
      includeIfNull: false,
      defaultValue: <ConfigReference>[])
  final List<ConfigReference>? configReferences;
  @JsonKey(
      name: 'fileReferences',
      includeIfNull: false,
      defaultValue: <FileReference>[])
  final List<FileReference>? fileReferences;
  @JsonKey(
      name: 'assessmentReferences',
      includeIfNull: false,
      defaultValue: <AssessmentReference>[])
  final List<AssessmentReference>? assessmentReferences;
  @JsonKey(name: 'configElements', includeIfNull: false)
  final Map<String, dynamic>? configElements;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppConfigFromJson;
  static const toJsonFactory = _$AppConfigToJson;
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppConfig &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.criteria, criteria) ||
                const DeepCollectionEquality()
                    .equals(other.criteria, criteria)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.surveyReferences, surveyReferences) ||
                const DeepCollectionEquality()
                    .equals(other.surveyReferences, surveyReferences)) &&
            (identical(other.schemaReferences, schemaReferences) ||
                const DeepCollectionEquality()
                    .equals(other.schemaReferences, schemaReferences)) &&
            (identical(other.configReferences, configReferences) ||
                const DeepCollectionEquality()
                    .equals(other.configReferences, configReferences)) &&
            (identical(other.fileReferences, fileReferences) ||
                const DeepCollectionEquality()
                    .equals(other.fileReferences, fileReferences)) &&
            (identical(other.assessmentReferences, assessmentReferences) ||
                const DeepCollectionEquality().equals(
                    other.assessmentReferences, assessmentReferences)) &&
            (identical(other.configElements, configElements) ||
                const DeepCollectionEquality()
                    .equals(other.configElements, configElements)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(criteria) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(surveyReferences) ^
      const DeepCollectionEquality().hash(schemaReferences) ^
      const DeepCollectionEquality().hash(configReferences) ^
      const DeepCollectionEquality().hash(fileReferences) ^
      const DeepCollectionEquality().hash(assessmentReferences) ^
      const DeepCollectionEquality().hash(configElements) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppConfigExtension on AppConfig {
  AppConfig copyWith(
      {String? label,
      DateTime? createdOn,
      DateTime? modifiedOn,
      String? guid,
      bool? deleted,
      Criteria? criteria,
      Object? clientData,
      List<SurveyReference>? surveyReferences,
      List<SchemaReference>? schemaReferences,
      List<ConfigReference>? configReferences,
      List<FileReference>? fileReferences,
      List<AssessmentReference>? assessmentReferences,
      Map<String, dynamic>? configElements,
      num? version,
      String? type}) {
    return AppConfig(
        label: label ?? this.label,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        guid: guid ?? this.guid,
        deleted: deleted ?? this.deleted,
        criteria: criteria ?? this.criteria,
        clientData: clientData ?? this.clientData,
        surveyReferences: surveyReferences ?? this.surveyReferences,
        schemaReferences: schemaReferences ?? this.schemaReferences,
        configReferences: configReferences ?? this.configReferences,
        fileReferences: fileReferences ?? this.fileReferences,
        assessmentReferences: assessmentReferences ?? this.assessmentReferences,
        configElements: configElements ?? this.configElements,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AppConfigElement {
  AppConfigElement({
    this.id,
    this.revision,
    this.deleted,
    this.data,
    this.createdOn,
    this.modifiedOn,
    this.version,
    this.type,
  });

  factory AppConfigElement.fromJson(Map<String, dynamic> json) =>
      _$AppConfigElementFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'revision', includeIfNull: false)
  final num? revision;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'data', includeIfNull: false)
  final Object? data;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppConfigElementFromJson;
  static const toJsonFactory = _$AppConfigElementToJson;
  Map<String, dynamic> toJson() => _$AppConfigElementToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppConfigElement &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppConfigElementExtension on AppConfigElement {
  AppConfigElement copyWith(
      {String? id,
      num? revision,
      bool? deleted,
      Object? data,
      DateTime? createdOn,
      DateTime? modifiedOn,
      num? version,
      String? type}) {
    return AppConfigElement(
        id: id ?? this.id,
        revision: revision ?? this.revision,
        deleted: deleted ?? this.deleted,
        data: data ?? this.data,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AppleAppLink {
  AppleAppLink({
    this.appID,
    this.paths,
    this.type,
  });

  factory AppleAppLink.fromJson(Map<String, dynamic> json) =>
      _$AppleAppLinkFromJson(json);

  @JsonKey(name: 'appID', includeIfNull: false)
  final String? appID;
  @JsonKey(name: 'paths', includeIfNull: false, defaultValue: <String>[])
  final List<String>? paths;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppleAppLinkFromJson;
  static const toJsonFactory = _$AppleAppLinkToJson;
  Map<String, dynamic> toJson() => _$AppleAppLinkToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppleAppLink &&
            (identical(other.appID, appID) ||
                const DeepCollectionEquality().equals(other.appID, appID)) &&
            (identical(other.paths, paths) ||
                const DeepCollectionEquality().equals(other.paths, paths)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appID) ^
      const DeepCollectionEquality().hash(paths) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppleAppLinkExtension on AppleAppLink {
  AppleAppLink copyWith({String? appID, List<String>? paths, String? type}) {
    return AppleAppLink(
        appID: appID ?? this.appID,
        paths: paths ?? this.paths,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Assessment {
  Assessment({
    this.guid,
    this.identifier,
    this.revision,
    this.ownerId,
    this.title,
    this.labels,
    this.colorScheme,
    this.summary,
    this.osName,
    this.originGuid,
    this.validationStatus,
    this.normingStatus,
    this.minutesToComplete,
    this.tags,
    this.customizationFields,
    this.createdOn,
    this.modifiedOn,
    this.deleted,
    this.version,
    this.type,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'revision', includeIfNull: false)
  final num? revision;
  @JsonKey(name: 'ownerId', includeIfNull: false)
  final String? ownerId;
  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'labels', includeIfNull: false, defaultValue: <Label>[])
  final List<Label>? labels;
  @JsonKey(name: 'colorScheme', includeIfNull: false)
  final ColorScheme? colorScheme;
  @JsonKey(name: 'summary', includeIfNull: false)
  final String? summary;
  @JsonKey(name: 'osName', includeIfNull: false)
  final String? osName;
  @JsonKey(name: 'originGuid', includeIfNull: false)
  final String? originGuid;
  @JsonKey(name: 'validationStatus', includeIfNull: false)
  final String? validationStatus;
  @JsonKey(name: 'normingStatus', includeIfNull: false)
  final String? normingStatus;
  @JsonKey(name: 'minutesToComplete', includeIfNull: false)
  final int? minutesToComplete;
  @JsonKey(name: 'tags', includeIfNull: false, defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'customizationFields', includeIfNull: false)
  final Map<String, dynamic>? customizationFields;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AssessmentFromJson;
  static const toJsonFactory = _$AssessmentToJson;
  Map<String, dynamic> toJson() => _$AssessmentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Assessment &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.labels, labels) ||
                const DeepCollectionEquality().equals(other.labels, labels)) &&
            (identical(other.colorScheme, colorScheme) ||
                const DeepCollectionEquality()
                    .equals(other.colorScheme, colorScheme)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.osName, osName) ||
                const DeepCollectionEquality().equals(other.osName, osName)) &&
            (identical(other.originGuid, originGuid) ||
                const DeepCollectionEquality()
                    .equals(other.originGuid, originGuid)) &&
            (identical(other.validationStatus, validationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.validationStatus, validationStatus)) &&
            (identical(other.normingStatus, normingStatus) ||
                const DeepCollectionEquality()
                    .equals(other.normingStatus, normingStatus)) &&
            (identical(other.minutesToComplete, minutesToComplete) ||
                const DeepCollectionEquality()
                    .equals(other.minutesToComplete, minutesToComplete)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.customizationFields, customizationFields) ||
                const DeepCollectionEquality()
                    .equals(other.customizationFields, customizationFields)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(labels) ^
      const DeepCollectionEquality().hash(colorScheme) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(osName) ^
      const DeepCollectionEquality().hash(originGuid) ^
      const DeepCollectionEquality().hash(validationStatus) ^
      const DeepCollectionEquality().hash(normingStatus) ^
      const DeepCollectionEquality().hash(minutesToComplete) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(customizationFields) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AssessmentExtension on Assessment {
  Assessment copyWith(
      {String? guid,
      String? identifier,
      num? revision,
      String? ownerId,
      String? title,
      List<Label>? labels,
      ColorScheme? colorScheme,
      String? summary,
      String? osName,
      String? originGuid,
      String? validationStatus,
      String? normingStatus,
      int? minutesToComplete,
      List<String>? tags,
      Map<String, dynamic>? customizationFields,
      DateTime? createdOn,
      DateTime? modifiedOn,
      bool? deleted,
      num? version,
      String? type}) {
    return Assessment(
        guid: guid ?? this.guid,
        identifier: identifier ?? this.identifier,
        revision: revision ?? this.revision,
        ownerId: ownerId ?? this.ownerId,
        title: title ?? this.title,
        labels: labels ?? this.labels,
        colorScheme: colorScheme ?? this.colorScheme,
        summary: summary ?? this.summary,
        osName: osName ?? this.osName,
        originGuid: originGuid ?? this.originGuid,
        validationStatus: validationStatus ?? this.validationStatus,
        normingStatus: normingStatus ?? this.normingStatus,
        minutesToComplete: minutesToComplete ?? this.minutesToComplete,
        tags: tags ?? this.tags,
        customizationFields: customizationFields ?? this.customizationFields,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        deleted: deleted ?? this.deleted,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AssessmentConfig {
  AssessmentConfig({
    this.config,
    this.createdOn,
    this.modifiedOn,
    this.version,
    this.type,
  });

  factory AssessmentConfig.fromJson(Map<String, dynamic> json) =>
      _$AssessmentConfigFromJson(json);

  @JsonKey(name: 'config', includeIfNull: false)
  final Object? config;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AssessmentConfigFromJson;
  static const toJsonFactory = _$AssessmentConfigToJson;
  Map<String, dynamic> toJson() => _$AssessmentConfigToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssessmentConfig &&
            (identical(other.config, config) ||
                const DeepCollectionEquality().equals(other.config, config)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(config) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AssessmentConfigExtension on AssessmentConfig {
  AssessmentConfig copyWith(
      {Object? config,
      DateTime? createdOn,
      DateTime? modifiedOn,
      num? version,
      String? type}) {
    return AssessmentConfig(
        config: config ?? this.config,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AssessmentInfo {
  AssessmentInfo({
    this.key,
    this.guid,
    this.appId,
    this.identifier,
    this.revision,
    this.label,
    this.minutesToComplete,
    this.colorScheme,
    this.configUrl,
    this.type,
  });

  factory AssessmentInfo.fromJson(Map<String, dynamic> json) =>
      _$AssessmentInfoFromJson(json);

  @JsonKey(name: 'key', includeIfNull: false)
  final String? key;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'revision', includeIfNull: false)
  final int? revision;
  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(name: 'minutesToComplete', includeIfNull: false)
  final int? minutesToComplete;
  @JsonKey(name: 'colorScheme', includeIfNull: false)
  final ColorScheme? colorScheme;
  @JsonKey(name: 'configUrl', includeIfNull: false)
  final String? configUrl;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AssessmentInfoFromJson;
  static const toJsonFactory = _$AssessmentInfoToJson;
  Map<String, dynamic> toJson() => _$AssessmentInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssessmentInfo &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.minutesToComplete, minutesToComplete) ||
                const DeepCollectionEquality()
                    .equals(other.minutesToComplete, minutesToComplete)) &&
            (identical(other.colorScheme, colorScheme) ||
                const DeepCollectionEquality()
                    .equals(other.colorScheme, colorScheme)) &&
            (identical(other.configUrl, configUrl) ||
                const DeepCollectionEquality()
                    .equals(other.configUrl, configUrl)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(minutesToComplete) ^
      const DeepCollectionEquality().hash(colorScheme) ^
      const DeepCollectionEquality().hash(configUrl) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AssessmentInfoExtension on AssessmentInfo {
  AssessmentInfo copyWith(
      {String? key,
      String? guid,
      String? appId,
      String? identifier,
      int? revision,
      String? label,
      int? minutesToComplete,
      ColorScheme? colorScheme,
      String? configUrl,
      String? type}) {
    return AssessmentInfo(
        key: key ?? this.key,
        guid: guid ?? this.guid,
        appId: appId ?? this.appId,
        identifier: identifier ?? this.identifier,
        revision: revision ?? this.revision,
        label: label ?? this.label,
        minutesToComplete: minutesToComplete ?? this.minutesToComplete,
        colorScheme: colorScheme ?? this.colorScheme,
        configUrl: configUrl ?? this.configUrl,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AssessmentReference {
  AssessmentReference({
    this.appId,
    this.guid,
    this.id,
    this.originSharedId,
    this.configHref,
    this.type,
  });

  factory AssessmentReference.fromJson(Map<String, dynamic> json) =>
      _$AssessmentReferenceFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'originSharedId', includeIfNull: false)
  final String? originSharedId;
  @JsonKey(name: 'configHref', includeIfNull: false)
  final String? configHref;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AssessmentReferenceFromJson;
  static const toJsonFactory = _$AssessmentReferenceToJson;
  Map<String, dynamic> toJson() => _$AssessmentReferenceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssessmentReference &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.originSharedId, originSharedId) ||
                const DeepCollectionEquality()
                    .equals(other.originSharedId, originSharedId)) &&
            (identical(other.configHref, configHref) ||
                const DeepCollectionEquality()
                    .equals(other.configHref, configHref)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(originSharedId) ^
      const DeepCollectionEquality().hash(configHref) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AssessmentReferenceExtension on AssessmentReference {
  AssessmentReference copyWith(
      {String? appId,
      String? guid,
      String? id,
      String? originSharedId,
      String? configHref,
      String? type}) {
    return AssessmentReference(
        appId: appId ?? this.appId,
        guid: guid ?? this.guid,
        id: id ?? this.id,
        originSharedId: originSharedId ?? this.originSharedId,
        configHref: configHref ?? this.configHref,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AssessmentReference2 {
  AssessmentReference2({
    this.appId,
    this.guid,
    this.title,
    this.identifier,
    this.revision,
    this.minutesToComplete,
    this.labels,
    this.colorScheme,
    this.type,
  });

  factory AssessmentReference2.fromJson(Map<String, dynamic> json) =>
      _$AssessmentReference2FromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'revision', includeIfNull: false)
  final int? revision;
  @JsonKey(name: 'minutesToComplete', includeIfNull: false)
  final int? minutesToComplete;
  @JsonKey(name: 'labels', includeIfNull: false, defaultValue: <Label>[])
  final List<Label>? labels;
  @JsonKey(name: 'colorScheme', includeIfNull: false)
  final ColorScheme? colorScheme;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AssessmentReference2FromJson;
  static const toJsonFactory = _$AssessmentReference2ToJson;
  Map<String, dynamic> toJson() => _$AssessmentReference2ToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssessmentReference2 &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.minutesToComplete, minutesToComplete) ||
                const DeepCollectionEquality()
                    .equals(other.minutesToComplete, minutesToComplete)) &&
            (identical(other.labels, labels) ||
                const DeepCollectionEquality().equals(other.labels, labels)) &&
            (identical(other.colorScheme, colorScheme) ||
                const DeepCollectionEquality()
                    .equals(other.colorScheme, colorScheme)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(minutesToComplete) ^
      const DeepCollectionEquality().hash(labels) ^
      const DeepCollectionEquality().hash(colorScheme) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AssessmentReference2Extension on AssessmentReference2 {
  AssessmentReference2 copyWith(
      {String? appId,
      String? guid,
      String? title,
      String? identifier,
      int? revision,
      int? minutesToComplete,
      List<Label>? labels,
      ColorScheme? colorScheme,
      String? type}) {
    return AssessmentReference2(
        appId: appId ?? this.appId,
        guid: guid ?? this.guid,
        title: title ?? this.title,
        identifier: identifier ?? this.identifier,
        revision: revision ?? this.revision,
        minutesToComplete: minutesToComplete ?? this.minutesToComplete,
        labels: labels ?? this.labels,
        colorScheme: colorScheme ?? this.colorScheme,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ClientInfo {
  ClientInfo({
    this.appName,
    this.appVersion,
    this.deviceName,
    this.osName,
    this.osVersion,
    this.sdkName,
    this.sdkVersion,
    this.type,
  });

  factory ClientInfo.fromJson(Map<String, dynamic> json) =>
      _$ClientInfoFromJson(json);

  @JsonKey(name: 'appName', includeIfNull: false)
  final String? appName;
  @JsonKey(name: 'appVersion', includeIfNull: false)
  final int? appVersion;
  @JsonKey(name: 'deviceName', includeIfNull: false)
  final String? deviceName;
  @JsonKey(name: 'osName', includeIfNull: false)
  final String? osName;
  @JsonKey(name: 'osVersion', includeIfNull: false)
  final String? osVersion;
  @JsonKey(name: 'sdkName', includeIfNull: false)
  final String? sdkName;
  @JsonKey(name: 'sdkVersion', includeIfNull: false)
  final int? sdkVersion;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ClientInfoFromJson;
  static const toJsonFactory = _$ClientInfoToJson;
  Map<String, dynamic> toJson() => _$ClientInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ClientInfo &&
            (identical(other.appName, appName) ||
                const DeepCollectionEquality()
                    .equals(other.appName, appName)) &&
            (identical(other.appVersion, appVersion) ||
                const DeepCollectionEquality()
                    .equals(other.appVersion, appVersion)) &&
            (identical(other.deviceName, deviceName) ||
                const DeepCollectionEquality()
                    .equals(other.deviceName, deviceName)) &&
            (identical(other.osName, osName) ||
                const DeepCollectionEquality().equals(other.osName, osName)) &&
            (identical(other.osVersion, osVersion) ||
                const DeepCollectionEquality()
                    .equals(other.osVersion, osVersion)) &&
            (identical(other.sdkName, sdkName) ||
                const DeepCollectionEquality()
                    .equals(other.sdkName, sdkName)) &&
            (identical(other.sdkVersion, sdkVersion) ||
                const DeepCollectionEquality()
                    .equals(other.sdkVersion, sdkVersion)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appName) ^
      const DeepCollectionEquality().hash(appVersion) ^
      const DeepCollectionEquality().hash(deviceName) ^
      const DeepCollectionEquality().hash(osName) ^
      const DeepCollectionEquality().hash(osVersion) ^
      const DeepCollectionEquality().hash(sdkName) ^
      const DeepCollectionEquality().hash(sdkVersion) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ClientInfoExtension on ClientInfo {
  ClientInfo copyWith(
      {String? appName,
      int? appVersion,
      String? deviceName,
      String? osName,
      String? osVersion,
      String? sdkName,
      int? sdkVersion,
      String? type}) {
    return ClientInfo(
        appName: appName ?? this.appName,
        appVersion: appVersion ?? this.appVersion,
        deviceName: deviceName ?? this.deviceName,
        osName: osName ?? this.osName,
        osVersion: osVersion ?? this.osVersion,
        sdkName: sdkName ?? this.sdkName,
        sdkVersion: sdkVersion ?? this.sdkVersion,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class CmsPublicKey {
  CmsPublicKey({
    this.publicKey,
    this.type,
  });

  factory CmsPublicKey.fromJson(Map<String, dynamic> json) =>
      _$CmsPublicKeyFromJson(json);

  @JsonKey(name: 'publicKey', includeIfNull: false)
  final String? publicKey;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CmsPublicKeyFromJson;
  static const toJsonFactory = _$CmsPublicKeyToJson;
  Map<String, dynamic> toJson() => _$CmsPublicKeyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CmsPublicKey &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(publicKey) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CmsPublicKeyExtension on CmsPublicKey {
  CmsPublicKey copyWith({String? publicKey, String? type}) {
    return CmsPublicKey(
        publicKey: publicKey ?? this.publicKey, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ColorScheme {
  ColorScheme({
    this.foreground,
    this.background,
    this.activated,
    this.inactivated,
    this.type,
  });

  factory ColorScheme.fromJson(Map<String, dynamic> json) =>
      _$ColorSchemeFromJson(json);

  @JsonKey(name: 'foreground', includeIfNull: false)
  final String? foreground;
  @JsonKey(name: 'background', includeIfNull: false)
  final String? background;
  @JsonKey(name: 'activated', includeIfNull: false)
  final String? activated;
  @JsonKey(name: 'inactivated', includeIfNull: false)
  final String? inactivated;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ColorSchemeFromJson;
  static const toJsonFactory = _$ColorSchemeToJson;
  Map<String, dynamic> toJson() => _$ColorSchemeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ColorScheme &&
            (identical(other.foreground, foreground) ||
                const DeepCollectionEquality()
                    .equals(other.foreground, foreground)) &&
            (identical(other.background, background) ||
                const DeepCollectionEquality()
                    .equals(other.background, background)) &&
            (identical(other.activated, activated) ||
                const DeepCollectionEquality()
                    .equals(other.activated, activated)) &&
            (identical(other.inactivated, inactivated) ||
                const DeepCollectionEquality()
                    .equals(other.inactivated, inactivated)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(foreground) ^
      const DeepCollectionEquality().hash(background) ^
      const DeepCollectionEquality().hash(activated) ^
      const DeepCollectionEquality().hash(inactivated) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ColorSchemeExtension on ColorScheme {
  ColorScheme copyWith(
      {String? foreground,
      String? background,
      String? activated,
      String? inactivated,
      String? type}) {
    return ColorScheme(
        foreground: foreground ?? this.foreground,
        background: background ?? this.background,
        activated: activated ?? this.activated,
        inactivated: inactivated ?? this.inactivated,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class CompoundActivity {
  CompoundActivity({
    this.schemaList,
    this.surveyList,
    this.taskIdentifier,
    this.type,
  });

  factory CompoundActivity.fromJson(Map<String, dynamic> json) =>
      _$CompoundActivityFromJson(json);

  @JsonKey(
      name: 'schemaList',
      includeIfNull: false,
      defaultValue: <SchemaReference>[])
  final List<SchemaReference>? schemaList;
  @JsonKey(
      name: 'surveyList',
      includeIfNull: false,
      defaultValue: <SurveyReference>[])
  final List<SurveyReference>? surveyList;
  @JsonKey(name: 'taskIdentifier', includeIfNull: false)
  final String? taskIdentifier;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CompoundActivityFromJson;
  static const toJsonFactory = _$CompoundActivityToJson;
  Map<String, dynamic> toJson() => _$CompoundActivityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompoundActivity &&
            (identical(other.schemaList, schemaList) ||
                const DeepCollectionEquality()
                    .equals(other.schemaList, schemaList)) &&
            (identical(other.surveyList, surveyList) ||
                const DeepCollectionEquality()
                    .equals(other.surveyList, surveyList)) &&
            (identical(other.taskIdentifier, taskIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.taskIdentifier, taskIdentifier)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(schemaList) ^
      const DeepCollectionEquality().hash(surveyList) ^
      const DeepCollectionEquality().hash(taskIdentifier) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CompoundActivityExtension on CompoundActivity {
  CompoundActivity copyWith(
      {List<SchemaReference>? schemaList,
      List<SurveyReference>? surveyList,
      String? taskIdentifier,
      String? type}) {
    return CompoundActivity(
        schemaList: schemaList ?? this.schemaList,
        surveyList: surveyList ?? this.surveyList,
        taskIdentifier: taskIdentifier ?? this.taskIdentifier,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class CompoundActivityDefinition {
  CompoundActivityDefinition({
    this.schemaList,
    this.surveyList,
    this.taskId,
    this.version,
    this.type,
  });

  factory CompoundActivityDefinition.fromJson(Map<String, dynamic> json) =>
      _$CompoundActivityDefinitionFromJson(json);

  @JsonKey(
      name: 'schemaList',
      includeIfNull: false,
      defaultValue: <SchemaReference>[])
  final List<SchemaReference>? schemaList;
  @JsonKey(
      name: 'surveyList',
      includeIfNull: false,
      defaultValue: <SurveyReference>[])
  final List<SurveyReference>? surveyList;
  @JsonKey(name: 'taskId', includeIfNull: false)
  final String? taskId;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CompoundActivityDefinitionFromJson;
  static const toJsonFactory = _$CompoundActivityDefinitionToJson;
  Map<String, dynamic> toJson() => _$CompoundActivityDefinitionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompoundActivityDefinition &&
            (identical(other.schemaList, schemaList) ||
                const DeepCollectionEquality()
                    .equals(other.schemaList, schemaList)) &&
            (identical(other.surveyList, surveyList) ||
                const DeepCollectionEquality()
                    .equals(other.surveyList, surveyList)) &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(schemaList) ^
      const DeepCollectionEquality().hash(surveyList) ^
      const DeepCollectionEquality().hash(taskId) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CompoundActivityDefinitionExtension on CompoundActivityDefinition {
  CompoundActivityDefinition copyWith(
      {List<SchemaReference>? schemaList,
      List<SurveyReference>? surveyList,
      String? taskId,
      num? version,
      String? type}) {
    return CompoundActivityDefinition(
        schemaList: schemaList ?? this.schemaList,
        surveyList: surveyList ?? this.surveyList,
        taskId: taskId ?? this.taskId,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ConfigReference {
  ConfigReference({
    this.id,
    this.revision,
    this.type,
  });

  factory ConfigReference.fromJson(Map<String, dynamic> json) =>
      _$ConfigReferenceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'revision', includeIfNull: false)
  final num? revision;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ConfigReferenceFromJson;
  static const toJsonFactory = _$ConfigReferenceToJson;
  Map<String, dynamic> toJson() => _$ConfigReferenceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfigReference &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ConfigReferenceExtension on ConfigReference {
  ConfigReference copyWith({String? id, num? revision, String? type}) {
    return ConfigReference(
        id: id ?? this.id,
        revision: revision ?? this.revision,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ConsentSignature {
  ConsentSignature({
    this.name,
    this.birthdate,
    this.imageData,
    this.imageMimeType,
    this.signedOn,
    this.withdrewOn,
    this.scope,
    this.type,
  });

  factory ConsentSignature.fromJson(Map<String, dynamic> json) =>
      _$ConsentSignatureFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'birthdate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? birthdate;
  @JsonKey(name: 'imageData', includeIfNull: false)
  final String? imageData;
  @JsonKey(name: 'imageMimeType', includeIfNull: false)
  final String? imageMimeType;
  @JsonKey(name: 'signedOn', includeIfNull: false)
  final DateTime? signedOn;
  @JsonKey(name: 'withdrewOn', includeIfNull: false)
  final DateTime? withdrewOn;
  @JsonKey(
      name: 'scope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? scope;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ConsentSignatureFromJson;
  static const toJsonFactory = _$ConsentSignatureToJson;
  Map<String, dynamic> toJson() => _$ConsentSignatureToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConsentSignature &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.birthdate, birthdate) ||
                const DeepCollectionEquality()
                    .equals(other.birthdate, birthdate)) &&
            (identical(other.imageData, imageData) ||
                const DeepCollectionEquality()
                    .equals(other.imageData, imageData)) &&
            (identical(other.imageMimeType, imageMimeType) ||
                const DeepCollectionEquality()
                    .equals(other.imageMimeType, imageMimeType)) &&
            (identical(other.signedOn, signedOn) ||
                const DeepCollectionEquality()
                    .equals(other.signedOn, signedOn)) &&
            (identical(other.withdrewOn, withdrewOn) ||
                const DeepCollectionEquality()
                    .equals(other.withdrewOn, withdrewOn)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(birthdate) ^
      const DeepCollectionEquality().hash(imageData) ^
      const DeepCollectionEquality().hash(imageMimeType) ^
      const DeepCollectionEquality().hash(signedOn) ^
      const DeepCollectionEquality().hash(withdrewOn) ^
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ConsentSignatureExtension on ConsentSignature {
  ConsentSignature copyWith(
      {String? name,
      DateTime? birthdate,
      String? imageData,
      String? imageMimeType,
      DateTime? signedOn,
      DateTime? withdrewOn,
      enums.SharingScope? scope,
      String? type}) {
    return ConsentSignature(
        name: name ?? this.name,
        birthdate: birthdate ?? this.birthdate,
        imageData: imageData ?? this.imageData,
        imageMimeType: imageMimeType ?? this.imageMimeType,
        signedOn: signedOn ?? this.signedOn,
        withdrewOn: withdrewOn ?? this.withdrewOn,
        scope: scope ?? this.scope,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ConsentStatus {
  ConsentStatus({
    this.name,
    this.subpopulationGuid,
    this.required,
    this.signedOn,
    this.consented,
    this.signedMostRecentConsent,
    this.type,
  });

  factory ConsentStatus.fromJson(Map<String, dynamic> json) =>
      _$ConsentStatusFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'subpopulationGuid', includeIfNull: false)
  final String? subpopulationGuid;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'signedOn', includeIfNull: false)
  final DateTime? signedOn;
  @JsonKey(name: 'consented', includeIfNull: false)
  final bool? consented;
  @JsonKey(name: 'signedMostRecentConsent', includeIfNull: false)
  final bool? signedMostRecentConsent;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ConsentStatusFromJson;
  static const toJsonFactory = _$ConsentStatusToJson;
  Map<String, dynamic> toJson() => _$ConsentStatusToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConsentStatus &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.subpopulationGuid, subpopulationGuid) ||
                const DeepCollectionEquality()
                    .equals(other.subpopulationGuid, subpopulationGuid)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.signedOn, signedOn) ||
                const DeepCollectionEquality()
                    .equals(other.signedOn, signedOn)) &&
            (identical(other.consented, consented) ||
                const DeepCollectionEquality()
                    .equals(other.consented, consented)) &&
            (identical(
                    other.signedMostRecentConsent, signedMostRecentConsent) ||
                const DeepCollectionEquality().equals(
                    other.signedMostRecentConsent, signedMostRecentConsent)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(subpopulationGuid) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(signedOn) ^
      const DeepCollectionEquality().hash(consented) ^
      const DeepCollectionEquality().hash(signedMostRecentConsent) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ConsentStatusExtension on ConsentStatus {
  ConsentStatus copyWith(
      {String? name,
      String? subpopulationGuid,
      bool? required,
      DateTime? signedOn,
      bool? consented,
      bool? signedMostRecentConsent,
      String? type}) {
    return ConsentStatus(
        name: name ?? this.name,
        subpopulationGuid: subpopulationGuid ?? this.subpopulationGuid,
        required: required ?? this.required,
        signedOn: signedOn ?? this.signedOn,
        consented: consented ?? this.consented,
        signedMostRecentConsent:
            signedMostRecentConsent ?? this.signedMostRecentConsent,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Contact {
  Contact({
    this.role,
    this.name,
    this.position,
    this.affiliation,
    this.address,
    this.email,
    this.phone,
    this.jurisdiction,
    this.type,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  @JsonKey(
      name: 'role',
      includeIfNull: false,
      toJson: contactRoleToJson,
      fromJson: contactRoleFromJson)
  final enums.ContactRole? role;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'position', includeIfNull: false)
  final String? position;
  @JsonKey(name: 'affiliation', includeIfNull: false)
  final String? affiliation;
  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'jurisdiction', includeIfNull: false)
  final String? jurisdiction;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ContactFromJson;
  static const toJsonFactory = _$ContactToJson;
  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Contact &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.affiliation, affiliation) ||
                const DeepCollectionEquality()
                    .equals(other.affiliation, affiliation)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.jurisdiction, jurisdiction) ||
                const DeepCollectionEquality()
                    .equals(other.jurisdiction, jurisdiction)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(affiliation) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(jurisdiction) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ContactExtension on Contact {
  Contact copyWith(
      {enums.ContactRole? role,
      String? name,
      String? position,
      String? affiliation,
      Address? address,
      String? email,
      Phone? phone,
      String? jurisdiction,
      String? type}) {
    return Contact(
        role: role ?? this.role,
        name: name ?? this.name,
        position: position ?? this.position,
        affiliation: affiliation ?? this.affiliation,
        address: address ?? this.address,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        jurisdiction: jurisdiction ?? this.jurisdiction,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class CreatedOnHolder {
  CreatedOnHolder({
    this.createdOn,
    this.type,
  });

  factory CreatedOnHolder.fromJson(Map<String, dynamic> json) =>
      _$CreatedOnHolderFromJson(json);

  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CreatedOnHolderFromJson;
  static const toJsonFactory = _$CreatedOnHolderToJson;
  Map<String, dynamic> toJson() => _$CreatedOnHolderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreatedOnHolder &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CreatedOnHolderExtension on CreatedOnHolder {
  CreatedOnHolder copyWith({DateTime? createdOn, String? type}) {
    return CreatedOnHolder(
        createdOn: createdOn ?? this.createdOn, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Criteria {
  Criteria({
    this.language,
    this.allOfGroups,
    this.noneOfGroups,
    this.allOfStudyIds,
    this.noneOfStudyIds,
    this.minAppVersions,
    this.maxAppVersions,
    this.type,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) =>
      _$CriteriaFromJson(json);

  @JsonKey(name: 'language', includeIfNull: false)
  final String? language;
  @JsonKey(name: 'allOfGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? allOfGroups;
  @JsonKey(name: 'noneOfGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? noneOfGroups;
  @JsonKey(
      name: 'allOfStudyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? allOfStudyIds;
  @JsonKey(
      name: 'noneOfStudyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? noneOfStudyIds;
  @JsonKey(name: 'minAppVersions', includeIfNull: false)
  final Map<String, dynamic>? minAppVersions;
  @JsonKey(name: 'maxAppVersions', includeIfNull: false)
  final Map<String, dynamic>? maxAppVersions;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CriteriaFromJson;
  static const toJsonFactory = _$CriteriaToJson;
  Map<String, dynamic> toJson() => _$CriteriaToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Criteria &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.allOfGroups, allOfGroups) ||
                const DeepCollectionEquality()
                    .equals(other.allOfGroups, allOfGroups)) &&
            (identical(other.noneOfGroups, noneOfGroups) ||
                const DeepCollectionEquality()
                    .equals(other.noneOfGroups, noneOfGroups)) &&
            (identical(other.allOfStudyIds, allOfStudyIds) ||
                const DeepCollectionEquality()
                    .equals(other.allOfStudyIds, allOfStudyIds)) &&
            (identical(other.noneOfStudyIds, noneOfStudyIds) ||
                const DeepCollectionEquality()
                    .equals(other.noneOfStudyIds, noneOfStudyIds)) &&
            (identical(other.minAppVersions, minAppVersions) ||
                const DeepCollectionEquality()
                    .equals(other.minAppVersions, minAppVersions)) &&
            (identical(other.maxAppVersions, maxAppVersions) ||
                const DeepCollectionEquality()
                    .equals(other.maxAppVersions, maxAppVersions)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(allOfGroups) ^
      const DeepCollectionEquality().hash(noneOfGroups) ^
      const DeepCollectionEquality().hash(allOfStudyIds) ^
      const DeepCollectionEquality().hash(noneOfStudyIds) ^
      const DeepCollectionEquality().hash(minAppVersions) ^
      const DeepCollectionEquality().hash(maxAppVersions) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CriteriaExtension on Criteria {
  Criteria copyWith(
      {String? language,
      List<String>? allOfGroups,
      List<String>? noneOfGroups,
      List<String>? allOfStudyIds,
      List<String>? noneOfStudyIds,
      Map<String, dynamic>? minAppVersions,
      Map<String, dynamic>? maxAppVersions,
      String? type}) {
    return Criteria(
        language: language ?? this.language,
        allOfGroups: allOfGroups ?? this.allOfGroups,
        noneOfGroups: noneOfGroups ?? this.noneOfGroups,
        allOfStudyIds: allOfStudyIds ?? this.allOfStudyIds,
        noneOfStudyIds: noneOfStudyIds ?? this.noneOfStudyIds,
        minAppVersions: minAppVersions ?? this.minAppVersions,
        maxAppVersions: maxAppVersions ?? this.maxAppVersions,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class CriteriaScheduleStrategy {
  CriteriaScheduleStrategy({
    this.scheduleCriteria,
    this.type,
  });

  factory CriteriaScheduleStrategy.fromJson(Map<String, dynamic> json) =>
      _$CriteriaScheduleStrategyFromJson(json);

  @JsonKey(
      name: 'scheduleCriteria',
      includeIfNull: false,
      defaultValue: <ScheduleCriteria>[])
  final List<ScheduleCriteria>? scheduleCriteria;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CriteriaScheduleStrategyFromJson;
  static const toJsonFactory = _$CriteriaScheduleStrategyToJson;
  Map<String, dynamic> toJson() => _$CriteriaScheduleStrategyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CriteriaScheduleStrategy &&
            (identical(other.scheduleCriteria, scheduleCriteria) ||
                const DeepCollectionEquality()
                    .equals(other.scheduleCriteria, scheduleCriteria)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(scheduleCriteria) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CriteriaScheduleStrategyExtension on CriteriaScheduleStrategy {
  CriteriaScheduleStrategy copyWith(
      {List<ScheduleCriteria>? scheduleCriteria, String? type}) {
    return CriteriaScheduleStrategy(
        scheduleCriteria: scheduleCriteria ?? this.scheduleCriteria,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomActivityEventRequest {
  CustomActivityEventRequest({
    this.eventId,
    this.timestamp,
    this.type,
  });

  factory CustomActivityEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomActivityEventRequestFromJson(json);

  @JsonKey(name: 'eventId', includeIfNull: false)
  final String? eventId;
  @JsonKey(name: 'timestamp', includeIfNull: false)
  final DateTime? timestamp;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CustomActivityEventRequestFromJson;
  static const toJsonFactory = _$CustomActivityEventRequestToJson;
  Map<String, dynamic> toJson() => _$CustomActivityEventRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomActivityEventRequest &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CustomActivityEventRequestExtension on CustomActivityEventRequest {
  CustomActivityEventRequest copyWith(
      {String? eventId, DateTime? timestamp, String? type}) {
    return CustomActivityEventRequest(
        eventId: eventId ?? this.eventId,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomEvent {
  CustomEvent({
    this.eventId,
    this.updateType,
    this.type,
  });

  factory CustomEvent.fromJson(Map<String, dynamic> json) =>
      _$CustomEventFromJson(json);

  @JsonKey(name: 'eventId', includeIfNull: false)
  final String? eventId;
  @JsonKey(
      name: 'updateType',
      includeIfNull: false,
      toJson: activityEventUpdateTypeToJson,
      fromJson: activityEventUpdateTypeFromJson)
  final enums.ActivityEventUpdateType? updateType;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CustomEventFromJson;
  static const toJsonFactory = _$CustomEventToJson;
  Map<String, dynamic> toJson() => _$CustomEventToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomEvent &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.updateType, updateType) ||
                const DeepCollectionEquality()
                    .equals(other.updateType, updateType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(updateType) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CustomEventExtension on CustomEvent {
  CustomEvent copyWith(
      {String? eventId,
      enums.ActivityEventUpdateType? updateType,
      String? type}) {
    return CustomEvent(
        eventId: eventId ?? this.eventId,
        updateType: updateType ?? this.updateType,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class DataGroups {
  DataGroups({
    this.dataGroups,
    this.type,
  });

  factory DataGroups.fromJson(Map<String, dynamic> json) =>
      _$DataGroupsFromJson(json);

  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$DataGroupsFromJson;
  static const toJsonFactory = _$DataGroupsToJson;
  Map<String, dynamic> toJson() => _$DataGroupsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DataGroups &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $DataGroupsExtension on DataGroups {
  DataGroups copyWith({List<String>? dataGroups, String? type}) {
    return DataGroups(
        dataGroups: dataGroups ?? this.dataGroups, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class DateRange {
  DateRange({
    this.startDate,
    this.endDate,
  });

  factory DateRange.fromJson(Map<String, dynamic> json) =>
      _$DateRangeFromJson(json);

  @JsonKey(name: 'startDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? startDate;
  @JsonKey(name: 'endDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? endDate;
  static const fromJsonFactory = _$DateRangeFromJson;
  static const toJsonFactory = _$DateRangeToJson;
  Map<String, dynamic> toJson() => _$DateRangeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DateRange &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      runtimeType.hashCode;
}

extension $DateRangeExtension on DateRange {
  DateRange copyWith({DateTime? startDate, DateTime? endDate}) {
    return DateRange(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}

@JsonSerializable(explicitToJson: true)
class DayRange {
  DayRange({
    this.min,
    this.max,
    this.type,
  });

  factory DayRange.fromJson(Map<String, dynamic> json) =>
      _$DayRangeFromJson(json);

  @JsonKey(name: 'min', includeIfNull: false)
  final int? min;
  @JsonKey(name: 'max', includeIfNull: false)
  final int? max;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$DayRangeFromJson;
  static const toJsonFactory = _$DayRangeToJson;
  Map<String, dynamic> toJson() => _$DayRangeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DayRange &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $DayRangeExtension on DayRange {
  DayRange copyWith({int? min, int? max, String? type}) {
    return DayRange(
        min: min ?? this.min, max: max ?? this.max, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EmailSignIn {
  EmailSignIn({
    this.appId,
    this.email,
    this.token,
    this.type,
  });

  factory EmailSignIn.fromJson(Map<String, dynamic> json) =>
      _$EmailSignInFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'token', includeIfNull: false)
  final String? token;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EmailSignInFromJson;
  static const toJsonFactory = _$EmailSignInToJson;
  Map<String, dynamic> toJson() => _$EmailSignInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailSignIn &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EmailSignInExtension on EmailSignIn {
  EmailSignIn copyWith(
      {String? appId, String? email, String? token, String? type}) {
    return EmailSignIn(
        appId: appId ?? this.appId,
        email: email ?? this.email,
        token: token ?? this.token,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EmailSignInRequest {
  EmailSignInRequest({
    this.appId,
    this.email,
    this.type,
  });

  factory EmailSignInRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailSignInRequestFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EmailSignInRequestFromJson;
  static const toJsonFactory = _$EmailSignInRequestToJson;
  Map<String, dynamic> toJson() => _$EmailSignInRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailSignInRequest &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EmailSignInRequestExtension on EmailSignInRequest {
  EmailSignInRequest copyWith({String? appId, String? email, String? type}) {
    return EmailSignInRequest(
        appId: appId ?? this.appId,
        email: email ?? this.email,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EmailVerificationStatus {
  EmailVerificationStatus({
    this.status,
    this.type,
  });

  factory EmailVerificationStatus.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationStatusFromJson(json);

  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EmailVerificationStatusFromJson;
  static const toJsonFactory = _$EmailVerificationStatusToJson;
  Map<String, dynamic> toJson() => _$EmailVerificationStatusToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailVerificationStatus &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EmailVerificationStatusExtension on EmailVerificationStatus {
  EmailVerificationStatus copyWith(
      {enums.AccountStatus? status, String? type}) {
    return EmailVerificationStatus(
        status: status ?? this.status, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Enrollment {
  Enrollment({
    this.externalId,
    this.userId,
    this.consentRequired,
    this.enrolledOn,
    this.enrolledBy,
    this.withdrawnOn,
    this.withdrawnBy,
    this.withdrawalNote,
    this.note,
    this.type,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentFromJson(json);

  @JsonKey(name: 'externalId', includeIfNull: false)
  final String? externalId;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'consentRequired', includeIfNull: false, defaultValue: false)
  final bool? consentRequired;
  @JsonKey(name: 'enrolledOn', includeIfNull: false)
  final DateTime? enrolledOn;
  @JsonKey(name: 'enrolledBy', includeIfNull: false)
  final String? enrolledBy;
  @JsonKey(name: 'withdrawnOn', includeIfNull: false)
  final DateTime? withdrawnOn;
  @JsonKey(name: 'withdrawnBy', includeIfNull: false)
  final String? withdrawnBy;
  @JsonKey(name: 'withdrawalNote', includeIfNull: false)
  final String? withdrawalNote;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EnrollmentFromJson;
  static const toJsonFactory = _$EnrollmentToJson;
  Map<String, dynamic> toJson() => _$EnrollmentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Enrollment &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.consentRequired, consentRequired) ||
                const DeepCollectionEquality()
                    .equals(other.consentRequired, consentRequired)) &&
            (identical(other.enrolledOn, enrolledOn) ||
                const DeepCollectionEquality()
                    .equals(other.enrolledOn, enrolledOn)) &&
            (identical(other.enrolledBy, enrolledBy) ||
                const DeepCollectionEquality()
                    .equals(other.enrolledBy, enrolledBy)) &&
            (identical(other.withdrawnOn, withdrawnOn) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawnOn, withdrawnOn)) &&
            (identical(other.withdrawnBy, withdrawnBy) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawnBy, withdrawnBy)) &&
            (identical(other.withdrawalNote, withdrawalNote) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawalNote, withdrawalNote)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(consentRequired) ^
      const DeepCollectionEquality().hash(enrolledOn) ^
      const DeepCollectionEquality().hash(enrolledBy) ^
      const DeepCollectionEquality().hash(withdrawnOn) ^
      const DeepCollectionEquality().hash(withdrawnBy) ^
      const DeepCollectionEquality().hash(withdrawalNote) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EnrollmentExtension on Enrollment {
  Enrollment copyWith(
      {String? externalId,
      String? userId,
      bool? consentRequired,
      DateTime? enrolledOn,
      String? enrolledBy,
      DateTime? withdrawnOn,
      String? withdrawnBy,
      String? withdrawalNote,
      String? note,
      String? type}) {
    return Enrollment(
        externalId: externalId ?? this.externalId,
        userId: userId ?? this.userId,
        consentRequired: consentRequired ?? this.consentRequired,
        enrolledOn: enrolledOn ?? this.enrolledOn,
        enrolledBy: enrolledBy ?? this.enrolledBy,
        withdrawnOn: withdrawnOn ?? this.withdrawnOn,
        withdrawnBy: withdrawnBy ?? this.withdrawnBy,
        withdrawalNote: withdrawalNote ?? this.withdrawalNote,
        note: note ?? this.note,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EnrollmentDetail {
  EnrollmentDetail({
    this.studyId,
    this.externalId,
    this.participant,
    this.consentRequired,
    this.enrolledOn,
    this.enrolledBy,
    this.withdrawnOn,
    this.withdrawnBy,
    this.withdrawalNote,
    this.note,
    this.type,
  });

  factory EnrollmentDetail.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentDetailFromJson(json);

  @JsonKey(name: 'studyId', includeIfNull: false)
  final String? studyId;
  @JsonKey(name: 'externalId', includeIfNull: false)
  final String? externalId;
  @JsonKey(name: 'participant', includeIfNull: false)
  final AccountRef? participant;
  @JsonKey(name: 'consentRequired', includeIfNull: false)
  final bool? consentRequired;
  @JsonKey(name: 'enrolledOn', includeIfNull: false)
  final DateTime? enrolledOn;
  @JsonKey(name: 'enrolledBy', includeIfNull: false)
  final AccountRef? enrolledBy;
  @JsonKey(name: 'withdrawnOn', includeIfNull: false)
  final DateTime? withdrawnOn;
  @JsonKey(name: 'withdrawnBy', includeIfNull: false)
  final AccountRef? withdrawnBy;
  @JsonKey(name: 'withdrawalNote', includeIfNull: false)
  final String? withdrawalNote;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EnrollmentDetailFromJson;
  static const toJsonFactory = _$EnrollmentDetailToJson;
  Map<String, dynamic> toJson() => _$EnrollmentDetailToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrollmentDetail &&
            (identical(other.studyId, studyId) ||
                const DeepCollectionEquality()
                    .equals(other.studyId, studyId)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.participant, participant) ||
                const DeepCollectionEquality()
                    .equals(other.participant, participant)) &&
            (identical(other.consentRequired, consentRequired) ||
                const DeepCollectionEquality()
                    .equals(other.consentRequired, consentRequired)) &&
            (identical(other.enrolledOn, enrolledOn) ||
                const DeepCollectionEquality()
                    .equals(other.enrolledOn, enrolledOn)) &&
            (identical(other.enrolledBy, enrolledBy) ||
                const DeepCollectionEquality()
                    .equals(other.enrolledBy, enrolledBy)) &&
            (identical(other.withdrawnOn, withdrawnOn) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawnOn, withdrawnOn)) &&
            (identical(other.withdrawnBy, withdrawnBy) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawnBy, withdrawnBy)) &&
            (identical(other.withdrawalNote, withdrawalNote) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawalNote, withdrawalNote)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(studyId) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(participant) ^
      const DeepCollectionEquality().hash(consentRequired) ^
      const DeepCollectionEquality().hash(enrolledOn) ^
      const DeepCollectionEquality().hash(enrolledBy) ^
      const DeepCollectionEquality().hash(withdrawnOn) ^
      const DeepCollectionEquality().hash(withdrawnBy) ^
      const DeepCollectionEquality().hash(withdrawalNote) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EnrollmentDetailExtension on EnrollmentDetail {
  EnrollmentDetail copyWith(
      {String? studyId,
      String? externalId,
      AccountRef? participant,
      bool? consentRequired,
      DateTime? enrolledOn,
      AccountRef? enrolledBy,
      DateTime? withdrawnOn,
      AccountRef? withdrawnBy,
      String? withdrawalNote,
      String? note,
      String? type}) {
    return EnrollmentDetail(
        studyId: studyId ?? this.studyId,
        externalId: externalId ?? this.externalId,
        participant: participant ?? this.participant,
        consentRequired: consentRequired ?? this.consentRequired,
        enrolledOn: enrolledOn ?? this.enrolledOn,
        enrolledBy: enrolledBy ?? this.enrolledBy,
        withdrawnOn: withdrawnOn ?? this.withdrawnOn,
        withdrawnBy: withdrawnBy ?? this.withdrawnBy,
        withdrawalNote: withdrawalNote ?? this.withdrawalNote,
        note: note ?? this.note,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EnrollmentInfo {
  EnrollmentInfo({
    this.externalId,
    this.consentRequired,
    this.enrolledOn,
    this.withdrawnOn,
    this.enrolledBySelf,
    this.withdrawnBySelf,
    this.type,
  });

  factory EnrollmentInfo.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentInfoFromJson(json);

  @JsonKey(name: 'externalId', includeIfNull: false)
  final String? externalId;
  @JsonKey(name: 'consentRequired', includeIfNull: false)
  final bool? consentRequired;
  @JsonKey(name: 'enrolledOn', includeIfNull: false)
  final DateTime? enrolledOn;
  @JsonKey(name: 'withdrawnOn', includeIfNull: false)
  final DateTime? withdrawnOn;
  @JsonKey(name: 'enrolledBySelf', includeIfNull: false)
  final bool? enrolledBySelf;
  @JsonKey(name: 'withdrawnBySelf', includeIfNull: false)
  final bool? withdrawnBySelf;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EnrollmentInfoFromJson;
  static const toJsonFactory = _$EnrollmentInfoToJson;
  Map<String, dynamic> toJson() => _$EnrollmentInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrollmentInfo &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.consentRequired, consentRequired) ||
                const DeepCollectionEquality()
                    .equals(other.consentRequired, consentRequired)) &&
            (identical(other.enrolledOn, enrolledOn) ||
                const DeepCollectionEquality()
                    .equals(other.enrolledOn, enrolledOn)) &&
            (identical(other.withdrawnOn, withdrawnOn) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawnOn, withdrawnOn)) &&
            (identical(other.enrolledBySelf, enrolledBySelf) ||
                const DeepCollectionEquality()
                    .equals(other.enrolledBySelf, enrolledBySelf)) &&
            (identical(other.withdrawnBySelf, withdrawnBySelf) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawnBySelf, withdrawnBySelf)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(consentRequired) ^
      const DeepCollectionEquality().hash(enrolledOn) ^
      const DeepCollectionEquality().hash(withdrawnOn) ^
      const DeepCollectionEquality().hash(enrolledBySelf) ^
      const DeepCollectionEquality().hash(withdrawnBySelf) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EnrollmentInfoExtension on EnrollmentInfo {
  EnrollmentInfo copyWith(
      {String? externalId,
      bool? consentRequired,
      DateTime? enrolledOn,
      DateTime? withdrawnOn,
      bool? enrolledBySelf,
      bool? withdrawnBySelf,
      String? type}) {
    return EnrollmentInfo(
        externalId: externalId ?? this.externalId,
        consentRequired: consentRequired ?? this.consentRequired,
        enrolledOn: enrolledOn ?? this.enrolledOn,
        withdrawnOn: withdrawnOn ?? this.withdrawnOn,
        enrolledBySelf: enrolledBySelf ?? this.enrolledBySelf,
        withdrawnBySelf: withdrawnBySelf ?? this.withdrawnBySelf,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EventStream {
  EventStream({
    this.startEventId,
    this.sessionGuids,
    this.eventTimestamp,
    this.daysSinceEvent,
    this.studyBurstId,
    this.studyBurstNum,
    this.byDayEntries,
    this.type,
  });

  factory EventStream.fromJson(Map<String, dynamic> json) =>
      _$EventStreamFromJson(json);

  @JsonKey(name: 'startEventId', includeIfNull: false)
  final String? startEventId;
  @JsonKey(name: 'sessionGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? sessionGuids;
  @JsonKey(name: 'eventTimestamp', includeIfNull: false)
  final DateTime? eventTimestamp;
  @JsonKey(name: 'daysSinceEvent', includeIfNull: false)
  final int? daysSinceEvent;
  @JsonKey(name: 'studyBurstId', includeIfNull: false)
  final String? studyBurstId;
  @JsonKey(name: 'studyBurstNum', includeIfNull: false)
  final int? studyBurstNum;
  @JsonKey(name: 'byDayEntries', includeIfNull: false)
  final Map<String, dynamic>? byDayEntries;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EventStreamFromJson;
  static const toJsonFactory = _$EventStreamToJson;
  Map<String, dynamic> toJson() => _$EventStreamToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventStream &&
            (identical(other.startEventId, startEventId) ||
                const DeepCollectionEquality()
                    .equals(other.startEventId, startEventId)) &&
            (identical(other.sessionGuids, sessionGuids) ||
                const DeepCollectionEquality()
                    .equals(other.sessionGuids, sessionGuids)) &&
            (identical(other.eventTimestamp, eventTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.eventTimestamp, eventTimestamp)) &&
            (identical(other.daysSinceEvent, daysSinceEvent) ||
                const DeepCollectionEquality()
                    .equals(other.daysSinceEvent, daysSinceEvent)) &&
            (identical(other.studyBurstId, studyBurstId) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstId, studyBurstId)) &&
            (identical(other.studyBurstNum, studyBurstNum) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstNum, studyBurstNum)) &&
            (identical(other.byDayEntries, byDayEntries) ||
                const DeepCollectionEquality()
                    .equals(other.byDayEntries, byDayEntries)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(startEventId) ^
      const DeepCollectionEquality().hash(sessionGuids) ^
      const DeepCollectionEquality().hash(eventTimestamp) ^
      const DeepCollectionEquality().hash(daysSinceEvent) ^
      const DeepCollectionEquality().hash(studyBurstId) ^
      const DeepCollectionEquality().hash(studyBurstNum) ^
      const DeepCollectionEquality().hash(byDayEntries) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EventStreamExtension on EventStream {
  EventStream copyWith(
      {String? startEventId,
      List<String>? sessionGuids,
      DateTime? eventTimestamp,
      int? daysSinceEvent,
      String? studyBurstId,
      int? studyBurstNum,
      Map<String, dynamic>? byDayEntries,
      String? type}) {
    return EventStream(
        startEventId: startEventId ?? this.startEventId,
        sessionGuids: sessionGuids ?? this.sessionGuids,
        eventTimestamp: eventTimestamp ?? this.eventTimestamp,
        daysSinceEvent: daysSinceEvent ?? this.daysSinceEvent,
        studyBurstId: studyBurstId ?? this.studyBurstId,
        studyBurstNum: studyBurstNum ?? this.studyBurstNum,
        byDayEntries: byDayEntries ?? this.byDayEntries,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EventStreamAdherenceReport {
  EventStreamAdherenceReport({
    this.activeOnly,
    this.timestamp,
    this.clientTimeZone,
    this.adherencePercent,
    this.dayRangeOfAllStreams,
    this.streams,
    this.type,
  });

  factory EventStreamAdherenceReport.fromJson(Map<String, dynamic> json) =>
      _$EventStreamAdherenceReportFromJson(json);

  @JsonKey(name: 'activeOnly', includeIfNull: false)
  final bool? activeOnly;
  @JsonKey(name: 'timestamp', includeIfNull: false)
  final DateTime? timestamp;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  @JsonKey(name: 'adherencePercent', includeIfNull: false)
  final int? adherencePercent;
  @JsonKey(name: 'dayRangeOfAllStreams', includeIfNull: false)
  final DayRange? dayRangeOfAllStreams;
  @JsonKey(name: 'streams', includeIfNull: false, defaultValue: <EventStream>[])
  final List<EventStream>? streams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EventStreamAdherenceReportFromJson;
  static const toJsonFactory = _$EventStreamAdherenceReportToJson;
  Map<String, dynamic> toJson() => _$EventStreamAdherenceReportToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventStreamAdherenceReport &&
            (identical(other.activeOnly, activeOnly) ||
                const DeepCollectionEquality()
                    .equals(other.activeOnly, activeOnly)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.clientTimeZone, clientTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.clientTimeZone, clientTimeZone)) &&
            (identical(other.adherencePercent, adherencePercent) ||
                const DeepCollectionEquality()
                    .equals(other.adherencePercent, adherencePercent)) &&
            (identical(other.dayRangeOfAllStreams, dayRangeOfAllStreams) ||
                const DeepCollectionEquality().equals(
                    other.dayRangeOfAllStreams, dayRangeOfAllStreams)) &&
            (identical(other.streams, streams) ||
                const DeepCollectionEquality()
                    .equals(other.streams, streams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(activeOnly) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      const DeepCollectionEquality().hash(adherencePercent) ^
      const DeepCollectionEquality().hash(dayRangeOfAllStreams) ^
      const DeepCollectionEquality().hash(streams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EventStreamAdherenceReportExtension on EventStreamAdherenceReport {
  EventStreamAdherenceReport copyWith(
      {bool? activeOnly,
      DateTime? timestamp,
      String? clientTimeZone,
      int? adherencePercent,
      DayRange? dayRangeOfAllStreams,
      List<EventStream>? streams,
      String? type}) {
    return EventStreamAdherenceReport(
        activeOnly: activeOnly ?? this.activeOnly,
        timestamp: timestamp ?? this.timestamp,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone,
        adherencePercent: adherencePercent ?? this.adherencePercent,
        dayRangeOfAllStreams: dayRangeOfAllStreams ?? this.dayRangeOfAllStreams,
        streams: streams ?? this.streams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EventStreamDay {
  EventStreamDay({
    this.sessionGuid,
    this.sessionName,
    this.sessionSymbol,
    this.week,
    this.studyBurstId,
    this.studyBurstNum,
    this.startDay,
    this.startDate,
    this.timeWindows,
    this.type,
  });

  factory EventStreamDay.fromJson(Map<String, dynamic> json) =>
      _$EventStreamDayFromJson(json);

  @JsonKey(name: 'sessionGuid', includeIfNull: false)
  final String? sessionGuid;
  @JsonKey(name: 'sessionName', includeIfNull: false)
  final String? sessionName;
  @JsonKey(name: 'sessionSymbol', includeIfNull: false)
  final String? sessionSymbol;
  @JsonKey(name: 'week', includeIfNull: false)
  final int? week;
  @JsonKey(name: 'studyBurstId', includeIfNull: false)
  final String? studyBurstId;
  @JsonKey(name: 'studyBurstNum', includeIfNull: false)
  final int? studyBurstNum;
  @JsonKey(name: 'startDay', includeIfNull: false)
  final int? startDay;
  @JsonKey(name: 'startDate', includeIfNull: false)
  final dynamic startDate;
  @JsonKey(
      name: 'timeWindows',
      includeIfNull: false,
      defaultValue: <EventStreamWindow>[])
  final List<EventStreamWindow>? timeWindows;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EventStreamDayFromJson;
  static const toJsonFactory = _$EventStreamDayToJson;
  Map<String, dynamic> toJson() => _$EventStreamDayToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventStreamDay &&
            (identical(other.sessionGuid, sessionGuid) ||
                const DeepCollectionEquality()
                    .equals(other.sessionGuid, sessionGuid)) &&
            (identical(other.sessionName, sessionName) ||
                const DeepCollectionEquality()
                    .equals(other.sessionName, sessionName)) &&
            (identical(other.sessionSymbol, sessionSymbol) ||
                const DeepCollectionEquality()
                    .equals(other.sessionSymbol, sessionSymbol)) &&
            (identical(other.week, week) ||
                const DeepCollectionEquality().equals(other.week, week)) &&
            (identical(other.studyBurstId, studyBurstId) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstId, studyBurstId)) &&
            (identical(other.studyBurstNum, studyBurstNum) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstNum, studyBurstNum)) &&
            (identical(other.startDay, startDay) ||
                const DeepCollectionEquality()
                    .equals(other.startDay, startDay)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.timeWindows, timeWindows) ||
                const DeepCollectionEquality()
                    .equals(other.timeWindows, timeWindows)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sessionGuid) ^
      const DeepCollectionEquality().hash(sessionName) ^
      const DeepCollectionEquality().hash(sessionSymbol) ^
      const DeepCollectionEquality().hash(week) ^
      const DeepCollectionEquality().hash(studyBurstId) ^
      const DeepCollectionEquality().hash(studyBurstNum) ^
      const DeepCollectionEquality().hash(startDay) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(timeWindows) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EventStreamDayExtension on EventStreamDay {
  EventStreamDay copyWith(
      {String? sessionGuid,
      String? sessionName,
      String? sessionSymbol,
      int? week,
      String? studyBurstId,
      int? studyBurstNum,
      int? startDay,
      dynamic? startDate,
      List<EventStreamWindow>? timeWindows,
      String? type}) {
    return EventStreamDay(
        sessionGuid: sessionGuid ?? this.sessionGuid,
        sessionName: sessionName ?? this.sessionName,
        sessionSymbol: sessionSymbol ?? this.sessionSymbol,
        week: week ?? this.week,
        studyBurstId: studyBurstId ?? this.studyBurstId,
        studyBurstNum: studyBurstNum ?? this.studyBurstNum,
        startDay: startDay ?? this.startDay,
        startDate: startDate ?? this.startDate,
        timeWindows: timeWindows ?? this.timeWindows,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EventStreamWindow {
  EventStreamWindow({
    this.sessionInstanceGuid,
    this.timeWindowGuid,
    this.state,
    this.endDay,
    this.endDate,
    this.type,
  });

  factory EventStreamWindow.fromJson(Map<String, dynamic> json) =>
      _$EventStreamWindowFromJson(json);

  @JsonKey(name: 'sessionInstanceGuid', includeIfNull: false)
  final String? sessionInstanceGuid;
  @JsonKey(name: 'timeWindowGuid', includeIfNull: false)
  final String? timeWindowGuid;
  @JsonKey(
      name: 'state',
      includeIfNull: false,
      toJson: sessionCompletionStateToJson,
      fromJson: sessionCompletionStateFromJson)
  final enums.SessionCompletionState? state;
  @JsonKey(name: 'endDay', includeIfNull: false)
  final int? endDay;
  @JsonKey(name: 'endDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? endDate;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$EventStreamWindowFromJson;
  static const toJsonFactory = _$EventStreamWindowToJson;
  Map<String, dynamic> toJson() => _$EventStreamWindowToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventStreamWindow &&
            (identical(other.sessionInstanceGuid, sessionInstanceGuid) ||
                const DeepCollectionEquality()
                    .equals(other.sessionInstanceGuid, sessionInstanceGuid)) &&
            (identical(other.timeWindowGuid, timeWindowGuid) ||
                const DeepCollectionEquality()
                    .equals(other.timeWindowGuid, timeWindowGuid)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.endDay, endDay) ||
                const DeepCollectionEquality().equals(other.endDay, endDay)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sessionInstanceGuid) ^
      const DeepCollectionEquality().hash(timeWindowGuid) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(endDay) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $EventStreamWindowExtension on EventStreamWindow {
  EventStreamWindow copyWith(
      {String? sessionInstanceGuid,
      String? timeWindowGuid,
      enums.SessionCompletionState? state,
      int? endDay,
      DateTime? endDate,
      String? type}) {
    return EventStreamWindow(
        sessionInstanceGuid: sessionInstanceGuid ?? this.sessionInstanceGuid,
        timeWindowGuid: timeWindowGuid ?? this.timeWindowGuid,
        state: state ?? this.state,
        endDay: endDay ?? this.endDay,
        endDate: endDate ?? this.endDate,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Exporter3Configuration {
  Exporter3Configuration({
    this.configured,
    this.dataAccessTeamId,
    this.projectId,
    this.rawDataFolderId,
    this.storageLocationId,
    this.type,
  });

  factory Exporter3Configuration.fromJson(Map<String, dynamic> json) =>
      _$Exporter3ConfigurationFromJson(json);

  @JsonKey(name: 'configured', includeIfNull: false)
  final bool? configured;
  @JsonKey(name: 'dataAccessTeamId', includeIfNull: false)
  final num? dataAccessTeamId;
  @JsonKey(name: 'projectId', includeIfNull: false)
  final String? projectId;
  @JsonKey(name: 'rawDataFolderId', includeIfNull: false)
  final String? rawDataFolderId;
  @JsonKey(name: 'storageLocationId', includeIfNull: false)
  final num? storageLocationId;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$Exporter3ConfigurationFromJson;
  static const toJsonFactory = _$Exporter3ConfigurationToJson;
  Map<String, dynamic> toJson() => _$Exporter3ConfigurationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Exporter3Configuration &&
            (identical(other.configured, configured) ||
                const DeepCollectionEquality()
                    .equals(other.configured, configured)) &&
            (identical(other.dataAccessTeamId, dataAccessTeamId) ||
                const DeepCollectionEquality()
                    .equals(other.dataAccessTeamId, dataAccessTeamId)) &&
            (identical(other.projectId, projectId) ||
                const DeepCollectionEquality()
                    .equals(other.projectId, projectId)) &&
            (identical(other.rawDataFolderId, rawDataFolderId) ||
                const DeepCollectionEquality()
                    .equals(other.rawDataFolderId, rawDataFolderId)) &&
            (identical(other.storageLocationId, storageLocationId) ||
                const DeepCollectionEquality()
                    .equals(other.storageLocationId, storageLocationId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(configured) ^
      const DeepCollectionEquality().hash(dataAccessTeamId) ^
      const DeepCollectionEquality().hash(projectId) ^
      const DeepCollectionEquality().hash(rawDataFolderId) ^
      const DeepCollectionEquality().hash(storageLocationId) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $Exporter3ConfigurationExtension on Exporter3Configuration {
  Exporter3Configuration copyWith(
      {bool? configured,
      num? dataAccessTeamId,
      String? projectId,
      String? rawDataFolderId,
      num? storageLocationId,
      String? type}) {
    return Exporter3Configuration(
        configured: configured ?? this.configured,
        dataAccessTeamId: dataAccessTeamId ?? this.dataAccessTeamId,
        projectId: projectId ?? this.projectId,
        rawDataFolderId: rawDataFolderId ?? this.rawDataFolderId,
        storageLocationId: storageLocationId ?? this.storageLocationId,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ExternalIdentifier {
  ExternalIdentifier({
    this.studyId,
    this.identifier,
    this.assigned,
    this.type,
  });

  factory ExternalIdentifier.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdentifierFromJson(json);

  @JsonKey(name: 'studyId', includeIfNull: false)
  final String? studyId;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'assigned', includeIfNull: false)
  final bool? assigned;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ExternalIdentifierFromJson;
  static const toJsonFactory = _$ExternalIdentifierToJson;
  Map<String, dynamic> toJson() => _$ExternalIdentifierToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExternalIdentifier &&
            (identical(other.studyId, studyId) ||
                const DeepCollectionEquality()
                    .equals(other.studyId, studyId)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.assigned, assigned) ||
                const DeepCollectionEquality()
                    .equals(other.assigned, assigned)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(studyId) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(assigned) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ExternalIdentifierExtension on ExternalIdentifier {
  ExternalIdentifier copyWith(
      {String? studyId, String? identifier, bool? assigned, String? type}) {
    return ExternalIdentifier(
        studyId: studyId ?? this.studyId,
        identifier: identifier ?? this.identifier,
        assigned: assigned ?? this.assigned,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ExternalResource {
  ExternalResource({
    this.guid,
    this.title,
    this.category,
    this.url,
    this.format,
    this.date,
    this.description,
    this.contributors,
    this.creators,
    this.publishers,
    this.language,
    this.minRevision,
    this.maxRevision,
    this.createdAtRevision,
    this.createdOn,
    this.modifiedOn,
    this.deleted,
    this.version,
    this.upToDate,
    this.type,
  });

  factory ExternalResource.fromJson(Map<String, dynamic> json) =>
      _$ExternalResourceFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(
      name: 'category',
      includeIfNull: false,
      toJson: resourceCategoryToJson,
      fromJson: resourceCategoryFromJson)
  final enums.ResourceCategory? category;
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;
  @JsonKey(name: 'format', includeIfNull: false)
  final String? format;
  @JsonKey(name: 'date', includeIfNull: false)
  final String? date;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'contributors', includeIfNull: false, defaultValue: <String>[])
  final List<String>? contributors;
  @JsonKey(name: 'creators', includeIfNull: false, defaultValue: <String>[])
  final List<String>? creators;
  @JsonKey(name: 'publishers', includeIfNull: false, defaultValue: <String>[])
  final List<String>? publishers;
  @JsonKey(name: 'language', includeIfNull: false)
  final String? language;
  @JsonKey(name: 'minRevision', includeIfNull: false)
  final int? minRevision;
  @JsonKey(name: 'maxRevision', includeIfNull: false)
  final int? maxRevision;
  @JsonKey(name: 'createdAtRevision', includeIfNull: false)
  final int? createdAtRevision;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'upToDate', includeIfNull: false)
  final bool? upToDate;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ExternalResourceFromJson;
  static const toJsonFactory = _$ExternalResourceToJson;
  Map<String, dynamic> toJson() => _$ExternalResourceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExternalResource &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.format, format) ||
                const DeepCollectionEquality().equals(other.format, format)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.contributors, contributors) ||
                const DeepCollectionEquality()
                    .equals(other.contributors, contributors)) &&
            (identical(other.creators, creators) ||
                const DeepCollectionEquality()
                    .equals(other.creators, creators)) &&
            (identical(other.publishers, publishers) ||
                const DeepCollectionEquality()
                    .equals(other.publishers, publishers)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.minRevision, minRevision) ||
                const DeepCollectionEquality()
                    .equals(other.minRevision, minRevision)) &&
            (identical(other.maxRevision, maxRevision) ||
                const DeepCollectionEquality()
                    .equals(other.maxRevision, maxRevision)) &&
            (identical(other.createdAtRevision, createdAtRevision) ||
                const DeepCollectionEquality()
                    .equals(other.createdAtRevision, createdAtRevision)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.upToDate, upToDate) ||
                const DeepCollectionEquality()
                    .equals(other.upToDate, upToDate)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(format) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(contributors) ^
      const DeepCollectionEquality().hash(creators) ^
      const DeepCollectionEquality().hash(publishers) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(minRevision) ^
      const DeepCollectionEquality().hash(maxRevision) ^
      const DeepCollectionEquality().hash(createdAtRevision) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(upToDate) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ExternalResourceExtension on ExternalResource {
  ExternalResource copyWith(
      {String? guid,
      String? title,
      enums.ResourceCategory? category,
      String? url,
      String? format,
      String? date,
      String? description,
      List<String>? contributors,
      List<String>? creators,
      List<String>? publishers,
      String? language,
      int? minRevision,
      int? maxRevision,
      int? createdAtRevision,
      DateTime? createdOn,
      DateTime? modifiedOn,
      bool? deleted,
      num? version,
      bool? upToDate,
      String? type}) {
    return ExternalResource(
        guid: guid ?? this.guid,
        title: title ?? this.title,
        category: category ?? this.category,
        url: url ?? this.url,
        format: format ?? this.format,
        date: date ?? this.date,
        description: description ?? this.description,
        contributors: contributors ?? this.contributors,
        creators: creators ?? this.creators,
        publishers: publishers ?? this.publishers,
        language: language ?? this.language,
        minRevision: minRevision ?? this.minRevision,
        maxRevision: maxRevision ?? this.maxRevision,
        createdAtRevision: createdAtRevision ?? this.createdAtRevision,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        deleted: deleted ?? this.deleted,
        version: version ?? this.version,
        upToDate: upToDate ?? this.upToDate,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class FileReference {
  FileReference({
    this.guid,
    this.createdOn,
    this.href,
    this.type,
  });

  factory FileReference.fromJson(Map<String, dynamic> json) =>
      _$FileReferenceFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'href', includeIfNull: false)
  final String? href;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$FileReferenceFromJson;
  static const toJsonFactory = _$FileReferenceToJson;
  Map<String, dynamic> toJson() => _$FileReferenceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileReference &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.href, href) ||
                const DeepCollectionEquality().equals(other.href, href)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(href) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $FileReferenceExtension on FileReference {
  FileReference copyWith(
      {String? guid, DateTime? createdOn, String? href, String? type}) {
    return FileReference(
        guid: guid ?? this.guid,
        createdOn: createdOn ?? this.createdOn,
        href: href ?? this.href,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class GeneratedPassword {
  GeneratedPassword({
    this.externalId,
    this.userId,
    this.password,
    this.type,
  });

  factory GeneratedPassword.fromJson(Map<String, dynamic> json) =>
      _$GeneratedPasswordFromJson(json);

  @JsonKey(name: 'externalId', includeIfNull: false)
  final String? externalId;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$GeneratedPasswordFromJson;
  static const toJsonFactory = _$GeneratedPasswordToJson;
  Map<String, dynamic> toJson() => _$GeneratedPasswordToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GeneratedPassword &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $GeneratedPasswordExtension on GeneratedPassword {
  GeneratedPassword copyWith(
      {String? externalId, String? userId, String? password, String? type}) {
    return GeneratedPassword(
        externalId: externalId ?? this.externalId,
        userId: userId ?? this.userId,
        password: password ?? this.password,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class GuidCreatedOnVersionHolder {
  GuidCreatedOnVersionHolder({
    this.guid,
    this.createdOn,
    this.version,
    this.type,
  });

  factory GuidCreatedOnVersionHolder.fromJson(Map<String, dynamic> json) =>
      _$GuidCreatedOnVersionHolderFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$GuidCreatedOnVersionHolderFromJson;
  static const toJsonFactory = _$GuidCreatedOnVersionHolderToJson;
  Map<String, dynamic> toJson() => _$GuidCreatedOnVersionHolderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GuidCreatedOnVersionHolder &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $GuidCreatedOnVersionHolderExtension on GuidCreatedOnVersionHolder {
  GuidCreatedOnVersionHolder copyWith(
      {String? guid, DateTime? createdOn, num? version, String? type}) {
    return GuidCreatedOnVersionHolder(
        guid: guid ?? this.guid,
        createdOn: createdOn ?? this.createdOn,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class GuidHolder {
  GuidHolder({
    this.guid,
    this.type,
  });

  factory GuidHolder.fromJson(Map<String, dynamic> json) =>
      _$GuidHolderFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$GuidHolderFromJson;
  static const toJsonFactory = _$GuidHolderToJson;
  Map<String, dynamic> toJson() => _$GuidHolderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GuidHolder &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $GuidHolderExtension on GuidHolder {
  GuidHolder copyWith({String? guid, String? type}) {
    return GuidHolder(guid: guid ?? this.guid, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class GuidVersionHolder {
  GuidVersionHolder({
    this.guid,
    this.version,
    this.type,
  });

  factory GuidVersionHolder.fromJson(Map<String, dynamic> json) =>
      _$GuidVersionHolderFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$GuidVersionHolderFromJson;
  static const toJsonFactory = _$GuidVersionHolderToJson;
  Map<String, dynamic> toJson() => _$GuidVersionHolderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GuidVersionHolder &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $GuidVersionHolderExtension on GuidVersionHolder {
  GuidVersionHolder copyWith({String? guid, num? version, String? type}) {
    return GuidVersionHolder(
        guid: guid ?? this.guid,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class HealthDataDocumentation {
  HealthDataDocumentation({
    this.title,
    this.parentId,
    this.identifier,
    this.version,
    this.documentation,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.type,
  });

  factory HealthDataDocumentation.fromJson(Map<String, dynamic> json) =>
      _$HealthDataDocumentationFromJson(json);

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'parentId', includeIfNull: false)
  final String? parentId;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'documentation', includeIfNull: false)
  final String? documentation;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final String? createdBy;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final Object? createdOn;
  @JsonKey(name: 'modifiedBy', includeIfNull: false)
  final String? modifiedBy;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final Object? modifiedOn;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$HealthDataDocumentationFromJson;
  static const toJsonFactory = _$HealthDataDocumentationToJson;
  Map<String, dynamic> toJson() => _$HealthDataDocumentationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HealthDataDocumentation &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.documentation, documentation) ||
                const DeepCollectionEquality()
                    .equals(other.documentation, documentation)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedBy, modifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedBy, modifiedBy)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(documentation) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedBy) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $HealthDataDocumentationExtension on HealthDataDocumentation {
  HealthDataDocumentation copyWith(
      {String? title,
      String? parentId,
      String? identifier,
      num? version,
      String? documentation,
      String? createdBy,
      Object? createdOn,
      String? modifiedBy,
      Object? modifiedOn,
      String? type}) {
    return HealthDataDocumentation(
        title: title ?? this.title,
        parentId: parentId ?? this.parentId,
        identifier: identifier ?? this.identifier,
        version: version ?? this.version,
        documentation: documentation ?? this.documentation,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class HealthDataRecord {
  HealthDataRecord({
    this.appVersion,
    this.createdOn,
    this.createdOnTimeZone,
    this.data,
    this.dayInStudy,
    this.id,
    this.metadata,
    this.phoneInfo,
    this.rawDataAttachmentId,
    this.schemaId,
    this.schemaRevision,
    this.appId,
    this.uploadDate,
    this.uploadId,
    this.uploadedOn,
    this.userMetadata,
    this.userSharingScope,
    this.userExternalId,
    this.userDataGroups,
    this.userStudyMemberships,
    this.validationErrors,
    this.version,
    this.synapseExporterStatus,
    this.type,
  });

  factory HealthDataRecord.fromJson(Map<String, dynamic> json) =>
      _$HealthDataRecordFromJson(json);

  @JsonKey(name: 'appVersion', includeIfNull: false)
  final String? appVersion;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'createdOnTimeZone', includeIfNull: false)
  final String? createdOnTimeZone;
  @JsonKey(name: 'data', includeIfNull: false)
  final Object? data;
  @JsonKey(name: 'dayInStudy', includeIfNull: false)
  final int? dayInStudy;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'metadata', includeIfNull: false)
  final Object? metadata;
  @JsonKey(name: 'phoneInfo', includeIfNull: false)
  final String? phoneInfo;
  @JsonKey(name: 'rawDataAttachmentId', includeIfNull: false)
  final String? rawDataAttachmentId;
  @JsonKey(name: 'schemaId', includeIfNull: false)
  final String? schemaId;
  @JsonKey(name: 'schemaRevision', includeIfNull: false)
  final num? schemaRevision;
  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'uploadDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? uploadDate;
  @JsonKey(name: 'uploadId', includeIfNull: false)
  final String? uploadId;
  @JsonKey(name: 'uploadedOn', includeIfNull: false)
  final DateTime? uploadedOn;
  @JsonKey(name: 'userMetadata', includeIfNull: false)
  final Object? userMetadata;
  @JsonKey(
      name: 'userSharingScope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? userSharingScope;
  @JsonKey(name: 'userExternalId', includeIfNull: false)
  final String? userExternalId;
  @JsonKey(
      name: 'userDataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? userDataGroups;
  @JsonKey(name: 'userStudyMemberships', includeIfNull: false)
  final Map<String, dynamic>? userStudyMemberships;
  @JsonKey(name: 'validationErrors', includeIfNull: false)
  final String? validationErrors;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(
      name: 'synapseExporterStatus',
      includeIfNull: false,
      toJson: synapseExporterStatusToJson,
      fromJson: synapseExporterStatusFromJson)
  final enums.SynapseExporterStatus? synapseExporterStatus;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$HealthDataRecordFromJson;
  static const toJsonFactory = _$HealthDataRecordToJson;
  Map<String, dynamic> toJson() => _$HealthDataRecordToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HealthDataRecord &&
            (identical(other.appVersion, appVersion) ||
                const DeepCollectionEquality()
                    .equals(other.appVersion, appVersion)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.createdOnTimeZone, createdOnTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.createdOnTimeZone, createdOnTimeZone)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.dayInStudy, dayInStudy) ||
                const DeepCollectionEquality()
                    .equals(other.dayInStudy, dayInStudy)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)) &&
            (identical(other.phoneInfo, phoneInfo) ||
                const DeepCollectionEquality()
                    .equals(other.phoneInfo, phoneInfo)) &&
            (identical(other.rawDataAttachmentId, rawDataAttachmentId) ||
                const DeepCollectionEquality()
                    .equals(other.rawDataAttachmentId, rawDataAttachmentId)) &&
            (identical(other.schemaId, schemaId) ||
                const DeepCollectionEquality()
                    .equals(other.schemaId, schemaId)) &&
            (identical(other.schemaRevision, schemaRevision) ||
                const DeepCollectionEquality()
                    .equals(other.schemaRevision, schemaRevision)) &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.uploadDate, uploadDate) ||
                const DeepCollectionEquality()
                    .equals(other.uploadDate, uploadDate)) &&
            (identical(other.uploadId, uploadId) ||
                const DeepCollectionEquality()
                    .equals(other.uploadId, uploadId)) &&
            (identical(other.uploadedOn, uploadedOn) ||
                const DeepCollectionEquality()
                    .equals(other.uploadedOn, uploadedOn)) &&
            (identical(other.userMetadata, userMetadata) ||
                const DeepCollectionEquality()
                    .equals(other.userMetadata, userMetadata)) &&
            (identical(other.userSharingScope, userSharingScope) ||
                const DeepCollectionEquality()
                    .equals(other.userSharingScope, userSharingScope)) &&
            (identical(other.userExternalId, userExternalId) ||
                const DeepCollectionEquality()
                    .equals(other.userExternalId, userExternalId)) &&
            (identical(other.userDataGroups, userDataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.userDataGroups, userDataGroups)) &&
            (identical(other.userStudyMemberships, userStudyMemberships) ||
                const DeepCollectionEquality().equals(
                    other.userStudyMemberships, userStudyMemberships)) &&
            (identical(other.validationErrors, validationErrors) ||
                const DeepCollectionEquality()
                    .equals(other.validationErrors, validationErrors)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.synapseExporterStatus, synapseExporterStatus) ||
                const DeepCollectionEquality()
                    .equals(other.synapseExporterStatus, synapseExporterStatus)) &&
            (identical(other.type, type) || const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appVersion) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(createdOnTimeZone) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(dayInStudy) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(metadata) ^
      const DeepCollectionEquality().hash(phoneInfo) ^
      const DeepCollectionEquality().hash(rawDataAttachmentId) ^
      const DeepCollectionEquality().hash(schemaId) ^
      const DeepCollectionEquality().hash(schemaRevision) ^
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(uploadDate) ^
      const DeepCollectionEquality().hash(uploadId) ^
      const DeepCollectionEquality().hash(uploadedOn) ^
      const DeepCollectionEquality().hash(userMetadata) ^
      const DeepCollectionEquality().hash(userSharingScope) ^
      const DeepCollectionEquality().hash(userExternalId) ^
      const DeepCollectionEquality().hash(userDataGroups) ^
      const DeepCollectionEquality().hash(userStudyMemberships) ^
      const DeepCollectionEquality().hash(validationErrors) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(synapseExporterStatus) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $HealthDataRecordExtension on HealthDataRecord {
  HealthDataRecord copyWith(
      {String? appVersion,
      DateTime? createdOn,
      String? createdOnTimeZone,
      Object? data,
      int? dayInStudy,
      String? id,
      Object? metadata,
      String? phoneInfo,
      String? rawDataAttachmentId,
      String? schemaId,
      num? schemaRevision,
      String? appId,
      DateTime? uploadDate,
      String? uploadId,
      DateTime? uploadedOn,
      Object? userMetadata,
      enums.SharingScope? userSharingScope,
      String? userExternalId,
      List<String>? userDataGroups,
      Map<String, dynamic>? userStudyMemberships,
      String? validationErrors,
      num? version,
      enums.SynapseExporterStatus? synapseExporterStatus,
      String? type}) {
    return HealthDataRecord(
        appVersion: appVersion ?? this.appVersion,
        createdOn: createdOn ?? this.createdOn,
        createdOnTimeZone: createdOnTimeZone ?? this.createdOnTimeZone,
        data: data ?? this.data,
        dayInStudy: dayInStudy ?? this.dayInStudy,
        id: id ?? this.id,
        metadata: metadata ?? this.metadata,
        phoneInfo: phoneInfo ?? this.phoneInfo,
        rawDataAttachmentId: rawDataAttachmentId ?? this.rawDataAttachmentId,
        schemaId: schemaId ?? this.schemaId,
        schemaRevision: schemaRevision ?? this.schemaRevision,
        appId: appId ?? this.appId,
        uploadDate: uploadDate ?? this.uploadDate,
        uploadId: uploadId ?? this.uploadId,
        uploadedOn: uploadedOn ?? this.uploadedOn,
        userMetadata: userMetadata ?? this.userMetadata,
        userSharingScope: userSharingScope ?? this.userSharingScope,
        userExternalId: userExternalId ?? this.userExternalId,
        userDataGroups: userDataGroups ?? this.userDataGroups,
        userStudyMemberships: userStudyMemberships ?? this.userStudyMemberships,
        validationErrors: validationErrors ?? this.validationErrors,
        version: version ?? this.version,
        synapseExporterStatus:
            synapseExporterStatus ?? this.synapseExporterStatus,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class HealthDataRecordEx3 {
  HealthDataRecordEx3({
    this.id,
    this.appId,
    this.studyId,
    this.healthCode,
    this.createdOn,
    this.clientInfo,
    this.exported,
    this.exportedOn,
    this.metadata,
    this.sharingScope,
    this.version,
    this.type,
  });

  factory HealthDataRecordEx3.fromJson(Map<String, dynamic> json) =>
      _$HealthDataRecordEx3FromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'studyId', includeIfNull: false)
  final String? studyId;
  @JsonKey(name: 'healthCode', includeIfNull: false)
  final String? healthCode;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'clientInfo', includeIfNull: false)
  final String? clientInfo;
  @JsonKey(name: 'exported', includeIfNull: false, defaultValue: false)
  final bool? exported;
  @JsonKey(name: 'exportedOn', includeIfNull: false)
  final DateTime? exportedOn;
  @JsonKey(name: 'metadata', includeIfNull: false)
  final Map<String, dynamic>? metadata;
  @JsonKey(
      name: 'sharingScope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? sharingScope;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$HealthDataRecordEx3FromJson;
  static const toJsonFactory = _$HealthDataRecordEx3ToJson;
  Map<String, dynamic> toJson() => _$HealthDataRecordEx3ToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HealthDataRecordEx3 &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.studyId, studyId) ||
                const DeepCollectionEquality()
                    .equals(other.studyId, studyId)) &&
            (identical(other.healthCode, healthCode) ||
                const DeepCollectionEquality()
                    .equals(other.healthCode, healthCode)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.clientInfo, clientInfo) ||
                const DeepCollectionEquality()
                    .equals(other.clientInfo, clientInfo)) &&
            (identical(other.exported, exported) ||
                const DeepCollectionEquality()
                    .equals(other.exported, exported)) &&
            (identical(other.exportedOn, exportedOn) ||
                const DeepCollectionEquality()
                    .equals(other.exportedOn, exportedOn)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)) &&
            (identical(other.sharingScope, sharingScope) ||
                const DeepCollectionEquality()
                    .equals(other.sharingScope, sharingScope)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(studyId) ^
      const DeepCollectionEquality().hash(healthCode) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(clientInfo) ^
      const DeepCollectionEquality().hash(exported) ^
      const DeepCollectionEquality().hash(exportedOn) ^
      const DeepCollectionEquality().hash(metadata) ^
      const DeepCollectionEquality().hash(sharingScope) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $HealthDataRecordEx3Extension on HealthDataRecordEx3 {
  HealthDataRecordEx3 copyWith(
      {String? id,
      String? appId,
      String? studyId,
      String? healthCode,
      DateTime? createdOn,
      String? clientInfo,
      bool? exported,
      DateTime? exportedOn,
      Map<String, dynamic>? metadata,
      enums.SharingScope? sharingScope,
      num? version,
      String? type}) {
    return HealthDataRecordEx3(
        id: id ?? this.id,
        appId: appId ?? this.appId,
        studyId: studyId ?? this.studyId,
        healthCode: healthCode ?? this.healthCode,
        createdOn: createdOn ?? this.createdOn,
        clientInfo: clientInfo ?? this.clientInfo,
        exported: exported ?? this.exported,
        exportedOn: exportedOn ?? this.exportedOn,
        metadata: metadata ?? this.metadata,
        sharingScope: sharingScope ?? this.sharingScope,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class HealthDataSubmission {
  HealthDataSubmission({
    this.appVersion,
    this.createdOn,
    this.data,
    this.metadata,
    this.phoneInfo,
    this.schemaId,
    this.schemaRevision,
    this.surveyCreatedOn,
    this.surveyGuid,
    this.type,
  });

  factory HealthDataSubmission.fromJson(Map<String, dynamic> json) =>
      _$HealthDataSubmissionFromJson(json);

  @JsonKey(name: 'appVersion', includeIfNull: false)
  final String? appVersion;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'data', includeIfNull: false)
  final Object? data;
  @JsonKey(name: 'metadata', includeIfNull: false)
  final Object? metadata;
  @JsonKey(name: 'phoneInfo', includeIfNull: false)
  final String? phoneInfo;
  @JsonKey(name: 'schemaId', includeIfNull: false)
  final String? schemaId;
  @JsonKey(name: 'schemaRevision', includeIfNull: false)
  final num? schemaRevision;
  @JsonKey(name: 'surveyCreatedOn', includeIfNull: false)
  final DateTime? surveyCreatedOn;
  @JsonKey(name: 'surveyGuid', includeIfNull: false)
  final String? surveyGuid;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$HealthDataSubmissionFromJson;
  static const toJsonFactory = _$HealthDataSubmissionToJson;
  Map<String, dynamic> toJson() => _$HealthDataSubmissionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HealthDataSubmission &&
            (identical(other.appVersion, appVersion) ||
                const DeepCollectionEquality()
                    .equals(other.appVersion, appVersion)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)) &&
            (identical(other.phoneInfo, phoneInfo) ||
                const DeepCollectionEquality()
                    .equals(other.phoneInfo, phoneInfo)) &&
            (identical(other.schemaId, schemaId) ||
                const DeepCollectionEquality()
                    .equals(other.schemaId, schemaId)) &&
            (identical(other.schemaRevision, schemaRevision) ||
                const DeepCollectionEquality()
                    .equals(other.schemaRevision, schemaRevision)) &&
            (identical(other.surveyCreatedOn, surveyCreatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.surveyCreatedOn, surveyCreatedOn)) &&
            (identical(other.surveyGuid, surveyGuid) ||
                const DeepCollectionEquality()
                    .equals(other.surveyGuid, surveyGuid)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appVersion) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(metadata) ^
      const DeepCollectionEquality().hash(phoneInfo) ^
      const DeepCollectionEquality().hash(schemaId) ^
      const DeepCollectionEquality().hash(schemaRevision) ^
      const DeepCollectionEquality().hash(surveyCreatedOn) ^
      const DeepCollectionEquality().hash(surveyGuid) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $HealthDataSubmissionExtension on HealthDataSubmission {
  HealthDataSubmission copyWith(
      {String? appVersion,
      DateTime? createdOn,
      Object? data,
      Object? metadata,
      String? phoneInfo,
      String? schemaId,
      num? schemaRevision,
      DateTime? surveyCreatedOn,
      String? surveyGuid,
      String? type}) {
    return HealthDataSubmission(
        appVersion: appVersion ?? this.appVersion,
        createdOn: createdOn ?? this.createdOn,
        data: data ?? this.data,
        metadata: metadata ?? this.metadata,
        phoneInfo: phoneInfo ?? this.phoneInfo,
        schemaId: schemaId ?? this.schemaId,
        schemaRevision: schemaRevision ?? this.schemaRevision,
        surveyCreatedOn: surveyCreatedOn ?? this.surveyCreatedOn,
        surveyGuid: surveyGuid ?? this.surveyGuid,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class FileMetadata {
  FileMetadata({
    this.name,
    this.guid,
    this.description,
    this.disposition,
    this.createdOn,
    this.modifiedOn,
    this.deleted,
    this.version,
    this.type,
  });

  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(
      name: 'disposition',
      includeIfNull: false,
      toJson: fileDispositionToJson,
      fromJson: fileDispositionFromJson)
  final enums.FileDisposition? disposition;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$FileMetadataFromJson;
  static const toJsonFactory = _$FileMetadataToJson;
  Map<String, dynamic> toJson() => _$FileMetadataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileMetadata &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.disposition, disposition) ||
                const DeepCollectionEquality()
                    .equals(other.disposition, disposition)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(disposition) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $FileMetadataExtension on FileMetadata {
  FileMetadata copyWith(
      {String? name,
      String? guid,
      String? description,
      enums.FileDisposition? disposition,
      DateTime? createdOn,
      DateTime? modifiedOn,
      bool? deleted,
      num? version,
      String? type}) {
    return FileMetadata(
        name: name ?? this.name,
        guid: guid ?? this.guid,
        description: description ?? this.description,
        disposition: disposition ?? this.disposition,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        deleted: deleted ?? this.deleted,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class FileRevision {
  FileRevision({
    this.name,
    this.fileGuid,
    this.description,
    this.mimeType,
    this.createdOn,
    this.size,
    this.uploadURL,
    this.downloadURL,
    this.status,
    this.type,
  });

  factory FileRevision.fromJson(Map<String, dynamic> json) =>
      _$FileRevisionFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'fileGuid', includeIfNull: false)
  final String? fileGuid;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'mimeType', includeIfNull: false)
  final String? mimeType;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'size', includeIfNull: false)
  final num? size;
  @JsonKey(name: 'uploadURL', includeIfNull: false)
  final String? uploadURL;
  @JsonKey(name: 'downloadURL', includeIfNull: false)
  final String? downloadURL;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: fileRevisionStatusToJson,
      fromJson: fileRevisionStatusFromJson)
  final enums.FileRevisionStatus? status;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$FileRevisionFromJson;
  static const toJsonFactory = _$FileRevisionToJson;
  Map<String, dynamic> toJson() => _$FileRevisionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileRevision &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.fileGuid, fileGuid) ||
                const DeepCollectionEquality()
                    .equals(other.fileGuid, fileGuid)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.uploadURL, uploadURL) ||
                const DeepCollectionEquality()
                    .equals(other.uploadURL, uploadURL)) &&
            (identical(other.downloadURL, downloadURL) ||
                const DeepCollectionEquality()
                    .equals(other.downloadURL, downloadURL)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(fileGuid) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(uploadURL) ^
      const DeepCollectionEquality().hash(downloadURL) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $FileRevisionExtension on FileRevision {
  FileRevision copyWith(
      {String? name,
      String? fileGuid,
      String? description,
      String? mimeType,
      DateTime? createdOn,
      num? size,
      String? uploadURL,
      String? downloadURL,
      enums.FileRevisionStatus? status,
      String? type}) {
    return FileRevision(
        name: name ?? this.name,
        fileGuid: fileGuid ?? this.fileGuid,
        description: description ?? this.description,
        mimeType: mimeType ?? this.mimeType,
        createdOn: createdOn ?? this.createdOn,
        size: size ?? this.size,
        uploadURL: uploadURL ?? this.uploadURL,
        downloadURL: downloadURL ?? this.downloadURL,
        status: status ?? this.status,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Identifier {
  Identifier({
    this.email,
    this.phone,
    this.appId,
    this.type,
  });

  factory Identifier.fromJson(Map<String, dynamic> json) =>
      _$IdentifierFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$IdentifierFromJson;
  static const toJsonFactory = _$IdentifierToJson;
  Map<String, dynamic> toJson() => _$IdentifierToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Identifier &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $IdentifierExtension on Identifier {
  Identifier copyWith(
      {String? email, Phone? phone, String? appId, String? type}) {
    return Identifier(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        appId: appId ?? this.appId,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class IdentifierHolder {
  IdentifierHolder({
    this.identifier,
    this.type,
  });

  factory IdentifierHolder.fromJson(Map<String, dynamic> json) =>
      _$IdentifierHolderFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$IdentifierHolderFromJson;
  static const toJsonFactory = _$IdentifierHolderToJson;
  Map<String, dynamic> toJson() => _$IdentifierHolderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IdentifierHolder &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $IdentifierHolderExtension on IdentifierHolder {
  IdentifierHolder copyWith({String? identifier, String? type}) {
    return IdentifierHolder(
        identifier: identifier ?? this.identifier, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class IdentifierUpdate {
  IdentifierUpdate({
    this.signIn,
    this.emailUpdate,
    this.phoneUpdate,
    this.synapseUserIdUpdate,
    this.type,
  });

  factory IdentifierUpdate.fromJson(Map<String, dynamic> json) =>
      _$IdentifierUpdateFromJson(json);

  @JsonKey(name: 'signIn', includeIfNull: false)
  final SignIn? signIn;
  @JsonKey(name: 'emailUpdate', includeIfNull: false)
  final String? emailUpdate;
  @JsonKey(name: 'phoneUpdate', includeIfNull: false)
  final Phone? phoneUpdate;
  @JsonKey(name: 'synapseUserIdUpdate', includeIfNull: false)
  final String? synapseUserIdUpdate;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$IdentifierUpdateFromJson;
  static const toJsonFactory = _$IdentifierUpdateToJson;
  Map<String, dynamic> toJson() => _$IdentifierUpdateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IdentifierUpdate &&
            (identical(other.signIn, signIn) ||
                const DeepCollectionEquality().equals(other.signIn, signIn)) &&
            (identical(other.emailUpdate, emailUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.emailUpdate, emailUpdate)) &&
            (identical(other.phoneUpdate, phoneUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.phoneUpdate, phoneUpdate)) &&
            (identical(other.synapseUserIdUpdate, synapseUserIdUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.synapseUserIdUpdate, synapseUserIdUpdate)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(signIn) ^
      const DeepCollectionEquality().hash(emailUpdate) ^
      const DeepCollectionEquality().hash(phoneUpdate) ^
      const DeepCollectionEquality().hash(synapseUserIdUpdate) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $IdentifierUpdateExtension on IdentifierUpdate {
  IdentifierUpdate copyWith(
      {SignIn? signIn,
      String? emailUpdate,
      Phone? phoneUpdate,
      String? synapseUserIdUpdate,
      String? type}) {
    return IdentifierUpdate(
        signIn: signIn ?? this.signIn,
        emailUpdate: emailUpdate ?? this.emailUpdate,
        phoneUpdate: phoneUpdate ?? this.phoneUpdate,
        synapseUserIdUpdate: synapseUserIdUpdate ?? this.synapseUserIdUpdate,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Image {
  Image({
    this.source,
    this.width,
    this.height,
    this.type,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  @JsonKey(name: 'source', includeIfNull: false)
  final String? source;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ImageFromJson;
  static const toJsonFactory = _$ImageToJson;
  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Image &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ImageExtension on Image {
  Image copyWith({String? source, int? width, int? height, String? type}) {
    return Image(
        source: source ?? this.source,
        width: width ?? this.width,
        height: height ?? this.height,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class IntentToParticipate {
  IntentToParticipate({
    this.appId,
    this.subpopGuid,
    this.osName,
    this.phone,
    this.email,
    this.consentSignature,
    this.scope,
    this.type,
  });

  factory IntentToParticipate.fromJson(Map<String, dynamic> json) =>
      _$IntentToParticipateFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'subpopGuid', includeIfNull: false)
  final String? subpopGuid;
  @JsonKey(name: 'osName', includeIfNull: false)
  final String? osName;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'consentSignature', includeIfNull: false)
  final ConsentSignature? consentSignature;
  @JsonKey(
      name: 'scope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? scope;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$IntentToParticipateFromJson;
  static const toJsonFactory = _$IntentToParticipateToJson;
  Map<String, dynamic> toJson() => _$IntentToParticipateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IntentToParticipate &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.subpopGuid, subpopGuid) ||
                const DeepCollectionEquality()
                    .equals(other.subpopGuid, subpopGuid)) &&
            (identical(other.osName, osName) ||
                const DeepCollectionEquality().equals(other.osName, osName)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.consentSignature, consentSignature) ||
                const DeepCollectionEquality()
                    .equals(other.consentSignature, consentSignature)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(subpopGuid) ^
      const DeepCollectionEquality().hash(osName) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(consentSignature) ^
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $IntentToParticipateExtension on IntentToParticipate {
  IntentToParticipate copyWith(
      {String? appId,
      String? subpopGuid,
      String? osName,
      Phone? phone,
      String? email,
      ConsentSignature? consentSignature,
      enums.SharingScope? scope,
      String? type}) {
    return IntentToParticipate(
        appId: appId ?? this.appId,
        subpopGuid: subpopGuid ?? this.subpopGuid,
        osName: osName ?? this.osName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        consentSignature: consentSignature ?? this.consentSignature,
        scope: scope ?? this.scope,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class InvalidEntity {
  InvalidEntity({
    this.message,
    this.errors,
  });

  factory InvalidEntity.fromJson(Map<String, dynamic> json) =>
      _$InvalidEntityFromJson(json);

  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'errors', includeIfNull: false)
  final Map<String, dynamic>? errors;
  static const fromJsonFactory = _$InvalidEntityFromJson;
  static const toJsonFactory = _$InvalidEntityToJson;
  Map<String, dynamic> toJson() => _$InvalidEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEntity &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $InvalidEntityExtension on InvalidEntity {
  InvalidEntity copyWith({String? message, Map<String, dynamic>? errors}) {
    return InvalidEntity(
        message: message ?? this.message, errors: errors ?? this.errors);
  }
}

@JsonSerializable(explicitToJson: true)
class Label {
  Label({
    this.lang,
    this.value,
    this.type,
  });

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  @JsonKey(name: 'lang', includeIfNull: false)
  final String? lang;
  @JsonKey(name: 'value', includeIfNull: false)
  final String? value;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$LabelFromJson;
  static const toJsonFactory = _$LabelToJson;
  Map<String, dynamic> toJson() => _$LabelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Label &&
            (identical(other.lang, lang) ||
                const DeepCollectionEquality().equals(other.lang, lang)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(lang) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $LabelExtension on Label {
  Label copyWith({String? lang, String? value, String? type}) {
    return Label(
        lang: lang ?? this.lang,
        value: value ?? this.value,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class MasterSchedulerConfig {
  MasterSchedulerConfig({
    this.scheduleId,
    this.cronSchedule,
    this.requestTemplate,
    this.sqsQueueUrl,
    this.version,
    this.type,
  });

  factory MasterSchedulerConfig.fromJson(Map<String, dynamic> json) =>
      _$MasterSchedulerConfigFromJson(json);

  @JsonKey(name: 'scheduleId', includeIfNull: false)
  final String? scheduleId;
  @JsonKey(name: 'cronSchedule', includeIfNull: false)
  final String? cronSchedule;
  @JsonKey(name: 'requestTemplate', includeIfNull: false)
  final Object? requestTemplate;
  @JsonKey(name: 'sqsQueueUrl', includeIfNull: false)
  final String? sqsQueueUrl;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$MasterSchedulerConfigFromJson;
  static const toJsonFactory = _$MasterSchedulerConfigToJson;
  Map<String, dynamic> toJson() => _$MasterSchedulerConfigToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MasterSchedulerConfig &&
            (identical(other.scheduleId, scheduleId) ||
                const DeepCollectionEquality()
                    .equals(other.scheduleId, scheduleId)) &&
            (identical(other.cronSchedule, cronSchedule) ||
                const DeepCollectionEquality()
                    .equals(other.cronSchedule, cronSchedule)) &&
            (identical(other.requestTemplate, requestTemplate) ||
                const DeepCollectionEquality()
                    .equals(other.requestTemplate, requestTemplate)) &&
            (identical(other.sqsQueueUrl, sqsQueueUrl) ||
                const DeepCollectionEquality()
                    .equals(other.sqsQueueUrl, sqsQueueUrl)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(scheduleId) ^
      const DeepCollectionEquality().hash(cronSchedule) ^
      const DeepCollectionEquality().hash(requestTemplate) ^
      const DeepCollectionEquality().hash(sqsQueueUrl) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $MasterSchedulerConfigExtension on MasterSchedulerConfig {
  MasterSchedulerConfig copyWith(
      {String? scheduleId,
      String? cronSchedule,
      Object? requestTemplate,
      String? sqsQueueUrl,
      num? version,
      String? type}) {
    return MasterSchedulerConfig(
        scheduleId: scheduleId ?? this.scheduleId,
        cronSchedule: cronSchedule ?? this.cronSchedule,
        requestTemplate: requestTemplate ?? this.requestTemplate,
        sqsQueueUrl: sqsQueueUrl ?? this.sqsQueueUrl,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Message {
  Message({
    this.message,
    this.type,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$MessageFromJson;
  static const toJsonFactory = _$MessageToJson;
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Message &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $MessageExtension on Message {
  Message copyWith({String? message, String? type}) {
    return Message(message: message ?? this.message, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Notification {
  Notification({
    this.notifyAt,
    this.offset,
    this.interval,
    this.allowSnooze,
    this.messages,
    this.type,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  @JsonKey(
      name: 'notifyAt',
      includeIfNull: false,
      toJson: notificationTypeToJson,
      fromJson: notificationTypeFromJson)
  final enums.NotificationType? notifyAt;
  @JsonKey(name: 'offset', includeIfNull: false)
  final String? offset;
  @JsonKey(name: 'interval', includeIfNull: false)
  final String? interval;
  @JsonKey(name: 'allowSnooze', includeIfNull: false, defaultValue: false)
  final bool? allowSnooze;
  @JsonKey(
      name: 'messages',
      includeIfNull: false,
      defaultValue: <NotificationMessage>[])
  final List<NotificationMessage>? messages;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$NotificationFromJson;
  static const toJsonFactory = _$NotificationToJson;
  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Notification &&
            (identical(other.notifyAt, notifyAt) ||
                const DeepCollectionEquality()
                    .equals(other.notifyAt, notifyAt)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.allowSnooze, allowSnooze) ||
                const DeepCollectionEquality()
                    .equals(other.allowSnooze, allowSnooze)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(notifyAt) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(allowSnooze) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $NotificationExtension on Notification {
  Notification copyWith(
      {enums.NotificationType? notifyAt,
      String? offset,
      String? interval,
      bool? allowSnooze,
      List<NotificationMessage>? messages,
      String? type}) {
    return Notification(
        notifyAt: notifyAt ?? this.notifyAt,
        offset: offset ?? this.offset,
        interval: interval ?? this.interval,
        allowSnooze: allowSnooze ?? this.allowSnooze,
        messages: messages ?? this.messages,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationInfo {
  NotificationInfo({
    this.notifyAt,
    this.offset,
    this.interval,
    this.allowSnooze,
    this.message,
    this.type,
  });

  factory NotificationInfo.fromJson(Map<String, dynamic> json) =>
      _$NotificationInfoFromJson(json);

  @JsonKey(
      name: 'notifyAt',
      includeIfNull: false,
      toJson: notificationTypeToJson,
      fromJson: notificationTypeFromJson)
  final enums.NotificationType? notifyAt;
  @JsonKey(name: 'offset', includeIfNull: false)
  final String? offset;
  @JsonKey(name: 'interval', includeIfNull: false)
  final String? interval;
  @JsonKey(name: 'allowSnooze', includeIfNull: false, defaultValue: false)
  final bool? allowSnooze;
  @JsonKey(name: 'message', includeIfNull: false)
  final NotificationMessage? message;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$NotificationInfoFromJson;
  static const toJsonFactory = _$NotificationInfoToJson;
  Map<String, dynamic> toJson() => _$NotificationInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationInfo &&
            (identical(other.notifyAt, notifyAt) ||
                const DeepCollectionEquality()
                    .equals(other.notifyAt, notifyAt)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.allowSnooze, allowSnooze) ||
                const DeepCollectionEquality()
                    .equals(other.allowSnooze, allowSnooze)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(notifyAt) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(allowSnooze) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $NotificationInfoExtension on NotificationInfo {
  NotificationInfo copyWith(
      {enums.NotificationType? notifyAt,
      String? offset,
      String? interval,
      bool? allowSnooze,
      NotificationMessage? message,
      String? type}) {
    return NotificationInfo(
        notifyAt: notifyAt ?? this.notifyAt,
        offset: offset ?? this.offset,
        interval: interval ?? this.interval,
        allowSnooze: allowSnooze ?? this.allowSnooze,
        message: message ?? this.message,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationMessage {
  NotificationMessage({
    this.lang,
    this.subject,
    this.message,
    this.type,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) =>
      _$NotificationMessageFromJson(json);

  @JsonKey(name: 'lang', includeIfNull: false)
  final String? lang;
  @JsonKey(name: 'subject', includeIfNull: false)
  final String? subject;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$NotificationMessageFromJson;
  static const toJsonFactory = _$NotificationMessageToJson;
  Map<String, dynamic> toJson() => _$NotificationMessageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationMessage &&
            (identical(other.lang, lang) ||
                const DeepCollectionEquality().equals(other.lang, lang)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(lang) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $NotificationMessageExtension on NotificationMessage {
  NotificationMessage copyWith(
      {String? lang, String? subject, String? message, String? type}) {
    return NotificationMessage(
        lang: lang ?? this.lang,
        subject: subject ?? this.subject,
        message: message ?? this.message,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationRegistration {
  NotificationRegistration({
    this.guid,
    this.protocol,
    this.endpoint,
    this.deviceId,
    this.osName,
    this.createdOn,
    this.modifiedOn,
    this.type,
  });

  factory NotificationRegistration.fromJson(Map<String, dynamic> json) =>
      _$NotificationRegistrationFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(
      name: 'protocol',
      includeIfNull: false,
      toJson: notificationProtocolToJson,
      fromJson: notificationProtocolFromJson)
  final enums.NotificationProtocol? protocol;
  @JsonKey(name: 'endpoint', includeIfNull: false)
  final String? endpoint;
  @JsonKey(name: 'deviceId', includeIfNull: false)
  final String? deviceId;
  @JsonKey(name: 'osName', includeIfNull: false)
  final String? osName;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$NotificationRegistrationFromJson;
  static const toJsonFactory = _$NotificationRegistrationToJson;
  Map<String, dynamic> toJson() => _$NotificationRegistrationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationRegistration &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.protocol, protocol) ||
                const DeepCollectionEquality()
                    .equals(other.protocol, protocol)) &&
            (identical(other.endpoint, endpoint) ||
                const DeepCollectionEquality()
                    .equals(other.endpoint, endpoint)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.osName, osName) ||
                const DeepCollectionEquality().equals(other.osName, osName)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(protocol) ^
      const DeepCollectionEquality().hash(endpoint) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(osName) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $NotificationRegistrationExtension on NotificationRegistration {
  NotificationRegistration copyWith(
      {String? guid,
      enums.NotificationProtocol? protocol,
      String? endpoint,
      String? deviceId,
      String? osName,
      DateTime? createdOn,
      DateTime? modifiedOn,
      String? type}) {
    return NotificationRegistration(
        guid: guid ?? this.guid,
        protocol: protocol ?? this.protocol,
        endpoint: endpoint ?? this.endpoint,
        deviceId: deviceId ?? this.deviceId,
        osName: osName ?? this.osName,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationTopic {
  NotificationTopic({
    this.guid,
    this.name,
    this.shortName,
    this.description,
    this.createdOn,
    this.modifiedOn,
    this.deleted,
    this.criteria,
    this.type,
  });

  factory NotificationTopic.fromJson(Map<String, dynamic> json) =>
      _$NotificationTopicFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'shortName', includeIfNull: false)
  final String? shortName;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'criteria', includeIfNull: false)
  final Criteria? criteria;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$NotificationTopicFromJson;
  static const toJsonFactory = _$NotificationTopicToJson;
  Map<String, dynamic> toJson() => _$NotificationTopicToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationTopic &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.shortName, shortName) ||
                const DeepCollectionEquality()
                    .equals(other.shortName, shortName)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.criteria, criteria) ||
                const DeepCollectionEquality()
                    .equals(other.criteria, criteria)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(shortName) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(criteria) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $NotificationTopicExtension on NotificationTopic {
  NotificationTopic copyWith(
      {String? guid,
      String? name,
      String? shortName,
      String? description,
      DateTime? createdOn,
      DateTime? modifiedOn,
      bool? deleted,
      Criteria? criteria,
      String? type}) {
    return NotificationTopic(
        guid: guid ?? this.guid,
        name: name ?? this.name,
        shortName: shortName ?? this.shortName,
        description: description ?? this.description,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        deleted: deleted ?? this.deleted,
        criteria: criteria ?? this.criteria,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class OAuthAccessToken {
  OAuthAccessToken({
    this.vendorId,
    this.accessToken,
    this.expiresOn,
    this.providerUserId,
    this.scopes,
    this.type,
  });

  factory OAuthAccessToken.fromJson(Map<String, dynamic> json) =>
      _$OAuthAccessTokenFromJson(json);

  @JsonKey(name: 'vendorId', includeIfNull: false)
  final String? vendorId;
  @JsonKey(name: 'accessToken', includeIfNull: false)
  final String? accessToken;
  @JsonKey(name: 'expiresOn', includeIfNull: false)
  final DateTime? expiresOn;
  @JsonKey(name: 'providerUserId', includeIfNull: false)
  final String? providerUserId;
  @JsonKey(name: 'scopes', includeIfNull: false, defaultValue: <String>[])
  final List<String>? scopes;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$OAuthAccessTokenFromJson;
  static const toJsonFactory = _$OAuthAccessTokenToJson;
  Map<String, dynamic> toJson() => _$OAuthAccessTokenToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OAuthAccessToken &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.expiresOn, expiresOn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresOn, expiresOn)) &&
            (identical(other.providerUserId, providerUserId) ||
                const DeepCollectionEquality()
                    .equals(other.providerUserId, providerUserId)) &&
            (identical(other.scopes, scopes) ||
                const DeepCollectionEquality().equals(other.scopes, scopes)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(expiresOn) ^
      const DeepCollectionEquality().hash(providerUserId) ^
      const DeepCollectionEquality().hash(scopes) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $OAuthAccessTokenExtension on OAuthAccessToken {
  OAuthAccessToken copyWith(
      {String? vendorId,
      String? accessToken,
      DateTime? expiresOn,
      String? providerUserId,
      List<String>? scopes,
      String? type}) {
    return OAuthAccessToken(
        vendorId: vendorId ?? this.vendorId,
        accessToken: accessToken ?? this.accessToken,
        expiresOn: expiresOn ?? this.expiresOn,
        providerUserId: providerUserId ?? this.providerUserId,
        scopes: scopes ?? this.scopes,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class OAuthAuthorizationToken {
  OAuthAuthorizationToken({
    this.appId,
    this.vendorId,
    this.authToken,
    this.callbackUrl,
    this.type,
  });

  factory OAuthAuthorizationToken.fromJson(Map<String, dynamic> json) =>
      _$OAuthAuthorizationTokenFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'vendorId', includeIfNull: false)
  final String? vendorId;
  @JsonKey(name: 'authToken', includeIfNull: false)
  final String? authToken;
  @JsonKey(name: 'callbackUrl', includeIfNull: false)
  final String? callbackUrl;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$OAuthAuthorizationTokenFromJson;
  static const toJsonFactory = _$OAuthAuthorizationTokenToJson;
  Map<String, dynamic> toJson() => _$OAuthAuthorizationTokenToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OAuthAuthorizationToken &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)) &&
            (identical(other.callbackUrl, callbackUrl) ||
                const DeepCollectionEquality()
                    .equals(other.callbackUrl, callbackUrl)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(authToken) ^
      const DeepCollectionEquality().hash(callbackUrl) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $OAuthAuthorizationTokenExtension on OAuthAuthorizationToken {
  OAuthAuthorizationToken copyWith(
      {String? appId,
      String? vendorId,
      String? authToken,
      String? callbackUrl,
      String? type}) {
    return OAuthAuthorizationToken(
        appId: appId ?? this.appId,
        vendorId: vendorId ?? this.vendorId,
        authToken: authToken ?? this.authToken,
        callbackUrl: callbackUrl ?? this.callbackUrl,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class OAuthProvider {
  OAuthProvider({
    this.clientId,
    this.secret,
    this.endpoint,
    this.callbackUrl,
    this.introspectEndpoint,
    this.type,
  });

  factory OAuthProvider.fromJson(Map<String, dynamic> json) =>
      _$OAuthProviderFromJson(json);

  @JsonKey(name: 'clientId', includeIfNull: false)
  final String? clientId;
  @JsonKey(name: 'secret', includeIfNull: false)
  final String? secret;
  @JsonKey(name: 'endpoint', includeIfNull: false)
  final String? endpoint;
  @JsonKey(name: 'callbackUrl', includeIfNull: false)
  final String? callbackUrl;
  @JsonKey(name: 'introspectEndpoint', includeIfNull: false)
  final String? introspectEndpoint;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$OAuthProviderFromJson;
  static const toJsonFactory = _$OAuthProviderToJson;
  Map<String, dynamic> toJson() => _$OAuthProviderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OAuthProvider &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.secret, secret) ||
                const DeepCollectionEquality().equals(other.secret, secret)) &&
            (identical(other.endpoint, endpoint) ||
                const DeepCollectionEquality()
                    .equals(other.endpoint, endpoint)) &&
            (identical(other.callbackUrl, callbackUrl) ||
                const DeepCollectionEquality()
                    .equals(other.callbackUrl, callbackUrl)) &&
            (identical(other.introspectEndpoint, introspectEndpoint) ||
                const DeepCollectionEquality()
                    .equals(other.introspectEndpoint, introspectEndpoint)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(secret) ^
      const DeepCollectionEquality().hash(endpoint) ^
      const DeepCollectionEquality().hash(callbackUrl) ^
      const DeepCollectionEquality().hash(introspectEndpoint) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $OAuthProviderExtension on OAuthProvider {
  OAuthProvider copyWith(
      {String? clientId,
      String? secret,
      String? endpoint,
      String? callbackUrl,
      String? introspectEndpoint,
      String? type}) {
    return OAuthProvider(
        clientId: clientId ?? this.clientId,
        secret: secret ?? this.secret,
        endpoint: endpoint ?? this.endpoint,
        callbackUrl: callbackUrl ?? this.callbackUrl,
        introspectEndpoint: introspectEndpoint ?? this.introspectEndpoint,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Organization {
  Organization({
    this.name,
    this.identifier,
    this.description,
    this.createdOn,
    this.modifiedOn,
    this.version,
    this.type,
  });

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$OrganizationFromJson;
  static const toJsonFactory = _$OrganizationToJson;
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Organization &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $OrganizationExtension on Organization {
  Organization copyWith(
      {String? name,
      String? identifier,
      String? description,
      DateTime? createdOn,
      DateTime? modifiedOn,
      num? version,
      String? type}) {
    return Organization(
        name: name ?? this.name,
        identifier: identifier ?? this.identifier,
        description: description ?? this.description,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ParticipantData {
  ParticipantData({
    this.identifier,
    this.data,
    this.type,
  });

  factory ParticipantData.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDataFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'data', includeIfNull: false)
  final Object? data;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ParticipantDataFromJson;
  static const toJsonFactory = _$ParticipantDataToJson;
  Map<String, dynamic> toJson() => _$ParticipantDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParticipantData &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ParticipantDataExtension on ParticipantData {
  ParticipantData copyWith({String? identifier, Object? data, String? type}) {
    return ParticipantData(
        identifier: identifier ?? this.identifier,
        data: data ?? this.data,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ParticipantFile {
  ParticipantFile({
    this.fileId,
    this.mimeType,
    this.createdOn,
    this.downloadUrl,
    this.uploadUrl,
    this.type,
    this.expiresOn,
  });

  factory ParticipantFile.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFileFromJson(json);

  @JsonKey(name: 'fileId', includeIfNull: false)
  final String? fileId;
  @JsonKey(name: 'mimeType', includeIfNull: false)
  final String? mimeType;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'downloadUrl', includeIfNull: false)
  final String? downloadUrl;
  @JsonKey(name: 'uploadUrl', includeIfNull: false)
  final String? uploadUrl;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  @JsonKey(name: 'expiresOn', includeIfNull: false)
  final DateTime? expiresOn;
  static const fromJsonFactory = _$ParticipantFileFromJson;
  static const toJsonFactory = _$ParticipantFileToJson;
  Map<String, dynamic> toJson() => _$ParticipantFileToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParticipantFile &&
            (identical(other.fileId, fileId) ||
                const DeepCollectionEquality().equals(other.fileId, fileId)) &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.downloadUrl, downloadUrl) ||
                const DeepCollectionEquality()
                    .equals(other.downloadUrl, downloadUrl)) &&
            (identical(other.uploadUrl, uploadUrl) ||
                const DeepCollectionEquality()
                    .equals(other.uploadUrl, uploadUrl)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.expiresOn, expiresOn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresOn, expiresOn)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fileId) ^
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(downloadUrl) ^
      const DeepCollectionEquality().hash(uploadUrl) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(expiresOn) ^
      runtimeType.hashCode;
}

extension $ParticipantFileExtension on ParticipantFile {
  ParticipantFile copyWith(
      {String? fileId,
      String? mimeType,
      DateTime? createdOn,
      String? downloadUrl,
      String? uploadUrl,
      String? type,
      DateTime? expiresOn}) {
    return ParticipantFile(
        fileId: fileId ?? this.fileId,
        mimeType: mimeType ?? this.mimeType,
        createdOn: createdOn ?? this.createdOn,
        downloadUrl: downloadUrl ?? this.downloadUrl,
        uploadUrl: uploadUrl ?? this.uploadUrl,
        type: type ?? this.type,
        expiresOn: expiresOn ?? this.expiresOn);
  }
}

@JsonSerializable(explicitToJson: true)
class ParticipantRosterRequest {
  ParticipantRosterRequest({
    this.password,
    this.studyId,
    this.type,
  });

  factory ParticipantRosterRequest.fromJson(Map<String, dynamic> json) =>
      _$ParticipantRosterRequestFromJson(json);

  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'studyId', includeIfNull: false)
  final String? studyId;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ParticipantRosterRequestFromJson;
  static const toJsonFactory = _$ParticipantRosterRequestToJson;
  Map<String, dynamic> toJson() => _$ParticipantRosterRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParticipantRosterRequest &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.studyId, studyId) ||
                const DeepCollectionEquality()
                    .equals(other.studyId, studyId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(studyId) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ParticipantRosterRequestExtension on ParticipantRosterRequest {
  ParticipantRosterRequest copyWith(
      {String? password, String? studyId, String? type}) {
    return ParticipantRosterRequest(
        password: password ?? this.password,
        studyId: studyId ?? this.studyId,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ParticipantVersion {
  ParticipantVersion({
    this.appId,
    this.healthCode,
    this.participantVersion,
    this.createdOn,
    this.modifiedOn,
    this.dataGroups,
    this.languages,
    this.sharingScope,
    this.studyMemberships,
    this.timeZone,
    this.type,
  });

  factory ParticipantVersion.fromJson(Map<String, dynamic> json) =>
      _$ParticipantVersionFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'healthCode', includeIfNull: false)
  final String? healthCode;
  @JsonKey(name: 'participantVersion', includeIfNull: false)
  final int? participantVersion;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'languages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? languages;
  @JsonKey(
      name: 'sharingScope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? sharingScope;
  @JsonKey(name: 'studyMemberships', includeIfNull: false)
  final Map<String, dynamic>? studyMemberships;
  @JsonKey(name: 'timeZone', includeIfNull: false)
  final String? timeZone;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ParticipantVersionFromJson;
  static const toJsonFactory = _$ParticipantVersionToJson;
  Map<String, dynamic> toJson() => _$ParticipantVersionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParticipantVersion &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.healthCode, healthCode) ||
                const DeepCollectionEquality()
                    .equals(other.healthCode, healthCode)) &&
            (identical(other.participantVersion, participantVersion) ||
                const DeepCollectionEquality()
                    .equals(other.participantVersion, participantVersion)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.sharingScope, sharingScope) ||
                const DeepCollectionEquality()
                    .equals(other.sharingScope, sharingScope)) &&
            (identical(other.studyMemberships, studyMemberships) ||
                const DeepCollectionEquality()
                    .equals(other.studyMemberships, studyMemberships)) &&
            (identical(other.timeZone, timeZone) ||
                const DeepCollectionEquality()
                    .equals(other.timeZone, timeZone)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(healthCode) ^
      const DeepCollectionEquality().hash(participantVersion) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(sharingScope) ^
      const DeepCollectionEquality().hash(studyMemberships) ^
      const DeepCollectionEquality().hash(timeZone) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ParticipantVersionExtension on ParticipantVersion {
  ParticipantVersion copyWith(
      {String? appId,
      String? healthCode,
      int? participantVersion,
      DateTime? createdOn,
      DateTime? modifiedOn,
      List<String>? dataGroups,
      List<String>? languages,
      enums.SharingScope? sharingScope,
      Map<String, dynamic>? studyMemberships,
      String? timeZone,
      String? type}) {
    return ParticipantVersion(
        appId: appId ?? this.appId,
        healthCode: healthCode ?? this.healthCode,
        participantVersion: participantVersion ?? this.participantVersion,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        dataGroups: dataGroups ?? this.dataGroups,
        languages: languages ?? this.languages,
        sharingScope: sharingScope ?? this.sharingScope,
        studyMemberships: studyMemberships ?? this.studyMemberships,
        timeZone: timeZone ?? this.timeZone,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class PasswordPolicy {
  PasswordPolicy({
    this.minLength,
    this.numericRequired,
    this.symbolRequired,
    this.lowerCaseRequired,
    this.upperCaseRequired,
    this.type,
  });

  factory PasswordPolicy.fromJson(Map<String, dynamic> json) =>
      _$PasswordPolicyFromJson(json);

  @JsonKey(name: 'minLength', includeIfNull: false)
  final int? minLength;
  @JsonKey(name: 'numericRequired', includeIfNull: false, defaultValue: true)
  final bool? numericRequired;
  @JsonKey(name: 'symbolRequired', includeIfNull: false, defaultValue: true)
  final bool? symbolRequired;
  @JsonKey(name: 'lowerCaseRequired', includeIfNull: false, defaultValue: true)
  final bool? lowerCaseRequired;
  @JsonKey(name: 'upperCaseRequired', includeIfNull: false, defaultValue: true)
  final bool? upperCaseRequired;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$PasswordPolicyFromJson;
  static const toJsonFactory = _$PasswordPolicyToJson;
  Map<String, dynamic> toJson() => _$PasswordPolicyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordPolicy &&
            (identical(other.minLength, minLength) ||
                const DeepCollectionEquality()
                    .equals(other.minLength, minLength)) &&
            (identical(other.numericRequired, numericRequired) ||
                const DeepCollectionEquality()
                    .equals(other.numericRequired, numericRequired)) &&
            (identical(other.symbolRequired, symbolRequired) ||
                const DeepCollectionEquality()
                    .equals(other.symbolRequired, symbolRequired)) &&
            (identical(other.lowerCaseRequired, lowerCaseRequired) ||
                const DeepCollectionEquality()
                    .equals(other.lowerCaseRequired, lowerCaseRequired)) &&
            (identical(other.upperCaseRequired, upperCaseRequired) ||
                const DeepCollectionEquality()
                    .equals(other.upperCaseRequired, upperCaseRequired)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(minLength) ^
      const DeepCollectionEquality().hash(numericRequired) ^
      const DeepCollectionEquality().hash(symbolRequired) ^
      const DeepCollectionEquality().hash(lowerCaseRequired) ^
      const DeepCollectionEquality().hash(upperCaseRequired) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PasswordPolicyExtension on PasswordPolicy {
  PasswordPolicy copyWith(
      {int? minLength,
      bool? numericRequired,
      bool? symbolRequired,
      bool? lowerCaseRequired,
      bool? upperCaseRequired,
      String? type}) {
    return PasswordPolicy(
        minLength: minLength ?? this.minLength,
        numericRequired: numericRequired ?? this.numericRequired,
        symbolRequired: symbolRequired ?? this.symbolRequired,
        lowerCaseRequired: lowerCaseRequired ?? this.lowerCaseRequired,
        upperCaseRequired: upperCaseRequired ?? this.upperCaseRequired,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class PasswordReset {
  PasswordReset({
    this.password,
    this.sptoken,
    this.type,
  });

  factory PasswordReset.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetFromJson(json);

  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'sptoken', includeIfNull: false)
  final String? sptoken;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$PasswordResetFromJson;
  static const toJsonFactory = _$PasswordResetToJson;
  Map<String, dynamic> toJson() => _$PasswordResetToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordReset &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.sptoken, sptoken) ||
                const DeepCollectionEquality()
                    .equals(other.sptoken, sptoken)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(sptoken) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PasswordResetExtension on PasswordReset {
  PasswordReset copyWith({String? password, String? sptoken, String? type}) {
    return PasswordReset(
        password: password ?? this.password,
        sptoken: sptoken ?? this.sptoken,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Phone {
  Phone({
    this.number,
    this.regionCode,
    this.nationalFormat,
    this.type,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  @JsonKey(name: 'number', includeIfNull: false)
  final String? number;
  @JsonKey(name: 'regionCode', includeIfNull: false)
  final String? regionCode;
  @JsonKey(name: 'nationalFormat', includeIfNull: false)
  final String? nationalFormat;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$PhoneFromJson;
  static const toJsonFactory = _$PhoneToJson;
  Map<String, dynamic> toJson() => _$PhoneToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Phone &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.regionCode, regionCode) ||
                const DeepCollectionEquality()
                    .equals(other.regionCode, regionCode)) &&
            (identical(other.nationalFormat, nationalFormat) ||
                const DeepCollectionEquality()
                    .equals(other.nationalFormat, nationalFormat)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(regionCode) ^
      const DeepCollectionEquality().hash(nationalFormat) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PhoneExtension on Phone {
  Phone copyWith(
      {String? number,
      String? regionCode,
      String? nationalFormat,
      String? type}) {
    return Phone(
        number: number ?? this.number,
        regionCode: regionCode ?? this.regionCode,
        nationalFormat: nationalFormat ?? this.nationalFormat,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class PhoneSignInRequest {
  PhoneSignInRequest({
    this.appId,
    this.phone,
    this.type,
  });

  factory PhoneSignInRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneSignInRequestFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$PhoneSignInRequestFromJson;
  static const toJsonFactory = _$PhoneSignInRequestToJson;
  Map<String, dynamic> toJson() => _$PhoneSignInRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhoneSignInRequest &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PhoneSignInRequestExtension on PhoneSignInRequest {
  PhoneSignInRequest copyWith({String? appId, Phone? phone, String? type}) {
    return PhoneSignInRequest(
        appId: appId ?? this.appId,
        phone: phone ?? this.phone,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class PropertyInfo {
  PropertyInfo({
    this.propName,
    this.label,
    this.description,
    this.propType,
    this.type,
  });

  factory PropertyInfo.fromJson(Map<String, dynamic> json) =>
      _$PropertyInfoFromJson(json);

  @JsonKey(name: 'propName', includeIfNull: false)
  final String? propName;
  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'propType', includeIfNull: false)
  final String? propType;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$PropertyInfoFromJson;
  static const toJsonFactory = _$PropertyInfoToJson;
  Map<String, dynamic> toJson() => _$PropertyInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PropertyInfo &&
            (identical(other.propName, propName) ||
                const DeepCollectionEquality()
                    .equals(other.propName, propName)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.propType, propType) ||
                const DeepCollectionEquality()
                    .equals(other.propType, propType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(propName) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(propType) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PropertyInfoExtension on PropertyInfo {
  PropertyInfo copyWith(
      {String? propName,
      String? label,
      String? description,
      String? propType,
      String? type}) {
    return PropertyInfo(
        propName: propName ?? this.propName,
        label: label ?? this.label,
        description: description ?? this.description,
        propType: propType ?? this.propType,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class RecordExportStatusRequest {
  RecordExportStatusRequest({
    this.recordIds,
    this.synapseExporterStatus,
    this.type,
  });

  factory RecordExportStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$RecordExportStatusRequestFromJson(json);

  @JsonKey(name: 'recordIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? recordIds;
  @JsonKey(
      name: 'synapseExporterStatus',
      includeIfNull: false,
      toJson: synapseExporterStatusToJson,
      fromJson: synapseExporterStatusFromJson)
  final enums.SynapseExporterStatus? synapseExporterStatus;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$RecordExportStatusRequestFromJson;
  static const toJsonFactory = _$RecordExportStatusRequestToJson;
  Map<String, dynamic> toJson() => _$RecordExportStatusRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RecordExportStatusRequest &&
            (identical(other.recordIds, recordIds) ||
                const DeepCollectionEquality()
                    .equals(other.recordIds, recordIds)) &&
            (identical(other.synapseExporterStatus, synapseExporterStatus) ||
                const DeepCollectionEquality().equals(
                    other.synapseExporterStatus, synapseExporterStatus)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(recordIds) ^
      const DeepCollectionEquality().hash(synapseExporterStatus) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $RecordExportStatusRequestExtension on RecordExportStatusRequest {
  RecordExportStatusRequest copyWith(
      {List<String>? recordIds,
      enums.SynapseExporterStatus? synapseExporterStatus,
      String? type}) {
    return RecordExportStatusRequest(
        recordIds: recordIds ?? this.recordIds,
        synapseExporterStatus:
            synapseExporterStatus ?? this.synapseExporterStatus,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ReportData {
  ReportData({
    this.date,
    this.localDate,
    this.dateTime,
    this.data,
    this.studyIds,
    this.type,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);

  @JsonKey(name: 'date', includeIfNull: false)
  final String? date;
  @JsonKey(name: 'localDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? localDate;
  @JsonKey(name: 'dateTime', includeIfNull: false)
  final DateTime? dateTime;
  @JsonKey(name: 'data', includeIfNull: false)
  final Object? data;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ReportDataFromJson;
  static const toJsonFactory = _$ReportDataToJson;
  Map<String, dynamic> toJson() => _$ReportDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportData &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.localDate, localDate) ||
                const DeepCollectionEquality()
                    .equals(other.localDate, localDate)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(localDate) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ReportDataExtension on ReportData {
  ReportData copyWith(
      {String? date,
      DateTime? localDate,
      DateTime? dateTime,
      Object? data,
      List<String>? studyIds,
      String? type}) {
    return ReportData(
        date: date ?? this.date,
        localDate: localDate ?? this.localDate,
        dateTime: dateTime ?? this.dateTime,
        data: data ?? this.data,
        studyIds: studyIds ?? this.studyIds,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ReportDataForWorker {
  ReportDataForWorker({
    this.healthCode,
    this.date,
    this.dateTime,
    this.data,
    this.studyIds,
    this.type,
  });

  factory ReportDataForWorker.fromJson(Map<String, dynamic> json) =>
      _$ReportDataForWorkerFromJson(json);

  @JsonKey(name: 'healthCode', includeIfNull: false)
  final String? healthCode;
  @JsonKey(name: 'date', includeIfNull: false, toJson: _dateToJson)
  final DateTime? date;
  @JsonKey(name: 'dateTime', includeIfNull: false)
  final DateTime? dateTime;
  @JsonKey(name: 'data', includeIfNull: false)
  final Object? data;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ReportDataForWorkerFromJson;
  static const toJsonFactory = _$ReportDataForWorkerToJson;
  Map<String, dynamic> toJson() => _$ReportDataForWorkerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportDataForWorker &&
            (identical(other.healthCode, healthCode) ||
                const DeepCollectionEquality()
                    .equals(other.healthCode, healthCode)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(healthCode) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ReportDataForWorkerExtension on ReportDataForWorker {
  ReportDataForWorker copyWith(
      {String? healthCode,
      DateTime? date,
      DateTime? dateTime,
      Object? data,
      List<String>? studyIds,
      String? type}) {
    return ReportDataForWorker(
        healthCode: healthCode ?? this.healthCode,
        date: date ?? this.date,
        dateTime: dateTime ?? this.dateTime,
        data: data ?? this.data,
        studyIds: studyIds ?? this.studyIds,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ReportIndex {
  ReportIndex({
    this.identifier,
    this.studyIds,
    this.public,
    this.type,
  });

  factory ReportIndex.fromJson(Map<String, dynamic> json) =>
      _$ReportIndexFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'public', includeIfNull: false)
  final bool? public;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ReportIndexFromJson;
  static const toJsonFactory = _$ReportIndexToJson;
  Map<String, dynamic> toJson() => _$ReportIndexToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportIndex &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.public, public) ||
                const DeepCollectionEquality().equals(other.public, public)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(public) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ReportIndexExtension on ReportIndex {
  ReportIndex copyWith(
      {String? identifier,
      List<String>? studyIds,
      bool? public,
      String? type}) {
    return ReportIndex(
        identifier: identifier ?? this.identifier,
        studyIds: studyIds ?? this.studyIds,
        public: public ?? this.public,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class RequestInfo {
  RequestInfo({
    this.userId,
    this.clientInfo,
    this.userAgent,
    this.languages,
    this.userDataGroups,
    this.activitiesAccessedOn,
    this.timelineAccessedOn,
    this.signedInOn,
    this.uploadedOn,
    this.timeZone,
    this.type,
  });

  factory RequestInfo.fromJson(Map<String, dynamic> json) =>
      _$RequestInfoFromJson(json);

  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'clientInfo', includeIfNull: false)
  final ClientInfo? clientInfo;
  @JsonKey(name: 'userAgent', includeIfNull: false)
  final String? userAgent;
  @JsonKey(name: 'languages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? languages;
  @JsonKey(
      name: 'userDataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? userDataGroups;
  @JsonKey(name: 'activitiesAccessedOn', includeIfNull: false)
  final DateTime? activitiesAccessedOn;
  @JsonKey(name: 'timelineAccessedOn', includeIfNull: false)
  final DateTime? timelineAccessedOn;
  @JsonKey(name: 'signedInOn', includeIfNull: false)
  final DateTime? signedInOn;
  @JsonKey(name: 'uploadedOn', includeIfNull: false)
  final DateTime? uploadedOn;
  @JsonKey(name: 'timeZone', includeIfNull: false)
  final String? timeZone;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$RequestInfoFromJson;
  static const toJsonFactory = _$RequestInfoToJson;
  Map<String, dynamic> toJson() => _$RequestInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestInfo &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.clientInfo, clientInfo) ||
                const DeepCollectionEquality()
                    .equals(other.clientInfo, clientInfo)) &&
            (identical(other.userAgent, userAgent) ||
                const DeepCollectionEquality()
                    .equals(other.userAgent, userAgent)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.userDataGroups, userDataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.userDataGroups, userDataGroups)) &&
            (identical(other.activitiesAccessedOn, activitiesAccessedOn) ||
                const DeepCollectionEquality().equals(
                    other.activitiesAccessedOn, activitiesAccessedOn)) &&
            (identical(other.timelineAccessedOn, timelineAccessedOn) ||
                const DeepCollectionEquality()
                    .equals(other.timelineAccessedOn, timelineAccessedOn)) &&
            (identical(other.signedInOn, signedInOn) ||
                const DeepCollectionEquality()
                    .equals(other.signedInOn, signedInOn)) &&
            (identical(other.uploadedOn, uploadedOn) ||
                const DeepCollectionEquality()
                    .equals(other.uploadedOn, uploadedOn)) &&
            (identical(other.timeZone, timeZone) ||
                const DeepCollectionEquality()
                    .equals(other.timeZone, timeZone)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(clientInfo) ^
      const DeepCollectionEquality().hash(userAgent) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(userDataGroups) ^
      const DeepCollectionEquality().hash(activitiesAccessedOn) ^
      const DeepCollectionEquality().hash(timelineAccessedOn) ^
      const DeepCollectionEquality().hash(signedInOn) ^
      const DeepCollectionEquality().hash(uploadedOn) ^
      const DeepCollectionEquality().hash(timeZone) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $RequestInfoExtension on RequestInfo {
  RequestInfo copyWith(
      {String? userId,
      ClientInfo? clientInfo,
      String? userAgent,
      List<String>? languages,
      List<String>? userDataGroups,
      DateTime? activitiesAccessedOn,
      DateTime? timelineAccessedOn,
      DateTime? signedInOn,
      DateTime? uploadedOn,
      String? timeZone,
      String? type}) {
    return RequestInfo(
        userId: userId ?? this.userId,
        clientInfo: clientInfo ?? this.clientInfo,
        userAgent: userAgent ?? this.userAgent,
        languages: languages ?? this.languages,
        userDataGroups: userDataGroups ?? this.userDataGroups,
        activitiesAccessedOn: activitiesAccessedOn ?? this.activitiesAccessedOn,
        timelineAccessedOn: timelineAccessedOn ?? this.timelineAccessedOn,
        signedInOn: signedInOn ?? this.signedInOn,
        uploadedOn: uploadedOn ?? this.uploadedOn,
        timeZone: timeZone ?? this.timeZone,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class RequestParams {
  RequestParams({
    this.allOfGroups,
    this.assessmentIds,
    this.assignmentFilter,
    this.currentTimestampsOnly,
    this.emailFilter,
    this.endDate,
    this.endTime,
    this.eventTimestamps,
    this.idFilter,
    this.includeDeleted,
    this.includeRepeats,
    this.instanceGuids,
    this.language,
    this.noneOfGroups,
    this.offsetBy,
    this.offsetKey,
    this.pageSize,
    this.phoneFilter,
    this.recordType,
    this.reportType,
    this.scheduledOnStart,
    this.scheduledOnEnd,
    this.sessionGuids,
    this.sortOrder,
    this.startDate,
    this.startTime,
    this.studyId,
    this.timeWindowGuids,
    this.total,
    this.summary,
    this.tags,
    this.categories,
    this.minRevision,
    this.maxRevision,
    this.adminOnly,
    this.orgMembership,
    this.externalIdFilter,
    this.status,
    this.enrollment,
    this.attributeKey,
    this.attributeValueFilter,
    this.predicate,
    this.stringSearchPosition,
    this.type,
  });

  factory RequestParams.fromJson(Map<String, dynamic> json) =>
      _$RequestParamsFromJson(json);

  @JsonKey(name: 'allOfGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? allOfGroups;
  @JsonKey(
      name: 'assessmentIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? assessmentIds;
  @JsonKey(name: 'assignmentFilter', includeIfNull: false)
  final bool? assignmentFilter;
  @JsonKey(name: 'currentTimestampsOnly', includeIfNull: false)
  final bool? currentTimestampsOnly;
  @JsonKey(name: 'emailFilter', includeIfNull: false)
  final String? emailFilter;
  @JsonKey(name: 'endDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? endDate;
  @JsonKey(name: 'endTime', includeIfNull: false)
  final DateTime? endTime;
  @JsonKey(name: 'eventTimestamps', includeIfNull: false)
  final Map<String, dynamic>? eventTimestamps;
  @JsonKey(name: 'idFilter', includeIfNull: false)
  final String? idFilter;
  @JsonKey(name: 'includeDeleted', includeIfNull: false)
  final bool? includeDeleted;
  @JsonKey(name: 'includeRepeats', includeIfNull: false)
  final bool? includeRepeats;
  @JsonKey(
      name: 'instanceGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? instanceGuids;
  @JsonKey(name: 'language', includeIfNull: false)
  final String? language;
  @JsonKey(name: 'noneOfGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? noneOfGroups;
  @JsonKey(name: 'offsetBy', includeIfNull: false)
  final int? offsetBy;
  @JsonKey(name: 'offsetKey', includeIfNull: false)
  final String? offsetKey;
  @JsonKey(name: 'pageSize', includeIfNull: false)
  final int? pageSize;
  @JsonKey(name: 'phoneFilter', includeIfNull: false)
  final String? phoneFilter;
  @JsonKey(
      name: 'recordType',
      includeIfNull: false,
      toJson: adherenceRecordTypeToJson,
      fromJson: adherenceRecordTypeFromJson)
  final enums.AdherenceRecordType? recordType;
  @JsonKey(
      name: 'reportType',
      includeIfNull: false,
      toJson: reportTypeToJson,
      fromJson: reportTypeFromJson)
  final enums.ReportType? reportType;
  @JsonKey(name: 'scheduledOnStart', includeIfNull: false)
  final DateTime? scheduledOnStart;
  @JsonKey(name: 'scheduledOnEnd', includeIfNull: false)
  final DateTime? scheduledOnEnd;
  @JsonKey(name: 'sessionGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? sessionGuids;
  @JsonKey(
      name: 'sortOrder',
      includeIfNull: false,
      toJson: sortOrderToJson,
      fromJson: sortOrderFromJson)
  final enums.SortOrder? sortOrder;
  @JsonKey(name: 'startDate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? startDate;
  @JsonKey(name: 'startTime', includeIfNull: false)
  final DateTime? startTime;
  @JsonKey(name: 'studyId', includeIfNull: false)
  final String? studyId;
  @JsonKey(
      name: 'timeWindowGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? timeWindowGuids;
  @JsonKey(name: 'total', includeIfNull: false)
  final int? total;
  @JsonKey(name: 'summary', includeIfNull: false)
  final bool? summary;
  @JsonKey(name: 'tags', includeIfNull: false, defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(
      name: 'categories',
      includeIfNull: false,
      toJson: resourceCategoryListToJson,
      fromJson: resourceCategoryListFromJson)
  final List<enums.ResourceCategory>? categories;
  @JsonKey(name: 'minRevision', includeIfNull: false)
  final int? minRevision;
  @JsonKey(name: 'maxRevision', includeIfNull: false)
  final int? maxRevision;
  @JsonKey(name: 'adminOnly', includeIfNull: false)
  final bool? adminOnly;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'externalIdFilter', includeIfNull: false)
  final String? externalIdFilter;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(
      name: 'enrollment',
      includeIfNull: false,
      toJson: enrollmentFilterToJson,
      fromJson: enrollmentFilterFromJson)
  final enums.EnrollmentFilter? enrollment;
  @JsonKey(name: 'attributeKey', includeIfNull: false)
  final String? attributeKey;
  @JsonKey(name: 'attributeValueFilter', includeIfNull: false)
  final String? attributeValueFilter;
  @JsonKey(
      name: 'predicate',
      includeIfNull: false,
      toJson: searchTermPredicateToJson,
      fromJson: searchTermPredicateFromJson)
  final enums.SearchTermPredicate? predicate;
  @JsonKey(
      name: 'stringSearchPosition',
      includeIfNull: false,
      toJson: stringSearchPositionToJson,
      fromJson: stringSearchPositionFromJson)
  final enums.StringSearchPosition? stringSearchPosition;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$RequestParamsFromJson;
  static const toJsonFactory = _$RequestParamsToJson;
  Map<String, dynamic> toJson() => _$RequestParamsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestParams &&
            (identical(other.allOfGroups, allOfGroups) ||
                const DeepCollectionEquality()
                    .equals(other.allOfGroups, allOfGroups)) &&
            (identical(other.assessmentIds, assessmentIds) ||
                const DeepCollectionEquality()
                    .equals(other.assessmentIds, assessmentIds)) &&
            (identical(other.assignmentFilter, assignmentFilter) ||
                const DeepCollectionEquality()
                    .equals(other.assignmentFilter, assignmentFilter)) &&
            (identical(other.currentTimestampsOnly, currentTimestampsOnly) ||
                const DeepCollectionEquality().equals(
                    other.currentTimestampsOnly, currentTimestampsOnly)) &&
            (identical(other.emailFilter, emailFilter) ||
                const DeepCollectionEquality()
                    .equals(other.emailFilter, emailFilter)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.eventTimestamps, eventTimestamps) ||
                const DeepCollectionEquality()
                    .equals(other.eventTimestamps, eventTimestamps)) &&
            (identical(other.idFilter, idFilter) ||
                const DeepCollectionEquality()
                    .equals(other.idFilter, idFilter)) &&
            (identical(other.includeDeleted, includeDeleted) ||
                const DeepCollectionEquality()
                    .equals(other.includeDeleted, includeDeleted)) &&
            (identical(other.includeRepeats, includeRepeats) ||
                const DeepCollectionEquality()
                    .equals(other.includeRepeats, includeRepeats)) &&
            (identical(other.instanceGuids, instanceGuids) ||
                const DeepCollectionEquality()
                    .equals(other.instanceGuids, instanceGuids)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.noneOfGroups, noneOfGroups) ||
                const DeepCollectionEquality()
                    .equals(other.noneOfGroups, noneOfGroups)) &&
            (identical(other.offsetBy, offsetBy) ||
                const DeepCollectionEquality()
                    .equals(other.offsetBy, offsetBy)) &&
            (identical(other.offsetKey, offsetKey) ||
                const DeepCollectionEquality()
                    .equals(other.offsetKey, offsetKey)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.phoneFilter, phoneFilter) ||
                const DeepCollectionEquality()
                    .equals(other.phoneFilter, phoneFilter)) &&
            (identical(other.recordType, recordType) ||
                const DeepCollectionEquality()
                    .equals(other.recordType, recordType)) &&
            (identical(other.reportType, reportType) ||
                const DeepCollectionEquality()
                    .equals(other.reportType, reportType)) &&
            (identical(other.scheduledOnStart, scheduledOnStart) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledOnStart, scheduledOnStart)) &&
            (identical(other.scheduledOnEnd, scheduledOnEnd) ||
                const DeepCollectionEquality().equals(other.scheduledOnEnd, scheduledOnEnd)) &&
            (identical(other.sessionGuids, sessionGuids) || const DeepCollectionEquality().equals(other.sessionGuids, sessionGuids)) &&
            (identical(other.sortOrder, sortOrder) || const DeepCollectionEquality().equals(other.sortOrder, sortOrder)) &&
            (identical(other.startDate, startDate) || const DeepCollectionEquality().equals(other.startDate, startDate)) &&
            (identical(other.startTime, startTime) || const DeepCollectionEquality().equals(other.startTime, startTime)) &&
            (identical(other.studyId, studyId) || const DeepCollectionEquality().equals(other.studyId, studyId)) &&
            (identical(other.timeWindowGuids, timeWindowGuids) || const DeepCollectionEquality().equals(other.timeWindowGuids, timeWindowGuids)) &&
            (identical(other.total, total) || const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.summary, summary) || const DeepCollectionEquality().equals(other.summary, summary)) &&
            (identical(other.tags, tags) || const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.categories, categories) || const DeepCollectionEquality().equals(other.categories, categories)) &&
            (identical(other.minRevision, minRevision) || const DeepCollectionEquality().equals(other.minRevision, minRevision)) &&
            (identical(other.maxRevision, maxRevision) || const DeepCollectionEquality().equals(other.maxRevision, maxRevision)) &&
            (identical(other.adminOnly, adminOnly) || const DeepCollectionEquality().equals(other.adminOnly, adminOnly)) &&
            (identical(other.orgMembership, orgMembership) || const DeepCollectionEquality().equals(other.orgMembership, orgMembership)) &&
            (identical(other.externalIdFilter, externalIdFilter) || const DeepCollectionEquality().equals(other.externalIdFilter, externalIdFilter)) &&
            (identical(other.status, status) || const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.enrollment, enrollment) || const DeepCollectionEquality().equals(other.enrollment, enrollment)) &&
            (identical(other.attributeKey, attributeKey) || const DeepCollectionEquality().equals(other.attributeKey, attributeKey)) &&
            (identical(other.attributeValueFilter, attributeValueFilter) || const DeepCollectionEquality().equals(other.attributeValueFilter, attributeValueFilter)) &&
            (identical(other.predicate, predicate) || const DeepCollectionEquality().equals(other.predicate, predicate)) &&
            (identical(other.stringSearchPosition, stringSearchPosition) || const DeepCollectionEquality().equals(other.stringSearchPosition, stringSearchPosition)) &&
            (identical(other.type, type) || const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allOfGroups) ^
      const DeepCollectionEquality().hash(assessmentIds) ^
      const DeepCollectionEquality().hash(assignmentFilter) ^
      const DeepCollectionEquality().hash(currentTimestampsOnly) ^
      const DeepCollectionEquality().hash(emailFilter) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(eventTimestamps) ^
      const DeepCollectionEquality().hash(idFilter) ^
      const DeepCollectionEquality().hash(includeDeleted) ^
      const DeepCollectionEquality().hash(includeRepeats) ^
      const DeepCollectionEquality().hash(instanceGuids) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(noneOfGroups) ^
      const DeepCollectionEquality().hash(offsetBy) ^
      const DeepCollectionEquality().hash(offsetKey) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(phoneFilter) ^
      const DeepCollectionEquality().hash(recordType) ^
      const DeepCollectionEquality().hash(reportType) ^
      const DeepCollectionEquality().hash(scheduledOnStart) ^
      const DeepCollectionEquality().hash(scheduledOnEnd) ^
      const DeepCollectionEquality().hash(sessionGuids) ^
      const DeepCollectionEquality().hash(sortOrder) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(studyId) ^
      const DeepCollectionEquality().hash(timeWindowGuids) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(minRevision) ^
      const DeepCollectionEquality().hash(maxRevision) ^
      const DeepCollectionEquality().hash(adminOnly) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(externalIdFilter) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(enrollment) ^
      const DeepCollectionEquality().hash(attributeKey) ^
      const DeepCollectionEquality().hash(attributeValueFilter) ^
      const DeepCollectionEquality().hash(predicate) ^
      const DeepCollectionEquality().hash(stringSearchPosition) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $RequestParamsExtension on RequestParams {
  RequestParams copyWith(
      {List<String>? allOfGroups,
      List<String>? assessmentIds,
      bool? assignmentFilter,
      bool? currentTimestampsOnly,
      String? emailFilter,
      DateTime? endDate,
      DateTime? endTime,
      Map<String, dynamic>? eventTimestamps,
      String? idFilter,
      bool? includeDeleted,
      bool? includeRepeats,
      List<String>? instanceGuids,
      String? language,
      List<String>? noneOfGroups,
      int? offsetBy,
      String? offsetKey,
      int? pageSize,
      String? phoneFilter,
      enums.AdherenceRecordType? recordType,
      enums.ReportType? reportType,
      DateTime? scheduledOnStart,
      DateTime? scheduledOnEnd,
      List<String>? sessionGuids,
      enums.SortOrder? sortOrder,
      DateTime? startDate,
      DateTime? startTime,
      String? studyId,
      List<String>? timeWindowGuids,
      int? total,
      bool? summary,
      List<String>? tags,
      List<enums.ResourceCategory>? categories,
      int? minRevision,
      int? maxRevision,
      bool? adminOnly,
      String? orgMembership,
      String? externalIdFilter,
      enums.AccountStatus? status,
      enums.EnrollmentFilter? enrollment,
      String? attributeKey,
      String? attributeValueFilter,
      enums.SearchTermPredicate? predicate,
      enums.StringSearchPosition? stringSearchPosition,
      String? type}) {
    return RequestParams(
        allOfGroups: allOfGroups ?? this.allOfGroups,
        assessmentIds: assessmentIds ?? this.assessmentIds,
        assignmentFilter: assignmentFilter ?? this.assignmentFilter,
        currentTimestampsOnly:
            currentTimestampsOnly ?? this.currentTimestampsOnly,
        emailFilter: emailFilter ?? this.emailFilter,
        endDate: endDate ?? this.endDate,
        endTime: endTime ?? this.endTime,
        eventTimestamps: eventTimestamps ?? this.eventTimestamps,
        idFilter: idFilter ?? this.idFilter,
        includeDeleted: includeDeleted ?? this.includeDeleted,
        includeRepeats: includeRepeats ?? this.includeRepeats,
        instanceGuids: instanceGuids ?? this.instanceGuids,
        language: language ?? this.language,
        noneOfGroups: noneOfGroups ?? this.noneOfGroups,
        offsetBy: offsetBy ?? this.offsetBy,
        offsetKey: offsetKey ?? this.offsetKey,
        pageSize: pageSize ?? this.pageSize,
        phoneFilter: phoneFilter ?? this.phoneFilter,
        recordType: recordType ?? this.recordType,
        reportType: reportType ?? this.reportType,
        scheduledOnStart: scheduledOnStart ?? this.scheduledOnStart,
        scheduledOnEnd: scheduledOnEnd ?? this.scheduledOnEnd,
        sessionGuids: sessionGuids ?? this.sessionGuids,
        sortOrder: sortOrder ?? this.sortOrder,
        startDate: startDate ?? this.startDate,
        startTime: startTime ?? this.startTime,
        studyId: studyId ?? this.studyId,
        timeWindowGuids: timeWindowGuids ?? this.timeWindowGuids,
        total: total ?? this.total,
        summary: summary ?? this.summary,
        tags: tags ?? this.tags,
        categories: categories ?? this.categories,
        minRevision: minRevision ?? this.minRevision,
        maxRevision: maxRevision ?? this.maxRevision,
        adminOnly: adminOnly ?? this.adminOnly,
        orgMembership: orgMembership ?? this.orgMembership,
        externalIdFilter: externalIdFilter ?? this.externalIdFilter,
        status: status ?? this.status,
        enrollment: enrollment ?? this.enrollment,
        attributeKey: attributeKey ?? this.attributeKey,
        attributeValueFilter: attributeValueFilter ?? this.attributeValueFilter,
        predicate: predicate ?? this.predicate,
        stringSearchPosition: stringSearchPosition ?? this.stringSearchPosition,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Schedule {
  Schedule({
    this.label,
    this.scheduleType,
    this.eventId,
    this.delay,
    this.interval,
    this.sequencePeriod,
    this.expires,
    this.cronTrigger,
    this.startsOn,
    this.endsOn,
    this.times,
    this.persistent,
    this.activities,
    this.type,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(
      name: 'scheduleType',
      includeIfNull: false,
      toJson: scheduleTypeToJson,
      fromJson: scheduleTypeFromJson)
  final enums.ScheduleType? scheduleType;
  @JsonKey(name: 'eventId', includeIfNull: false)
  final String? eventId;
  @JsonKey(name: 'delay', includeIfNull: false)
  final String? delay;
  @JsonKey(name: 'interval', includeIfNull: false)
  final String? interval;
  @JsonKey(name: 'sequencePeriod', includeIfNull: false)
  final String? sequencePeriod;
  @JsonKey(name: 'expires', includeIfNull: false)
  final String? expires;
  @JsonKey(name: 'cronTrigger', includeIfNull: false)
  final String? cronTrigger;
  @JsonKey(name: 'startsOn', includeIfNull: false)
  final DateTime? startsOn;
  @JsonKey(name: 'endsOn', includeIfNull: false)
  final DateTime? endsOn;
  @JsonKey(name: 'times', includeIfNull: false, defaultValue: <String>[])
  final List<String>? times;
  @JsonKey(name: 'persistent', includeIfNull: false)
  final bool? persistent;
  @JsonKey(name: 'activities', includeIfNull: false, defaultValue: <Activity>[])
  final List<Activity>? activities;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduleFromJson;
  static const toJsonFactory = _$ScheduleToJson;
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Schedule &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.scheduleType, scheduleType) ||
                const DeepCollectionEquality()
                    .equals(other.scheduleType, scheduleType)) &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.delay, delay) ||
                const DeepCollectionEquality().equals(other.delay, delay)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.sequencePeriod, sequencePeriod) ||
                const DeepCollectionEquality()
                    .equals(other.sequencePeriod, sequencePeriod)) &&
            (identical(other.expires, expires) ||
                const DeepCollectionEquality()
                    .equals(other.expires, expires)) &&
            (identical(other.cronTrigger, cronTrigger) ||
                const DeepCollectionEquality()
                    .equals(other.cronTrigger, cronTrigger)) &&
            (identical(other.startsOn, startsOn) ||
                const DeepCollectionEquality()
                    .equals(other.startsOn, startsOn)) &&
            (identical(other.endsOn, endsOn) ||
                const DeepCollectionEquality().equals(other.endsOn, endsOn)) &&
            (identical(other.times, times) ||
                const DeepCollectionEquality().equals(other.times, times)) &&
            (identical(other.persistent, persistent) ||
                const DeepCollectionEquality()
                    .equals(other.persistent, persistent)) &&
            (identical(other.activities, activities) ||
                const DeepCollectionEquality()
                    .equals(other.activities, activities)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(scheduleType) ^
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(delay) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(sequencePeriod) ^
      const DeepCollectionEquality().hash(expires) ^
      const DeepCollectionEquality().hash(cronTrigger) ^
      const DeepCollectionEquality().hash(startsOn) ^
      const DeepCollectionEquality().hash(endsOn) ^
      const DeepCollectionEquality().hash(times) ^
      const DeepCollectionEquality().hash(persistent) ^
      const DeepCollectionEquality().hash(activities) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduleExtension on Schedule {
  Schedule copyWith(
      {String? label,
      enums.ScheduleType? scheduleType,
      String? eventId,
      String? delay,
      String? interval,
      String? sequencePeriod,
      String? expires,
      String? cronTrigger,
      DateTime? startsOn,
      DateTime? endsOn,
      List<String>? times,
      bool? persistent,
      List<Activity>? activities,
      String? type}) {
    return Schedule(
        label: label ?? this.label,
        scheduleType: scheduleType ?? this.scheduleType,
        eventId: eventId ?? this.eventId,
        delay: delay ?? this.delay,
        interval: interval ?? this.interval,
        sequencePeriod: sequencePeriod ?? this.sequencePeriod,
        expires: expires ?? this.expires,
        cronTrigger: cronTrigger ?? this.cronTrigger,
        startsOn: startsOn ?? this.startsOn,
        endsOn: endsOn ?? this.endsOn,
        times: times ?? this.times,
        persistent: persistent ?? this.persistent,
        activities: activities ?? this.activities,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Schedule2 {
  Schedule2({
    this.ownerId,
    this.name,
    this.guid,
    this.duration,
    this.published,
    this.deleted,
    this.clientData,
    this.studyBursts,
    this.sessions,
    this.createdOn,
    this.modifiedOn,
    this.version,
    this.type,
  });

  factory Schedule2.fromJson(Map<String, dynamic> json) =>
      _$Schedule2FromJson(json);

  @JsonKey(name: 'ownerId', includeIfNull: false)
  final String? ownerId;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'duration', includeIfNull: false)
  final String? duration;
  @JsonKey(name: 'published', includeIfNull: false)
  final bool? published;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Map<String, dynamic>? clientData;
  @JsonKey(
      name: 'studyBursts', includeIfNull: false, defaultValue: <StudyBurst>[])
  final List<StudyBurst>? studyBursts;
  @JsonKey(name: 'sessions', includeIfNull: false, defaultValue: <Session>[])
  final List<Session>? sessions;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$Schedule2FromJson;
  static const toJsonFactory = _$Schedule2ToJson;
  Map<String, dynamic> toJson() => _$Schedule2ToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Schedule2 &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.published, published) ||
                const DeepCollectionEquality()
                    .equals(other.published, published)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.studyBursts, studyBursts) ||
                const DeepCollectionEquality()
                    .equals(other.studyBursts, studyBursts)) &&
            (identical(other.sessions, sessions) ||
                const DeepCollectionEquality()
                    .equals(other.sessions, sessions)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(published) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(studyBursts) ^
      const DeepCollectionEquality().hash(sessions) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $Schedule2Extension on Schedule2 {
  Schedule2 copyWith(
      {String? ownerId,
      String? name,
      String? guid,
      String? duration,
      bool? published,
      bool? deleted,
      Map<String, dynamic>? clientData,
      List<StudyBurst>? studyBursts,
      List<Session>? sessions,
      DateTime? createdOn,
      DateTime? modifiedOn,
      num? version,
      String? type}) {
    return Schedule2(
        ownerId: ownerId ?? this.ownerId,
        name: name ?? this.name,
        guid: guid ?? this.guid,
        duration: duration ?? this.duration,
        published: published ?? this.published,
        deleted: deleted ?? this.deleted,
        clientData: clientData ?? this.clientData,
        studyBursts: studyBursts ?? this.studyBursts,
        sessions: sessions ?? this.sessions,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduleCriteria {
  ScheduleCriteria({
    this.criteria,
    this.schedule,
    this.type,
  });

  factory ScheduleCriteria.fromJson(Map<String, dynamic> json) =>
      _$ScheduleCriteriaFromJson(json);

  @JsonKey(name: 'criteria', includeIfNull: false)
  final Criteria? criteria;
  @JsonKey(name: 'schedule', includeIfNull: false)
  final Schedule? schedule;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduleCriteriaFromJson;
  static const toJsonFactory = _$ScheduleCriteriaToJson;
  Map<String, dynamic> toJson() => _$ScheduleCriteriaToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduleCriteria &&
            (identical(other.criteria, criteria) ||
                const DeepCollectionEquality()
                    .equals(other.criteria, criteria)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(criteria) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduleCriteriaExtension on ScheduleCriteria {
  ScheduleCriteria copyWith(
      {Criteria? criteria, Schedule? schedule, String? type}) {
    return ScheduleCriteria(
        criteria: criteria ?? this.criteria,
        schedule: schedule ?? this.schedule,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledAssessment {
  ScheduledAssessment({
    this.refKey,
    this.instanceGuid,
    this.type,
  });

  factory ScheduledAssessment.fromJson(Map<String, dynamic> json) =>
      _$ScheduledAssessmentFromJson(json);

  @JsonKey(name: 'refKey', includeIfNull: false)
  final String? refKey;
  @JsonKey(name: 'instanceGuid', includeIfNull: false)
  final String? instanceGuid;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduledAssessmentFromJson;
  static const toJsonFactory = _$ScheduledAssessmentToJson;
  Map<String, dynamic> toJson() => _$ScheduledAssessmentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduledAssessment &&
            (identical(other.refKey, refKey) ||
                const DeepCollectionEquality().equals(other.refKey, refKey)) &&
            (identical(other.instanceGuid, instanceGuid) ||
                const DeepCollectionEquality()
                    .equals(other.instanceGuid, instanceGuid)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(refKey) ^
      const DeepCollectionEquality().hash(instanceGuid) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduledAssessmentExtension on ScheduledAssessment {
  ScheduledAssessment copyWith(
      {String? refKey, String? instanceGuid, String? type}) {
    return ScheduledAssessment(
        refKey: refKey ?? this.refKey,
        instanceGuid: instanceGuid ?? this.instanceGuid,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledSession {
  ScheduledSession({
    this.refGuid,
    this.instanceGuid,
    this.startEventId,
    this.startDay,
    this.endDay,
    this.startTime,
    this.delayTime,
    this.expiration,
    this.persistent,
    this.studyBurstId,
    this.studyBurstNum,
    this.timeWindowGuid,
    this.assessments,
    this.type,
  });

  factory ScheduledSession.fromJson(Map<String, dynamic> json) =>
      _$ScheduledSessionFromJson(json);

  @JsonKey(name: 'refGuid', includeIfNull: false)
  final String? refGuid;
  @JsonKey(name: 'instanceGuid', includeIfNull: false)
  final String? instanceGuid;
  @JsonKey(name: 'startEventId', includeIfNull: false)
  final String? startEventId;
  @JsonKey(name: 'startDay', includeIfNull: false)
  final int? startDay;
  @JsonKey(name: 'endDay', includeIfNull: false)
  final int? endDay;
  @JsonKey(name: 'startTime', includeIfNull: false)
  final String? startTime;
  @JsonKey(name: 'delayTime', includeIfNull: false)
  final String? delayTime;
  @JsonKey(name: 'expiration', includeIfNull: false)
  final String? expiration;
  @JsonKey(name: 'persistent', includeIfNull: false)
  final bool? persistent;
  @JsonKey(name: 'studyBurstId', includeIfNull: false)
  final String? studyBurstId;
  @JsonKey(name: 'studyBurstNum', includeIfNull: false)
  final int? studyBurstNum;
  @JsonKey(name: 'timeWindowGuid', includeIfNull: false)
  final String? timeWindowGuid;
  @JsonKey(
      name: 'assessments',
      includeIfNull: false,
      defaultValue: <ScheduledAssessment>[])
  final List<ScheduledAssessment>? assessments;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduledSessionFromJson;
  static const toJsonFactory = _$ScheduledSessionToJson;
  Map<String, dynamic> toJson() => _$ScheduledSessionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduledSession &&
            (identical(other.refGuid, refGuid) ||
                const DeepCollectionEquality()
                    .equals(other.refGuid, refGuid)) &&
            (identical(other.instanceGuid, instanceGuid) ||
                const DeepCollectionEquality()
                    .equals(other.instanceGuid, instanceGuid)) &&
            (identical(other.startEventId, startEventId) ||
                const DeepCollectionEquality()
                    .equals(other.startEventId, startEventId)) &&
            (identical(other.startDay, startDay) ||
                const DeepCollectionEquality()
                    .equals(other.startDay, startDay)) &&
            (identical(other.endDay, endDay) ||
                const DeepCollectionEquality().equals(other.endDay, endDay)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.delayTime, delayTime) ||
                const DeepCollectionEquality()
                    .equals(other.delayTime, delayTime)) &&
            (identical(other.expiration, expiration) ||
                const DeepCollectionEquality()
                    .equals(other.expiration, expiration)) &&
            (identical(other.persistent, persistent) ||
                const DeepCollectionEquality()
                    .equals(other.persistent, persistent)) &&
            (identical(other.studyBurstId, studyBurstId) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstId, studyBurstId)) &&
            (identical(other.studyBurstNum, studyBurstNum) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstNum, studyBurstNum)) &&
            (identical(other.timeWindowGuid, timeWindowGuid) ||
                const DeepCollectionEquality()
                    .equals(other.timeWindowGuid, timeWindowGuid)) &&
            (identical(other.assessments, assessments) ||
                const DeepCollectionEquality()
                    .equals(other.assessments, assessments)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(refGuid) ^
      const DeepCollectionEquality().hash(instanceGuid) ^
      const DeepCollectionEquality().hash(startEventId) ^
      const DeepCollectionEquality().hash(startDay) ^
      const DeepCollectionEquality().hash(endDay) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(delayTime) ^
      const DeepCollectionEquality().hash(expiration) ^
      const DeepCollectionEquality().hash(persistent) ^
      const DeepCollectionEquality().hash(studyBurstId) ^
      const DeepCollectionEquality().hash(studyBurstNum) ^
      const DeepCollectionEquality().hash(timeWindowGuid) ^
      const DeepCollectionEquality().hash(assessments) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduledSessionExtension on ScheduledSession {
  ScheduledSession copyWith(
      {String? refGuid,
      String? instanceGuid,
      String? startEventId,
      int? startDay,
      int? endDay,
      String? startTime,
      String? delayTime,
      String? expiration,
      bool? persistent,
      String? studyBurstId,
      int? studyBurstNum,
      String? timeWindowGuid,
      List<ScheduledAssessment>? assessments,
      String? type}) {
    return ScheduledSession(
        refGuid: refGuid ?? this.refGuid,
        instanceGuid: instanceGuid ?? this.instanceGuid,
        startEventId: startEventId ?? this.startEventId,
        startDay: startDay ?? this.startDay,
        endDay: endDay ?? this.endDay,
        startTime: startTime ?? this.startTime,
        delayTime: delayTime ?? this.delayTime,
        expiration: expiration ?? this.expiration,
        persistent: persistent ?? this.persistent,
        studyBurstId: studyBurstId ?? this.studyBurstId,
        studyBurstNum: studyBurstNum ?? this.studyBurstNum,
        timeWindowGuid: timeWindowGuid ?? this.timeWindowGuid,
        assessments: assessments ?? this.assessments,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SchedulePlan {
  SchedulePlan({
    this.guid,
    this.label,
    this.modifiedOn,
    this.deleted,
    this.strategy,
    this.version,
    this.type,
  });

  factory SchedulePlan.fromJson(Map<String, dynamic> json) =>
      _$SchedulePlanFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'strategy', includeIfNull: false)
  final ScheduleStrategy? strategy;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SchedulePlanFromJson;
  static const toJsonFactory = _$SchedulePlanToJson;
  Map<String, dynamic> toJson() => _$SchedulePlanToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SchedulePlan &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.strategy, strategy) ||
                const DeepCollectionEquality()
                    .equals(other.strategy, strategy)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(strategy) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SchedulePlanExtension on SchedulePlan {
  SchedulePlan copyWith(
      {String? guid,
      String? label,
      DateTime? modifiedOn,
      bool? deleted,
      ScheduleStrategy? strategy,
      num? version,
      String? type}) {
    return SchedulePlan(
        guid: guid ?? this.guid,
        label: label ?? this.label,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        deleted: deleted ?? this.deleted,
        strategy: strategy ?? this.strategy,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduleStrategy {
  ScheduleStrategy({
    this.type,
  });

  factory ScheduleStrategy.fromJson(Map<String, dynamic> json) =>
      _$ScheduleStrategyFromJson(json);

  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduleStrategyFromJson;
  static const toJsonFactory = _$ScheduleStrategyToJson;
  Map<String, dynamic> toJson() => _$ScheduleStrategyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduleStrategy &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^ runtimeType.hashCode;
}

extension $ScheduleStrategyExtension on ScheduleStrategy {
  ScheduleStrategy copyWith({String? type}) {
    return ScheduleStrategy(type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledActivity {
  ScheduledActivity({
    this.guid,
    this.schedulePlanGuid,
    this.startedOn,
    this.finishedOn,
    this.scheduledOn,
    this.expiresOn,
    this.activity,
    this.persistent,
    this.clientData,
    this.status,
    this.type,
  });

  factory ScheduledActivity.fromJson(Map<String, dynamic> json) =>
      _$ScheduledActivityFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'schedulePlanGuid', includeIfNull: false)
  final String? schedulePlanGuid;
  @JsonKey(name: 'startedOn', includeIfNull: false)
  final DateTime? startedOn;
  @JsonKey(name: 'finishedOn', includeIfNull: false)
  final DateTime? finishedOn;
  @JsonKey(name: 'scheduledOn', includeIfNull: false)
  final DateTime? scheduledOn;
  @JsonKey(name: 'expiresOn', includeIfNull: false)
  final DateTime? expiresOn;
  @JsonKey(name: 'activity', includeIfNull: false)
  final Activity? activity;
  @JsonKey(name: 'persistent', includeIfNull: false)
  final bool? persistent;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Object? clientData;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: scheduleStatusToJson,
      fromJson: scheduleStatusFromJson)
  final enums.ScheduleStatus? status;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduledActivityFromJson;
  static const toJsonFactory = _$ScheduledActivityToJson;
  Map<String, dynamic> toJson() => _$ScheduledActivityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduledActivity &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.schedulePlanGuid, schedulePlanGuid) ||
                const DeepCollectionEquality()
                    .equals(other.schedulePlanGuid, schedulePlanGuid)) &&
            (identical(other.startedOn, startedOn) ||
                const DeepCollectionEquality()
                    .equals(other.startedOn, startedOn)) &&
            (identical(other.finishedOn, finishedOn) ||
                const DeepCollectionEquality()
                    .equals(other.finishedOn, finishedOn)) &&
            (identical(other.scheduledOn, scheduledOn) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledOn, scheduledOn)) &&
            (identical(other.expiresOn, expiresOn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresOn, expiresOn)) &&
            (identical(other.activity, activity) ||
                const DeepCollectionEquality()
                    .equals(other.activity, activity)) &&
            (identical(other.persistent, persistent) ||
                const DeepCollectionEquality()
                    .equals(other.persistent, persistent)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(schedulePlanGuid) ^
      const DeepCollectionEquality().hash(startedOn) ^
      const DeepCollectionEquality().hash(finishedOn) ^
      const DeepCollectionEquality().hash(scheduledOn) ^
      const DeepCollectionEquality().hash(expiresOn) ^
      const DeepCollectionEquality().hash(activity) ^
      const DeepCollectionEquality().hash(persistent) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduledActivityExtension on ScheduledActivity {
  ScheduledActivity copyWith(
      {String? guid,
      String? schedulePlanGuid,
      DateTime? startedOn,
      DateTime? finishedOn,
      DateTime? scheduledOn,
      DateTime? expiresOn,
      Activity? activity,
      bool? persistent,
      Object? clientData,
      enums.ScheduleStatus? status,
      String? type}) {
    return ScheduledActivity(
        guid: guid ?? this.guid,
        schedulePlanGuid: schedulePlanGuid ?? this.schedulePlanGuid,
        startedOn: startedOn ?? this.startedOn,
        finishedOn: finishedOn ?? this.finishedOn,
        scheduledOn: scheduledOn ?? this.scheduledOn,
        expiresOn: expiresOn ?? this.expiresOn,
        activity: activity ?? this.activity,
        persistent: persistent ?? this.persistent,
        clientData: clientData ?? this.clientData,
        status: status ?? this.status,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SchemaReference {
  SchemaReference({
    this.id,
    this.revision,
    this.type,
  });

  factory SchemaReference.fromJson(Map<String, dynamic> json) =>
      _$SchemaReferenceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'revision', includeIfNull: false)
  final num? revision;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SchemaReferenceFromJson;
  static const toJsonFactory = _$SchemaReferenceToJson;
  Map<String, dynamic> toJson() => _$SchemaReferenceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SchemaReference &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SchemaReferenceExtension on SchemaReference {
  SchemaReference copyWith({String? id, num? revision, String? type}) {
    return SchemaReference(
        id: id ?? this.id,
        revision: revision ?? this.revision,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Session {
  Session({
    this.guid,
    this.name,
    this.symbol,
    this.labels,
    this.startEventIds,
    this.studyBurstIds,
    this.delay,
    this.interval,
    this.occurrences,
    this.performanceOrder,
    this.timeWindows,
    this.assessments,
    this.notifications,
    this.type,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'symbol', includeIfNull: false)
  final String? symbol;
  @JsonKey(name: 'labels', includeIfNull: false, defaultValue: <Label>[])
  final List<Label>? labels;
  @JsonKey(
      name: 'startEventIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? startEventIds;
  @JsonKey(
      name: 'studyBurstIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyBurstIds;
  @JsonKey(name: 'delay', includeIfNull: false)
  final String? delay;
  @JsonKey(name: 'interval', includeIfNull: false)
  final String? interval;
  @JsonKey(name: 'occurrences', includeIfNull: false)
  final int? occurrences;
  @JsonKey(
      name: 'performanceOrder',
      includeIfNull: false,
      toJson: performanceOrderToJson,
      fromJson: performanceOrderFromJson)
  final enums.PerformanceOrder? performanceOrder;
  @JsonKey(
      name: 'timeWindows', includeIfNull: false, defaultValue: <TimeWindow>[])
  final List<TimeWindow>? timeWindows;
  @JsonKey(
      name: 'assessments',
      includeIfNull: false,
      defaultValue: <AssessmentReference2>[])
  final List<AssessmentReference2>? assessments;
  @JsonKey(
      name: 'notifications',
      includeIfNull: false,
      defaultValue: <Notification>[])
  final List<Notification>? notifications;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SessionFromJson;
  static const toJsonFactory = _$SessionToJson;
  Map<String, dynamic> toJson() => _$SessionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Session &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)) &&
            (identical(other.labels, labels) ||
                const DeepCollectionEquality().equals(other.labels, labels)) &&
            (identical(other.startEventIds, startEventIds) ||
                const DeepCollectionEquality()
                    .equals(other.startEventIds, startEventIds)) &&
            (identical(other.studyBurstIds, studyBurstIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstIds, studyBurstIds)) &&
            (identical(other.delay, delay) ||
                const DeepCollectionEquality().equals(other.delay, delay)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.occurrences, occurrences) ||
                const DeepCollectionEquality()
                    .equals(other.occurrences, occurrences)) &&
            (identical(other.performanceOrder, performanceOrder) ||
                const DeepCollectionEquality()
                    .equals(other.performanceOrder, performanceOrder)) &&
            (identical(other.timeWindows, timeWindows) ||
                const DeepCollectionEquality()
                    .equals(other.timeWindows, timeWindows)) &&
            (identical(other.assessments, assessments) ||
                const DeepCollectionEquality()
                    .equals(other.assessments, assessments)) &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(symbol) ^
      const DeepCollectionEquality().hash(labels) ^
      const DeepCollectionEquality().hash(startEventIds) ^
      const DeepCollectionEquality().hash(studyBurstIds) ^
      const DeepCollectionEquality().hash(delay) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(occurrences) ^
      const DeepCollectionEquality().hash(performanceOrder) ^
      const DeepCollectionEquality().hash(timeWindows) ^
      const DeepCollectionEquality().hash(assessments) ^
      const DeepCollectionEquality().hash(notifications) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SessionExtension on Session {
  Session copyWith(
      {String? guid,
      String? name,
      String? symbol,
      List<Label>? labels,
      List<String>? startEventIds,
      List<String>? studyBurstIds,
      String? delay,
      String? interval,
      int? occurrences,
      enums.PerformanceOrder? performanceOrder,
      List<TimeWindow>? timeWindows,
      List<AssessmentReference2>? assessments,
      List<Notification>? notifications,
      String? type}) {
    return Session(
        guid: guid ?? this.guid,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        labels: labels ?? this.labels,
        startEventIds: startEventIds ?? this.startEventIds,
        studyBurstIds: studyBurstIds ?? this.studyBurstIds,
        delay: delay ?? this.delay,
        interval: interval ?? this.interval,
        occurrences: occurrences ?? this.occurrences,
        performanceOrder: performanceOrder ?? this.performanceOrder,
        timeWindows: timeWindows ?? this.timeWindows,
        assessments: assessments ?? this.assessments,
        notifications: notifications ?? this.notifications,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SessionInfo {
  SessionInfo({
    this.guid,
    this.label,
    this.symbol,
    this.performanceOrder,
    this.timeWindowGuids,
    this.minutesToComplete,
    this.notifications,
    this.type,
  });

  factory SessionInfo.fromJson(Map<String, dynamic> json) =>
      _$SessionInfoFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(name: 'symbol', includeIfNull: false)
  final String? symbol;
  @JsonKey(
      name: 'performanceOrder',
      includeIfNull: false,
      toJson: performanceOrderToJson,
      fromJson: performanceOrderFromJson)
  final enums.PerformanceOrder? performanceOrder;
  @JsonKey(
      name: 'timeWindowGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? timeWindowGuids;
  @JsonKey(name: 'minutesToComplete', includeIfNull: false)
  final int? minutesToComplete;
  @JsonKey(
      name: 'notifications',
      includeIfNull: false,
      defaultValue: <NotificationInfo>[])
  final List<NotificationInfo>? notifications;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SessionInfoFromJson;
  static const toJsonFactory = _$SessionInfoToJson;
  Map<String, dynamic> toJson() => _$SessionInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionInfo &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)) &&
            (identical(other.performanceOrder, performanceOrder) ||
                const DeepCollectionEquality()
                    .equals(other.performanceOrder, performanceOrder)) &&
            (identical(other.timeWindowGuids, timeWindowGuids) ||
                const DeepCollectionEquality()
                    .equals(other.timeWindowGuids, timeWindowGuids)) &&
            (identical(other.minutesToComplete, minutesToComplete) ||
                const DeepCollectionEquality()
                    .equals(other.minutesToComplete, minutesToComplete)) &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(symbol) ^
      const DeepCollectionEquality().hash(performanceOrder) ^
      const DeepCollectionEquality().hash(timeWindowGuids) ^
      const DeepCollectionEquality().hash(minutesToComplete) ^
      const DeepCollectionEquality().hash(notifications) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SessionInfoExtension on SessionInfo {
  SessionInfo copyWith(
      {String? guid,
      String? label,
      String? symbol,
      enums.PerformanceOrder? performanceOrder,
      List<String>? timeWindowGuids,
      int? minutesToComplete,
      List<NotificationInfo>? notifications,
      String? type}) {
    return SessionInfo(
        guid: guid ?? this.guid,
        label: label ?? this.label,
        symbol: symbol ?? this.symbol,
        performanceOrder: performanceOrder ?? this.performanceOrder,
        timeWindowGuids: timeWindowGuids ?? this.timeWindowGuids,
        minutesToComplete: minutesToComplete ?? this.minutesToComplete,
        notifications: notifications ?? this.notifications,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SharedModuleImportStatus {
  SharedModuleImportStatus({
    this.moduleType,
    this.schemaId,
    this.schemaRevision,
    this.surveyCreatedOn,
    this.surveyGuid,
    this.type,
  });

  factory SharedModuleImportStatus.fromJson(Map<String, dynamic> json) =>
      _$SharedModuleImportStatusFromJson(json);

  @JsonKey(
      name: 'moduleType',
      includeIfNull: false,
      toJson: sharedModuleTypeToJson,
      fromJson: sharedModuleTypeFromJson)
  final enums.SharedModuleType? moduleType;
  @JsonKey(name: 'schemaId', includeIfNull: false)
  final String? schemaId;
  @JsonKey(name: 'schemaRevision', includeIfNull: false)
  final int? schemaRevision;
  @JsonKey(name: 'surveyCreatedOn', includeIfNull: false)
  final String? surveyCreatedOn;
  @JsonKey(name: 'surveyGuid', includeIfNull: false)
  final String? surveyGuid;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SharedModuleImportStatusFromJson;
  static const toJsonFactory = _$SharedModuleImportStatusToJson;
  Map<String, dynamic> toJson() => _$SharedModuleImportStatusToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SharedModuleImportStatus &&
            (identical(other.moduleType, moduleType) ||
                const DeepCollectionEquality()
                    .equals(other.moduleType, moduleType)) &&
            (identical(other.schemaId, schemaId) ||
                const DeepCollectionEquality()
                    .equals(other.schemaId, schemaId)) &&
            (identical(other.schemaRevision, schemaRevision) ||
                const DeepCollectionEquality()
                    .equals(other.schemaRevision, schemaRevision)) &&
            (identical(other.surveyCreatedOn, surveyCreatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.surveyCreatedOn, surveyCreatedOn)) &&
            (identical(other.surveyGuid, surveyGuid) ||
                const DeepCollectionEquality()
                    .equals(other.surveyGuid, surveyGuid)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(moduleType) ^
      const DeepCollectionEquality().hash(schemaId) ^
      const DeepCollectionEquality().hash(schemaRevision) ^
      const DeepCollectionEquality().hash(surveyCreatedOn) ^
      const DeepCollectionEquality().hash(surveyGuid) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SharedModuleImportStatusExtension on SharedModuleImportStatus {
  SharedModuleImportStatus copyWith(
      {enums.SharedModuleType? moduleType,
      String? schemaId,
      int? schemaRevision,
      String? surveyCreatedOn,
      String? surveyGuid,
      String? type}) {
    return SharedModuleImportStatus(
        moduleType: moduleType ?? this.moduleType,
        schemaId: schemaId ?? this.schemaId,
        schemaRevision: schemaRevision ?? this.schemaRevision,
        surveyCreatedOn: surveyCreatedOn ?? this.surveyCreatedOn,
        surveyGuid: surveyGuid ?? this.surveyGuid,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SharedModuleMetadata {
  SharedModuleMetadata({
    this.id,
    this.licenseRestricted,
    this.moduleType,
    this.name,
    this.notes,
    this.os,
    this.published,
    this.schemaId,
    this.schemaRevision,
    this.surveyCreatedOn,
    this.surveyGuid,
    this.tags,
    this.deleted,
    this.version,
    this.type,
  });

  factory SharedModuleMetadata.fromJson(Map<String, dynamic> json) =>
      _$SharedModuleMetadataFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'licenseRestricted', includeIfNull: false)
  final bool? licenseRestricted;
  @JsonKey(
      name: 'moduleType',
      includeIfNull: false,
      toJson: sharedModuleTypeToJson,
      fromJson: sharedModuleTypeFromJson)
  final enums.SharedModuleType? moduleType;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'notes', includeIfNull: false)
  final String? notes;
  @JsonKey(name: 'os', includeIfNull: false)
  final String? os;
  @JsonKey(name: 'published', includeIfNull: false)
  final bool? published;
  @JsonKey(name: 'schemaId', includeIfNull: false)
  final String? schemaId;
  @JsonKey(name: 'schemaRevision', includeIfNull: false)
  final int? schemaRevision;
  @JsonKey(name: 'surveyCreatedOn', includeIfNull: false)
  final String? surveyCreatedOn;
  @JsonKey(name: 'surveyGuid', includeIfNull: false)
  final String? surveyGuid;
  @JsonKey(name: 'tags', includeIfNull: false, defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'version', includeIfNull: false)
  final int? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SharedModuleMetadataFromJson;
  static const toJsonFactory = _$SharedModuleMetadataToJson;
  Map<String, dynamic> toJson() => _$SharedModuleMetadataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SharedModuleMetadata &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.licenseRestricted, licenseRestricted) ||
                const DeepCollectionEquality()
                    .equals(other.licenseRestricted, licenseRestricted)) &&
            (identical(other.moduleType, moduleType) ||
                const DeepCollectionEquality()
                    .equals(other.moduleType, moduleType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.os, os) ||
                const DeepCollectionEquality().equals(other.os, os)) &&
            (identical(other.published, published) ||
                const DeepCollectionEquality()
                    .equals(other.published, published)) &&
            (identical(other.schemaId, schemaId) ||
                const DeepCollectionEquality()
                    .equals(other.schemaId, schemaId)) &&
            (identical(other.schemaRevision, schemaRevision) ||
                const DeepCollectionEquality()
                    .equals(other.schemaRevision, schemaRevision)) &&
            (identical(other.surveyCreatedOn, surveyCreatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.surveyCreatedOn, surveyCreatedOn)) &&
            (identical(other.surveyGuid, surveyGuid) ||
                const DeepCollectionEquality()
                    .equals(other.surveyGuid, surveyGuid)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(licenseRestricted) ^
      const DeepCollectionEquality().hash(moduleType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(os) ^
      const DeepCollectionEquality().hash(published) ^
      const DeepCollectionEquality().hash(schemaId) ^
      const DeepCollectionEquality().hash(schemaRevision) ^
      const DeepCollectionEquality().hash(surveyCreatedOn) ^
      const DeepCollectionEquality().hash(surveyGuid) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SharedModuleMetadataExtension on SharedModuleMetadata {
  SharedModuleMetadata copyWith(
      {String? id,
      bool? licenseRestricted,
      enums.SharedModuleType? moduleType,
      String? name,
      String? notes,
      String? os,
      bool? published,
      String? schemaId,
      int? schemaRevision,
      String? surveyCreatedOn,
      String? surveyGuid,
      List<String>? tags,
      bool? deleted,
      int? version,
      String? type}) {
    return SharedModuleMetadata(
        id: id ?? this.id,
        licenseRestricted: licenseRestricted ?? this.licenseRestricted,
        moduleType: moduleType ?? this.moduleType,
        name: name ?? this.name,
        notes: notes ?? this.notes,
        os: os ?? this.os,
        published: published ?? this.published,
        schemaId: schemaId ?? this.schemaId,
        schemaRevision: schemaRevision ?? this.schemaRevision,
        surveyCreatedOn: surveyCreatedOn ?? this.surveyCreatedOn,
        surveyGuid: surveyGuid ?? this.surveyGuid,
        tags: tags ?? this.tags,
        deleted: deleted ?? this.deleted,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SharingScopeForm {
  SharingScopeForm({
    this.scope,
    this.type,
  });

  factory SharingScopeForm.fromJson(Map<String, dynamic> json) =>
      _$SharingScopeFormFromJson(json);

  @JsonKey(
      name: 'scope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? scope;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SharingScopeFormFromJson;
  static const toJsonFactory = _$SharingScopeFormToJson;
  Map<String, dynamic> toJson() => _$SharingScopeFormToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SharingScopeForm &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SharingScopeFormExtension on SharingScopeForm {
  SharingScopeForm copyWith({enums.SharingScope? scope, String? type}) {
    return SharingScopeForm(
        scope: scope ?? this.scope, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SignIn {
  SignIn({
    this.appId,
    this.email,
    this.phone,
    this.externalId,
    this.password,
    this.reauthToken,
    this.type,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'externalId', includeIfNull: false)
  final String? externalId;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'reauthToken', includeIfNull: false)
  final String? reauthToken;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SignInFromJson;
  static const toJsonFactory = _$SignInToJson;
  Map<String, dynamic> toJson() => _$SignInToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignIn &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.reauthToken, reauthToken) ||
                const DeepCollectionEquality()
                    .equals(other.reauthToken, reauthToken)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(reauthToken) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SignInExtension on SignIn {
  SignIn copyWith(
      {String? appId,
      String? email,
      Phone? phone,
      String? externalId,
      String? password,
      String? reauthToken,
      String? type}) {
    return SignIn(
        appId: appId ?? this.appId,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        externalId: externalId ?? this.externalId,
        password: password ?? this.password,
        reauthToken: reauthToken ?? this.reauthToken,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SignUp {
  SignUp({
    this.appId,
    this.email,
    this.phone,
    this.externalId,
    this.password,
    this.consent,
    this.type,
    this.firstName,
    this.lastName,
    this.synapseUserId,
    this.id,
    this.notifyByEmail,
    this.attributes,
    this.sharingScope,
    this.createdOn,
    this.emailVerified,
    this.phoneVerified,
    this.status,
    this.roles,
    this.dataGroups,
    this.clientData,
    this.languages,
    this.studyIds,
    this.externalIds,
    this.orgMembership,
    this.note,
    this.clientTimeZone,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'externalId', includeIfNull: false)
  final String? externalId;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'consent', includeIfNull: false)
  final bool? consent;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'synapseUserId', includeIfNull: false)
  final String? synapseUserId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'notifyByEmail', includeIfNull: false, defaultValue: true)
  final bool? notifyByEmail;
  @JsonKey(name: 'attributes', includeIfNull: false)
  final Map<String, dynamic>? attributes;
  @JsonKey(
      name: 'sharingScope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? sharingScope;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'emailVerified', includeIfNull: false)
  final bool? emailVerified;
  @JsonKey(name: 'phoneVerified', includeIfNull: false)
  final bool? phoneVerified;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(
      name: 'roles',
      includeIfNull: false,
      toJson: roleListToJson,
      fromJson: roleListFromJson)
  final List<enums.Role>? roles;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Map<String, dynamic>? clientData;
  @JsonKey(name: 'languages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? languages;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'externalIds', includeIfNull: false)
  final Map<String, dynamic>? externalIds;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  static const fromJsonFactory = _$SignUpFromJson;
  static const toJsonFactory = _$SignUpToJson;
  Map<String, dynamic> toJson() => _$SignUpToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUp &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.consent, consent) ||
                const DeepCollectionEquality()
                    .equals(other.consent, consent)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.synapseUserId, synapseUserId) ||
                const DeepCollectionEquality()
                    .equals(other.synapseUserId, synapseUserId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.notifyByEmail, notifyByEmail) ||
                const DeepCollectionEquality()
                    .equals(other.notifyByEmail, notifyByEmail)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.sharingScope, sharingScope) ||
                const DeepCollectionEquality()
                    .equals(other.sharingScope, sharingScope)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.phoneVerified, phoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.phoneVerified, phoneVerified)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.externalIds, externalIds) ||
                const DeepCollectionEquality()
                    .equals(other.externalIds, externalIds)) &&
            (identical(other.orgMembership, orgMembership) ||
                const DeepCollectionEquality()
                    .equals(other.orgMembership, orgMembership)) &&
            (identical(other.note, note) || const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.clientTimeZone, clientTimeZone) || const DeepCollectionEquality().equals(other.clientTimeZone, clientTimeZone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(consent) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(synapseUserId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(notifyByEmail) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(sharingScope) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(phoneVerified) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(externalIds) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      runtimeType.hashCode;
}

extension $SignUpExtension on SignUp {
  SignUp copyWith(
      {String? appId,
      String? email,
      Phone? phone,
      String? externalId,
      String? password,
      bool? consent,
      String? type,
      String? firstName,
      String? lastName,
      String? synapseUserId,
      String? id,
      bool? notifyByEmail,
      Map<String, dynamic>? attributes,
      enums.SharingScope? sharingScope,
      DateTime? createdOn,
      bool? emailVerified,
      bool? phoneVerified,
      enums.AccountStatus? status,
      List<enums.Role>? roles,
      List<String>? dataGroups,
      Map<String, dynamic>? clientData,
      List<String>? languages,
      List<String>? studyIds,
      Map<String, dynamic>? externalIds,
      String? orgMembership,
      String? note,
      String? clientTimeZone}) {
    return SignUp(
        appId: appId ?? this.appId,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        externalId: externalId ?? this.externalId,
        password: password ?? this.password,
        consent: consent ?? this.consent,
        type: type ?? this.type,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        synapseUserId: synapseUserId ?? this.synapseUserId,
        id: id ?? this.id,
        notifyByEmail: notifyByEmail ?? this.notifyByEmail,
        attributes: attributes ?? this.attributes,
        sharingScope: sharingScope ?? this.sharingScope,
        createdOn: createdOn ?? this.createdOn,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneVerified: phoneVerified ?? this.phoneVerified,
        status: status ?? this.status,
        roles: roles ?? this.roles,
        dataGroups: dataGroups ?? this.dataGroups,
        clientData: clientData ?? this.clientData,
        languages: languages ?? this.languages,
        studyIds: studyIds ?? this.studyIds,
        externalIds: externalIds ?? this.externalIds,
        orgMembership: orgMembership ?? this.orgMembership,
        note: note ?? this.note,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone);
  }
}

@JsonSerializable(explicitToJson: true)
class SimpleScheduleStrategy {
  SimpleScheduleStrategy({
    this.schedule,
    this.type,
  });

  factory SimpleScheduleStrategy.fromJson(Map<String, dynamic> json) =>
      _$SimpleScheduleStrategyFromJson(json);

  @JsonKey(name: 'schedule', includeIfNull: false)
  final Schedule? schedule;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SimpleScheduleStrategyFromJson;
  static const toJsonFactory = _$SimpleScheduleStrategyToJson;
  Map<String, dynamic> toJson() => _$SimpleScheduleStrategyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SimpleScheduleStrategy &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SimpleScheduleStrategyExtension on SimpleScheduleStrategy {
  SimpleScheduleStrategy copyWith({Schedule? schedule, String? type}) {
    return SimpleScheduleStrategy(
        schedule: schedule ?? this.schedule, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SmsMessage {
  SmsMessage({
    this.phoneNumber,
    this.sentOn,
    this.healthCode,
    this.messageBody,
    this.messageId,
    this.smsType,
    this.appId,
    this.type,
  });

  factory SmsMessage.fromJson(Map<String, dynamic> json) =>
      _$SmsMessageFromJson(json);

  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'sentOn', includeIfNull: false)
  final DateTime? sentOn;
  @JsonKey(name: 'healthCode', includeIfNull: false)
  final String? healthCode;
  @JsonKey(name: 'messageBody', includeIfNull: false)
  final String? messageBody;
  @JsonKey(name: 'messageId', includeIfNull: false)
  final String? messageId;
  @JsonKey(
      name: 'smsType',
      includeIfNull: false,
      toJson: smsTypeToJson,
      fromJson: smsTypeFromJson)
  final enums.SmsType? smsType;
  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SmsMessageFromJson;
  static const toJsonFactory = _$SmsMessageToJson;
  Map<String, dynamic> toJson() => _$SmsMessageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SmsMessage &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.sentOn, sentOn) ||
                const DeepCollectionEquality().equals(other.sentOn, sentOn)) &&
            (identical(other.healthCode, healthCode) ||
                const DeepCollectionEquality()
                    .equals(other.healthCode, healthCode)) &&
            (identical(other.messageBody, messageBody) ||
                const DeepCollectionEquality()
                    .equals(other.messageBody, messageBody)) &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)) &&
            (identical(other.smsType, smsType) ||
                const DeepCollectionEquality()
                    .equals(other.smsType, smsType)) &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(sentOn) ^
      const DeepCollectionEquality().hash(healthCode) ^
      const DeepCollectionEquality().hash(messageBody) ^
      const DeepCollectionEquality().hash(messageId) ^
      const DeepCollectionEquality().hash(smsType) ^
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SmsMessageExtension on SmsMessage {
  SmsMessage copyWith(
      {String? phoneNumber,
      DateTime? sentOn,
      String? healthCode,
      String? messageBody,
      String? messageId,
      enums.SmsType? smsType,
      String? appId,
      String? type}) {
    return SmsMessage(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        sentOn: sentOn ?? this.sentOn,
        healthCode: healthCode ?? this.healthCode,
        messageBody: messageBody ?? this.messageBody,
        messageId: messageId ?? this.messageId,
        smsType: smsType ?? this.smsType,
        appId: appId ?? this.appId,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SmsTemplate {
  SmsTemplate({
    this.message,
    this.type,
  });

  factory SmsTemplate.fromJson(Map<String, dynamic> json) =>
      _$SmsTemplateFromJson(json);

  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SmsTemplateFromJson;
  static const toJsonFactory = _$SmsTemplateToJson;
  Map<String, dynamic> toJson() => _$SmsTemplateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SmsTemplate &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SmsTemplateExtension on SmsTemplate {
  SmsTemplate copyWith({String? message, String? type}) {
    return SmsTemplate(
        message: message ?? this.message, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyActivityEventRequest {
  StudyActivityEventRequest({
    this.eventId,
    this.timestamp,
    this.answerValue,
    this.clientTimeZone,
    this.type,
  });

  factory StudyActivityEventRequest.fromJson(Map<String, dynamic> json) =>
      _$StudyActivityEventRequestFromJson(json);

  @JsonKey(name: 'eventId', includeIfNull: false)
  final String? eventId;
  @JsonKey(name: 'timestamp', includeIfNull: false)
  final DateTime? timestamp;
  @JsonKey(name: 'answerValue', includeIfNull: false)
  final String? answerValue;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyActivityEventRequestFromJson;
  static const toJsonFactory = _$StudyActivityEventRequestToJson;
  Map<String, dynamic> toJson() => _$StudyActivityEventRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyActivityEventRequest &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.answerValue, answerValue) ||
                const DeepCollectionEquality()
                    .equals(other.answerValue, answerValue)) &&
            (identical(other.clientTimeZone, clientTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.clientTimeZone, clientTimeZone)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(answerValue) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyActivityEventRequestExtension on StudyActivityEventRequest {
  StudyActivityEventRequest copyWith(
      {String? eventId,
      DateTime? timestamp,
      String? answerValue,
      String? clientTimeZone,
      String? type}) {
    return StudyActivityEventRequest(
        eventId: eventId ?? this.eventId,
        timestamp: timestamp ?? this.timestamp,
        answerValue: answerValue ?? this.answerValue,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyBurst {
  StudyBurst({
    this.identifier,
    this.originEventId,
    this.delay,
    this.interval,
    this.occurrences,
    this.updateType,
    this.type,
  });

  factory StudyBurst.fromJson(Map<String, dynamic> json) =>
      _$StudyBurstFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'originEventId', includeIfNull: false)
  final String? originEventId;
  @JsonKey(name: 'delay', includeIfNull: false)
  final String? delay;
  @JsonKey(name: 'interval', includeIfNull: false)
  final String? interval;
  @JsonKey(name: 'occurrences', includeIfNull: false)
  final int? occurrences;
  @JsonKey(
      name: 'updateType',
      includeIfNull: false,
      toJson: activityEventUpdateTypeToJson,
      fromJson: activityEventUpdateTypeFromJson)
  final enums.ActivityEventUpdateType? updateType;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyBurstFromJson;
  static const toJsonFactory = _$StudyBurstToJson;
  Map<String, dynamic> toJson() => _$StudyBurstToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyBurst &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.originEventId, originEventId) ||
                const DeepCollectionEquality()
                    .equals(other.originEventId, originEventId)) &&
            (identical(other.delay, delay) ||
                const DeepCollectionEquality().equals(other.delay, delay)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.occurrences, occurrences) ||
                const DeepCollectionEquality()
                    .equals(other.occurrences, occurrences)) &&
            (identical(other.updateType, updateType) ||
                const DeepCollectionEquality()
                    .equals(other.updateType, updateType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(originEventId) ^
      const DeepCollectionEquality().hash(delay) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(occurrences) ^
      const DeepCollectionEquality().hash(updateType) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyBurstExtension on StudyBurst {
  StudyBurst copyWith(
      {String? identifier,
      String? originEventId,
      String? delay,
      String? interval,
      int? occurrences,
      enums.ActivityEventUpdateType? updateType,
      String? type}) {
    return StudyBurst(
        identifier: identifier ?? this.identifier,
        originEventId: originEventId ?? this.originEventId,
        delay: delay ?? this.delay,
        interval: interval ?? this.interval,
        occurrences: occurrences ?? this.occurrences,
        updateType: updateType ?? this.updateType,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyBurstInfo {
  StudyBurstInfo({
    this.identifier,
    this.originEventId,
    this.delay,
    this.interval,
    this.occurrences,
    this.type,
  });

  factory StudyBurstInfo.fromJson(Map<String, dynamic> json) =>
      _$StudyBurstInfoFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'originEventId', includeIfNull: false)
  final String? originEventId;
  @JsonKey(name: 'delay', includeIfNull: false)
  final String? delay;
  @JsonKey(name: 'interval', includeIfNull: false)
  final String? interval;
  @JsonKey(name: 'occurrences', includeIfNull: false)
  final int? occurrences;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyBurstInfoFromJson;
  static const toJsonFactory = _$StudyBurstInfoToJson;
  Map<String, dynamic> toJson() => _$StudyBurstInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyBurstInfo &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.originEventId, originEventId) ||
                const DeepCollectionEquality()
                    .equals(other.originEventId, originEventId)) &&
            (identical(other.delay, delay) ||
                const DeepCollectionEquality().equals(other.delay, delay)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.occurrences, occurrences) ||
                const DeepCollectionEquality()
                    .equals(other.occurrences, occurrences)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(originEventId) ^
      const DeepCollectionEquality().hash(delay) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(occurrences) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyBurstInfoExtension on StudyBurstInfo {
  StudyBurstInfo copyWith(
      {String? identifier,
      String? originEventId,
      String? delay,
      String? interval,
      int? occurrences,
      String? type}) {
    return StudyBurstInfo(
        identifier: identifier ?? this.identifier,
        originEventId: originEventId ?? this.originEventId,
        delay: delay ?? this.delay,
        interval: interval ?? this.interval,
        occurrences: occurrences ?? this.occurrences,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyConsent {
  StudyConsent({
    this.subpopulationGuid,
    this.createdOn,
    this.documentContent,
    this.type,
  });

  factory StudyConsent.fromJson(Map<String, dynamic> json) =>
      _$StudyConsentFromJson(json);

  @JsonKey(name: 'subpopulationGuid', includeIfNull: false)
  final String? subpopulationGuid;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'documentContent', includeIfNull: false)
  final String? documentContent;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyConsentFromJson;
  static const toJsonFactory = _$StudyConsentToJson;
  Map<String, dynamic> toJson() => _$StudyConsentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyConsent &&
            (identical(other.subpopulationGuid, subpopulationGuid) ||
                const DeepCollectionEquality()
                    .equals(other.subpopulationGuid, subpopulationGuid)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.documentContent, documentContent) ||
                const DeepCollectionEquality()
                    .equals(other.documentContent, documentContent)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(subpopulationGuid) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(documentContent) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyConsentExtension on StudyConsent {
  StudyConsent copyWith(
      {String? subpopulationGuid,
      DateTime? createdOn,
      String? documentContent,
      String? type}) {
    return StudyConsent(
        subpopulationGuid: subpopulationGuid ?? this.subpopulationGuid,
        createdOn: createdOn ?? this.createdOn,
        documentContent: documentContent ?? this.documentContent,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyParticipant {
  StudyParticipant({
    this.healthCode,
    this.email,
    this.phone,
    this.consentHistories,
    this.enrollments,
    this.consented,
    this.timeZone,
    this.type,
    this.firstName,
    this.lastName,
    this.synapseUserId,
    this.id,
    this.notifyByEmail,
    this.attributes,
    this.sharingScope,
    this.createdOn,
    this.emailVerified,
    this.phoneVerified,
    this.status,
    this.roles,
    this.dataGroups,
    this.clientData,
    this.languages,
    this.studyIds,
    this.externalIds,
    this.orgMembership,
    this.note,
    this.clientTimeZone,
  });

  factory StudyParticipant.fromJson(Map<String, dynamic> json) =>
      _$StudyParticipantFromJson(json);

  @JsonKey(name: 'healthCode', includeIfNull: false)
  final String? healthCode;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'consentHistories', includeIfNull: false)
  final Map<String, dynamic>? consentHistories;
  @JsonKey(name: 'enrollments', includeIfNull: false)
  final Map<String, dynamic>? enrollments;
  @JsonKey(name: 'consented', includeIfNull: false)
  final bool? consented;
  @JsonKey(name: 'timeZone', includeIfNull: false)
  final String? timeZone;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'synapseUserId', includeIfNull: false)
  final String? synapseUserId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'notifyByEmail', includeIfNull: false, defaultValue: true)
  final bool? notifyByEmail;
  @JsonKey(name: 'attributes', includeIfNull: false)
  final Map<String, dynamic>? attributes;
  @JsonKey(
      name: 'sharingScope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? sharingScope;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'emailVerified', includeIfNull: false)
  final bool? emailVerified;
  @JsonKey(name: 'phoneVerified', includeIfNull: false)
  final bool? phoneVerified;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(
      name: 'roles',
      includeIfNull: false,
      toJson: roleListToJson,
      fromJson: roleListFromJson)
  final List<enums.Role>? roles;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Map<String, dynamic>? clientData;
  @JsonKey(name: 'languages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? languages;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'externalIds', includeIfNull: false)
  final Map<String, dynamic>? externalIds;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  static const fromJsonFactory = _$StudyParticipantFromJson;
  static const toJsonFactory = _$StudyParticipantToJson;
  Map<String, dynamic> toJson() => _$StudyParticipantToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyParticipant &&
            (identical(other.healthCode, healthCode) ||
                const DeepCollectionEquality()
                    .equals(other.healthCode, healthCode)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.consentHistories, consentHistories) ||
                const DeepCollectionEquality()
                    .equals(other.consentHistories, consentHistories)) &&
            (identical(other.enrollments, enrollments) ||
                const DeepCollectionEquality()
                    .equals(other.enrollments, enrollments)) &&
            (identical(other.consented, consented) ||
                const DeepCollectionEquality()
                    .equals(other.consented, consented)) &&
            (identical(other.timeZone, timeZone) ||
                const DeepCollectionEquality()
                    .equals(other.timeZone, timeZone)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.synapseUserId, synapseUserId) ||
                const DeepCollectionEquality()
                    .equals(other.synapseUserId, synapseUserId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.notifyByEmail, notifyByEmail) ||
                const DeepCollectionEquality()
                    .equals(other.notifyByEmail, notifyByEmail)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.sharingScope, sharingScope) ||
                const DeepCollectionEquality()
                    .equals(other.sharingScope, sharingScope)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.phoneVerified, phoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.phoneVerified, phoneVerified)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.externalIds, externalIds) ||
                const DeepCollectionEquality().equals(other.externalIds, externalIds)) &&
            (identical(other.orgMembership, orgMembership) || const DeepCollectionEquality().equals(other.orgMembership, orgMembership)) &&
            (identical(other.note, note) || const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.clientTimeZone, clientTimeZone) || const DeepCollectionEquality().equals(other.clientTimeZone, clientTimeZone)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(healthCode) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(consentHistories) ^
      const DeepCollectionEquality().hash(enrollments) ^
      const DeepCollectionEquality().hash(consented) ^
      const DeepCollectionEquality().hash(timeZone) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(synapseUserId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(notifyByEmail) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(sharingScope) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(phoneVerified) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(externalIds) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      runtimeType.hashCode;
}

extension $StudyParticipantExtension on StudyParticipant {
  StudyParticipant copyWith(
      {String? healthCode,
      String? email,
      Phone? phone,
      Map<String, dynamic>? consentHistories,
      Map<String, dynamic>? enrollments,
      bool? consented,
      String? timeZone,
      String? type,
      String? firstName,
      String? lastName,
      String? synapseUserId,
      String? id,
      bool? notifyByEmail,
      Map<String, dynamic>? attributes,
      enums.SharingScope? sharingScope,
      DateTime? createdOn,
      bool? emailVerified,
      bool? phoneVerified,
      enums.AccountStatus? status,
      List<enums.Role>? roles,
      List<String>? dataGroups,
      Map<String, dynamic>? clientData,
      List<String>? languages,
      List<String>? studyIds,
      Map<String, dynamic>? externalIds,
      String? orgMembership,
      String? note,
      String? clientTimeZone}) {
    return StudyParticipant(
        healthCode: healthCode ?? this.healthCode,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        consentHistories: consentHistories ?? this.consentHistories,
        enrollments: enrollments ?? this.enrollments,
        consented: consented ?? this.consented,
        timeZone: timeZone ?? this.timeZone,
        type: type ?? this.type,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        synapseUserId: synapseUserId ?? this.synapseUserId,
        id: id ?? this.id,
        notifyByEmail: notifyByEmail ?? this.notifyByEmail,
        attributes: attributes ?? this.attributes,
        sharingScope: sharingScope ?? this.sharingScope,
        createdOn: createdOn ?? this.createdOn,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneVerified: phoneVerified ?? this.phoneVerified,
        status: status ?? this.status,
        roles: roles ?? this.roles,
        dataGroups: dataGroups ?? this.dataGroups,
        clientData: clientData ?? this.clientData,
        languages: languages ?? this.languages,
        studyIds: studyIds ?? this.studyIds,
        externalIds: externalIds ?? this.externalIds,
        orgMembership: orgMembership ?? this.orgMembership,
        note: note ?? this.note,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone);
  }
}

@JsonSerializable(explicitToJson: true)
class Subpopulation {
  Subpopulation({
    this.guid,
    this.name,
    this.description,
    this.criteria,
    this.autoSendConsentSuppressed,
    this.required,
    this.defaultGroup,
    this.publishedConsentCreatedOn,
    this.dataGroupsAssignedWhileConsented,
    this.studyIdsAssignedOnConsent,
    this.version,
    this.consentHTML,
    this.consentPDF,
    this.type,
  });

  factory Subpopulation.fromJson(Map<String, dynamic> json) =>
      _$SubpopulationFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'criteria', includeIfNull: false)
  final Criteria? criteria;
  @JsonKey(
      name: 'autoSendConsentSuppressed',
      includeIfNull: false,
      defaultValue: false)
  final bool? autoSendConsentSuppressed;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'defaultGroup', includeIfNull: false)
  final bool? defaultGroup;
  @JsonKey(name: 'publishedConsentCreatedOn', includeIfNull: false)
  final DateTime? publishedConsentCreatedOn;
  @JsonKey(
      name: 'dataGroupsAssignedWhileConsented',
      includeIfNull: false,
      defaultValue: <String>[])
  final List<String>? dataGroupsAssignedWhileConsented;
  @JsonKey(
      name: 'studyIdsAssignedOnConsent',
      includeIfNull: false,
      defaultValue: <String>[])
  final List<String>? studyIdsAssignedOnConsent;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'consentHTML', includeIfNull: false)
  final String? consentHTML;
  @JsonKey(name: 'consentPDF', includeIfNull: false)
  final String? consentPDF;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SubpopulationFromJson;
  static const toJsonFactory = _$SubpopulationToJson;
  Map<String, dynamic> toJson() => _$SubpopulationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Subpopulation &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.criteria, criteria) ||
                const DeepCollectionEquality()
                    .equals(other.criteria, criteria)) &&
            (identical(other.autoSendConsentSuppressed, autoSendConsentSuppressed) ||
                const DeepCollectionEquality().equals(
                    other.autoSendConsentSuppressed,
                    autoSendConsentSuppressed)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.defaultGroup, defaultGroup) ||
                const DeepCollectionEquality()
                    .equals(other.defaultGroup, defaultGroup)) &&
            (identical(other.publishedConsentCreatedOn, publishedConsentCreatedOn) ||
                const DeepCollectionEquality().equals(
                    other.publishedConsentCreatedOn,
                    publishedConsentCreatedOn)) &&
            (identical(other.dataGroupsAssignedWhileConsented, dataGroupsAssignedWhileConsented) ||
                const DeepCollectionEquality().equals(
                    other.dataGroupsAssignedWhileConsented,
                    dataGroupsAssignedWhileConsented)) &&
            (identical(other.studyIdsAssignedOnConsent, studyIdsAssignedOnConsent) ||
                const DeepCollectionEquality().equals(
                    other.studyIdsAssignedOnConsent,
                    studyIdsAssignedOnConsent)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.consentHTML, consentHTML) ||
                const DeepCollectionEquality()
                    .equals(other.consentHTML, consentHTML)) &&
            (identical(other.consentPDF, consentPDF) ||
                const DeepCollectionEquality()
                    .equals(other.consentPDF, consentPDF)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(criteria) ^
      const DeepCollectionEquality().hash(autoSendConsentSuppressed) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(defaultGroup) ^
      const DeepCollectionEquality().hash(publishedConsentCreatedOn) ^
      const DeepCollectionEquality().hash(dataGroupsAssignedWhileConsented) ^
      const DeepCollectionEquality().hash(studyIdsAssignedOnConsent) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(consentHTML) ^
      const DeepCollectionEquality().hash(consentPDF) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SubpopulationExtension on Subpopulation {
  Subpopulation copyWith(
      {String? guid,
      String? name,
      String? description,
      Criteria? criteria,
      bool? autoSendConsentSuppressed,
      bool? required,
      bool? defaultGroup,
      DateTime? publishedConsentCreatedOn,
      List<String>? dataGroupsAssignedWhileConsented,
      List<String>? studyIdsAssignedOnConsent,
      num? version,
      String? consentHTML,
      String? consentPDF,
      String? type}) {
    return Subpopulation(
        guid: guid ?? this.guid,
        name: name ?? this.name,
        description: description ?? this.description,
        criteria: criteria ?? this.criteria,
        autoSendConsentSuppressed:
            autoSendConsentSuppressed ?? this.autoSendConsentSuppressed,
        required: required ?? this.required,
        defaultGroup: defaultGroup ?? this.defaultGroup,
        publishedConsentCreatedOn:
            publishedConsentCreatedOn ?? this.publishedConsentCreatedOn,
        dataGroupsAssignedWhileConsented: dataGroupsAssignedWhileConsented ??
            this.dataGroupsAssignedWhileConsented,
        studyIdsAssignedOnConsent:
            studyIdsAssignedOnConsent ?? this.studyIdsAssignedOnConsent,
        version: version ?? this.version,
        consentHTML: consentHTML ?? this.consentHTML,
        consentPDF: consentPDF ?? this.consentPDF,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionRequest {
  SubscriptionRequest({
    this.topicGuids,
    this.type,
  });

  factory SubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionRequestFromJson(json);

  @JsonKey(name: 'topicGuids', includeIfNull: false, defaultValue: <String>[])
  final List<String>? topicGuids;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SubscriptionRequestFromJson;
  static const toJsonFactory = _$SubscriptionRequestToJson;
  Map<String, dynamic> toJson() => _$SubscriptionRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionRequest &&
            (identical(other.topicGuids, topicGuids) ||
                const DeepCollectionEquality()
                    .equals(other.topicGuids, topicGuids)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(topicGuids) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SubscriptionRequestExtension on SubscriptionRequest {
  SubscriptionRequest copyWith({List<String>? topicGuids, String? type}) {
    return SubscriptionRequest(
        topicGuids: topicGuids ?? this.topicGuids, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionStatus {
  SubscriptionStatus({
    this.topicGuid,
    this.topicName,
    this.subscribed,
    this.type,
  });

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStatusFromJson(json);

  @JsonKey(name: 'topicGuid', includeIfNull: false)
  final String? topicGuid;
  @JsonKey(name: 'topicName', includeIfNull: false)
  final String? topicName;
  @JsonKey(name: 'subscribed', includeIfNull: false)
  final bool? subscribed;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SubscriptionStatusFromJson;
  static const toJsonFactory = _$SubscriptionStatusToJson;
  Map<String, dynamic> toJson() => _$SubscriptionStatusToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionStatus &&
            (identical(other.topicGuid, topicGuid) ||
                const DeepCollectionEquality()
                    .equals(other.topicGuid, topicGuid)) &&
            (identical(other.topicName, topicName) ||
                const DeepCollectionEquality()
                    .equals(other.topicName, topicName)) &&
            (identical(other.subscribed, subscribed) ||
                const DeepCollectionEquality()
                    .equals(other.subscribed, subscribed)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(topicGuid) ^
      const DeepCollectionEquality().hash(topicName) ^
      const DeepCollectionEquality().hash(subscribed) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SubscriptionStatusExtension on SubscriptionStatus {
  SubscriptionStatus copyWith(
      {String? topicGuid, String? topicName, bool? subscribed, String? type}) {
    return SubscriptionStatus(
        topicGuid: topicGuid ?? this.topicGuid,
        topicName: topicName ?? this.topicName,
        subscribed: subscribed ?? this.subscribed,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Study {
  Study({
    this.identifier,
    this.name,
    this.details,
    this.phase,
    this.clientData,
    this.studyTimeZone,
    this.adherenceThresholdPercentage,
    this.irbName,
    this.irbDecisionOn,
    this.irbExpiresOn,
    this.irbDecisionType,
    this.irbProtocolName,
    this.irbProtocolId,
    this.studyLogoUrl,
    this.colorScheme,
    this.institutionId,
    this.scheduleGuid,
    this.keywords,
    this.diseases,
    this.studyDesignTypes,
    this.signInTypes,
    this.contacts,
    this.customEvents,
    this.deleted,
    this.createdOn,
    this.modifiedOn,
    this.version,
    this.type,
  });

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'details', includeIfNull: false)
  final String? details;
  @JsonKey(
      name: 'phase',
      includeIfNull: false,
      toJson: studyPhaseToJson,
      fromJson: studyPhaseFromJson)
  final enums.StudyPhase? phase;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Map<String, dynamic>? clientData;
  @JsonKey(name: 'studyTimeZone', includeIfNull: false)
  final String? studyTimeZone;
  @JsonKey(name: 'adherenceThresholdPercentage', includeIfNull: false)
  final int? adherenceThresholdPercentage;
  @JsonKey(name: 'irbName', includeIfNull: false)
  final String? irbName;
  @JsonKey(name: 'irbDecisionOn', includeIfNull: false, toJson: _dateToJson)
  final DateTime? irbDecisionOn;
  @JsonKey(name: 'irbExpiresOn', includeIfNull: false, toJson: _dateToJson)
  final DateTime? irbExpiresOn;
  @JsonKey(
      name: 'irbDecisionType',
      includeIfNull: false,
      toJson: irbDecisionTypeToJson,
      fromJson: irbDecisionTypeFromJson)
  final enums.IrbDecisionType? irbDecisionType;
  @JsonKey(name: 'irbProtocolName', includeIfNull: false)
  final String? irbProtocolName;
  @JsonKey(name: 'irbProtocolId', includeIfNull: false)
  final String? irbProtocolId;
  @JsonKey(name: 'studyLogoUrl', includeIfNull: false)
  final String? studyLogoUrl;
  @JsonKey(name: 'colorScheme', includeIfNull: false)
  final ColorScheme? colorScheme;
  @JsonKey(name: 'institutionId', includeIfNull: false)
  final String? institutionId;
  @JsonKey(name: 'scheduleGuid', includeIfNull: false)
  final String? scheduleGuid;
  @JsonKey(name: 'keywords', includeIfNull: false)
  final String? keywords;
  @JsonKey(name: 'diseases', includeIfNull: false, defaultValue: <String>[])
  final List<String>? diseases;
  @JsonKey(
      name: 'studyDesignTypes', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyDesignTypes;
  @JsonKey(
      name: 'signInTypes',
      includeIfNull: false,
      toJson: signInTypeListToJson,
      fromJson: signInTypeListFromJson)
  final List<enums.SignInType>? signInTypes;
  @JsonKey(name: 'contacts', includeIfNull: false, defaultValue: <Contact>[])
  final List<Contact>? contacts;
  @JsonKey(
      name: 'customEvents', includeIfNull: false, defaultValue: <CustomEvent>[])
  final List<CustomEvent>? customEvents;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyFromJson;
  static const toJsonFactory = _$StudyToJson;
  Map<String, dynamic> toJson() => _$StudyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Study &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.phase, phase) ||
                const DeepCollectionEquality().equals(other.phase, phase)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.studyTimeZone, studyTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.studyTimeZone, studyTimeZone)) &&
            (identical(other.adherenceThresholdPercentage, adherenceThresholdPercentage) ||
                const DeepCollectionEquality().equals(
                    other.adherenceThresholdPercentage,
                    adherenceThresholdPercentage)) &&
            (identical(other.irbName, irbName) ||
                const DeepCollectionEquality()
                    .equals(other.irbName, irbName)) &&
            (identical(other.irbDecisionOn, irbDecisionOn) ||
                const DeepCollectionEquality()
                    .equals(other.irbDecisionOn, irbDecisionOn)) &&
            (identical(other.irbExpiresOn, irbExpiresOn) ||
                const DeepCollectionEquality()
                    .equals(other.irbExpiresOn, irbExpiresOn)) &&
            (identical(other.irbDecisionType, irbDecisionType) ||
                const DeepCollectionEquality()
                    .equals(other.irbDecisionType, irbDecisionType)) &&
            (identical(other.irbProtocolName, irbProtocolName) ||
                const DeepCollectionEquality()
                    .equals(other.irbProtocolName, irbProtocolName)) &&
            (identical(other.irbProtocolId, irbProtocolId) ||
                const DeepCollectionEquality()
                    .equals(other.irbProtocolId, irbProtocolId)) &&
            (identical(other.studyLogoUrl, studyLogoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.studyLogoUrl, studyLogoUrl)) &&
            (identical(other.colorScheme, colorScheme) ||
                const DeepCollectionEquality()
                    .equals(other.colorScheme, colorScheme)) &&
            (identical(other.institutionId, institutionId) ||
                const DeepCollectionEquality()
                    .equals(other.institutionId, institutionId)) &&
            (identical(other.scheduleGuid, scheduleGuid) ||
                const DeepCollectionEquality()
                    .equals(other.scheduleGuid, scheduleGuid)) &&
            (identical(other.keywords, keywords) ||
                const DeepCollectionEquality()
                    .equals(other.keywords, keywords)) &&
            (identical(other.diseases, diseases) ||
                const DeepCollectionEquality().equals(other.diseases, diseases)) &&
            (identical(other.studyDesignTypes, studyDesignTypes) || const DeepCollectionEquality().equals(other.studyDesignTypes, studyDesignTypes)) &&
            (identical(other.signInTypes, signInTypes) || const DeepCollectionEquality().equals(other.signInTypes, signInTypes)) &&
            (identical(other.contacts, contacts) || const DeepCollectionEquality().equals(other.contacts, contacts)) &&
            (identical(other.customEvents, customEvents) || const DeepCollectionEquality().equals(other.customEvents, customEvents)) &&
            (identical(other.deleted, deleted) || const DeepCollectionEquality().equals(other.deleted, deleted)) &&
            (identical(other.createdOn, createdOn) || const DeepCollectionEquality().equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) || const DeepCollectionEquality().equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.version, version) || const DeepCollectionEquality().equals(other.version, version)) &&
            (identical(other.type, type) || const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(phase) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(studyTimeZone) ^
      const DeepCollectionEquality().hash(adherenceThresholdPercentage) ^
      const DeepCollectionEquality().hash(irbName) ^
      const DeepCollectionEquality().hash(irbDecisionOn) ^
      const DeepCollectionEquality().hash(irbExpiresOn) ^
      const DeepCollectionEquality().hash(irbDecisionType) ^
      const DeepCollectionEquality().hash(irbProtocolName) ^
      const DeepCollectionEquality().hash(irbProtocolId) ^
      const DeepCollectionEquality().hash(studyLogoUrl) ^
      const DeepCollectionEquality().hash(colorScheme) ^
      const DeepCollectionEquality().hash(institutionId) ^
      const DeepCollectionEquality().hash(scheduleGuid) ^
      const DeepCollectionEquality().hash(keywords) ^
      const DeepCollectionEquality().hash(diseases) ^
      const DeepCollectionEquality().hash(studyDesignTypes) ^
      const DeepCollectionEquality().hash(signInTypes) ^
      const DeepCollectionEquality().hash(contacts) ^
      const DeepCollectionEquality().hash(customEvents) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyExtension on Study {
  Study copyWith(
      {String? identifier,
      String? name,
      String? details,
      enums.StudyPhase? phase,
      Map<String, dynamic>? clientData,
      String? studyTimeZone,
      int? adherenceThresholdPercentage,
      String? irbName,
      DateTime? irbDecisionOn,
      DateTime? irbExpiresOn,
      enums.IrbDecisionType? irbDecisionType,
      String? irbProtocolName,
      String? irbProtocolId,
      String? studyLogoUrl,
      ColorScheme? colorScheme,
      String? institutionId,
      String? scheduleGuid,
      String? keywords,
      List<String>? diseases,
      List<String>? studyDesignTypes,
      List<enums.SignInType>? signInTypes,
      List<Contact>? contacts,
      List<CustomEvent>? customEvents,
      bool? deleted,
      DateTime? createdOn,
      DateTime? modifiedOn,
      num? version,
      String? type}) {
    return Study(
        identifier: identifier ?? this.identifier,
        name: name ?? this.name,
        details: details ?? this.details,
        phase: phase ?? this.phase,
        clientData: clientData ?? this.clientData,
        studyTimeZone: studyTimeZone ?? this.studyTimeZone,
        adherenceThresholdPercentage:
            adherenceThresholdPercentage ?? this.adherenceThresholdPercentage,
        irbName: irbName ?? this.irbName,
        irbDecisionOn: irbDecisionOn ?? this.irbDecisionOn,
        irbExpiresOn: irbExpiresOn ?? this.irbExpiresOn,
        irbDecisionType: irbDecisionType ?? this.irbDecisionType,
        irbProtocolName: irbProtocolName ?? this.irbProtocolName,
        irbProtocolId: irbProtocolId ?? this.irbProtocolId,
        studyLogoUrl: studyLogoUrl ?? this.studyLogoUrl,
        colorScheme: colorScheme ?? this.colorScheme,
        institutionId: institutionId ?? this.institutionId,
        scheduleGuid: scheduleGuid ?? this.scheduleGuid,
        keywords: keywords ?? this.keywords,
        diseases: diseases ?? this.diseases,
        studyDesignTypes: studyDesignTypes ?? this.studyDesignTypes,
        signInTypes: signInTypes ?? this.signInTypes,
        contacts: contacts ?? this.contacts,
        customEvents: customEvents ?? this.customEvents,
        deleted: deleted ?? this.deleted,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyActivityEvent {
  StudyActivityEvent({
    this.eventId,
    this.answerValue,
    this.timestamp,
    this.updateType,
    this.clientTimeZone,
    this.originEventId,
    this.studyBurstId,
    this.periodFromOrigin,
    this.recordCount,
    this.createdOn,
    this.type,
  });

  factory StudyActivityEvent.fromJson(Map<String, dynamic> json) =>
      _$StudyActivityEventFromJson(json);

  @JsonKey(name: 'eventId', includeIfNull: false)
  final String? eventId;
  @JsonKey(name: 'answerValue', includeIfNull: false)
  final String? answerValue;
  @JsonKey(name: 'timestamp', includeIfNull: false)
  final DateTime? timestamp;
  @JsonKey(
      name: 'updateType',
      includeIfNull: false,
      toJson: activityEventUpdateTypeToJson,
      fromJson: activityEventUpdateTypeFromJson)
  final enums.ActivityEventUpdateType? updateType;
  @JsonKey(name: 'clientTimeZone', includeIfNull: false)
  final String? clientTimeZone;
  @JsonKey(name: 'originEventId', includeIfNull: false)
  final String? originEventId;
  @JsonKey(name: 'studyBurstId', includeIfNull: false)
  final String? studyBurstId;
  @JsonKey(name: 'periodFromOrigin', includeIfNull: false)
  final String? periodFromOrigin;
  @JsonKey(name: 'recordCount', includeIfNull: false)
  final int? recordCount;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyActivityEventFromJson;
  static const toJsonFactory = _$StudyActivityEventToJson;
  Map<String, dynamic> toJson() => _$StudyActivityEventToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyActivityEvent &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.answerValue, answerValue) ||
                const DeepCollectionEquality()
                    .equals(other.answerValue, answerValue)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.updateType, updateType) ||
                const DeepCollectionEquality()
                    .equals(other.updateType, updateType)) &&
            (identical(other.clientTimeZone, clientTimeZone) ||
                const DeepCollectionEquality()
                    .equals(other.clientTimeZone, clientTimeZone)) &&
            (identical(other.originEventId, originEventId) ||
                const DeepCollectionEquality()
                    .equals(other.originEventId, originEventId)) &&
            (identical(other.studyBurstId, studyBurstId) ||
                const DeepCollectionEquality()
                    .equals(other.studyBurstId, studyBurstId)) &&
            (identical(other.periodFromOrigin, periodFromOrigin) ||
                const DeepCollectionEquality()
                    .equals(other.periodFromOrigin, periodFromOrigin)) &&
            (identical(other.recordCount, recordCount) ||
                const DeepCollectionEquality()
                    .equals(other.recordCount, recordCount)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(answerValue) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(updateType) ^
      const DeepCollectionEquality().hash(clientTimeZone) ^
      const DeepCollectionEquality().hash(originEventId) ^
      const DeepCollectionEquality().hash(studyBurstId) ^
      const DeepCollectionEquality().hash(periodFromOrigin) ^
      const DeepCollectionEquality().hash(recordCount) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyActivityEventExtension on StudyActivityEvent {
  StudyActivityEvent copyWith(
      {String? eventId,
      String? answerValue,
      DateTime? timestamp,
      enums.ActivityEventUpdateType? updateType,
      String? clientTimeZone,
      String? originEventId,
      String? studyBurstId,
      String? periodFromOrigin,
      int? recordCount,
      DateTime? createdOn,
      String? type}) {
    return StudyActivityEvent(
        eventId: eventId ?? this.eventId,
        answerValue: answerValue ?? this.answerValue,
        timestamp: timestamp ?? this.timestamp,
        updateType: updateType ?? this.updateType,
        clientTimeZone: clientTimeZone ?? this.clientTimeZone,
        originEventId: originEventId ?? this.originEventId,
        studyBurstId: studyBurstId ?? this.studyBurstId,
        periodFromOrigin: periodFromOrigin ?? this.periodFromOrigin,
        recordCount: recordCount ?? this.recordCount,
        createdOn: createdOn ?? this.createdOn,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyInfo {
  StudyInfo({
    this.identifier,
    this.name,
    this.details,
    this.phase,
    this.studyLogoUrl,
    this.colorScheme,
    this.signInTypes,
    this.type,
  });

  factory StudyInfo.fromJson(Map<String, dynamic> json) =>
      _$StudyInfoFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'details', includeIfNull: false)
  final String? details;
  @JsonKey(
      name: 'phase',
      includeIfNull: false,
      toJson: studyPhaseToJson,
      fromJson: studyPhaseFromJson)
  final enums.StudyPhase? phase;
  @JsonKey(name: 'studyLogoUrl', includeIfNull: false)
  final String? studyLogoUrl;
  @JsonKey(name: 'colorScheme', includeIfNull: false)
  final ColorScheme? colorScheme;
  @JsonKey(
      name: 'signInTypes',
      includeIfNull: false,
      toJson: signInTypeListToJson,
      fromJson: signInTypeListFromJson)
  final List<enums.SignInType>? signInTypes;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyInfoFromJson;
  static const toJsonFactory = _$StudyInfoToJson;
  Map<String, dynamic> toJson() => _$StudyInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyInfo &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.phase, phase) ||
                const DeepCollectionEquality().equals(other.phase, phase)) &&
            (identical(other.studyLogoUrl, studyLogoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.studyLogoUrl, studyLogoUrl)) &&
            (identical(other.colorScheme, colorScheme) ||
                const DeepCollectionEquality()
                    .equals(other.colorScheme, colorScheme)) &&
            (identical(other.signInTypes, signInTypes) ||
                const DeepCollectionEquality()
                    .equals(other.signInTypes, signInTypes)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(phase) ^
      const DeepCollectionEquality().hash(studyLogoUrl) ^
      const DeepCollectionEquality().hash(colorScheme) ^
      const DeepCollectionEquality().hash(signInTypes) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyInfoExtension on StudyInfo {
  StudyInfo copyWith(
      {String? identifier,
      String? name,
      String? details,
      enums.StudyPhase? phase,
      String? studyLogoUrl,
      ColorScheme? colorScheme,
      List<enums.SignInType>? signInTypes,
      String? type}) {
    return StudyInfo(
        identifier: identifier ?? this.identifier,
        name: name ?? this.name,
        details: details ?? this.details,
        phase: phase ?? this.phase,
        studyLogoUrl: studyLogoUrl ?? this.studyLogoUrl,
        colorScheme: colorScheme ?? this.colorScheme,
        signInTypes: signInTypes ?? this.signInTypes,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Survey {
  Survey({
    this.guid,
    this.moduleId,
    this.moduleVersion,
    this.name,
    this.identifier,
    this.published,
    this.schemaRevision,
    this.createdOn,
    this.modifiedOn,
    this.copyrightNotice,
    this.deleted,
    this.version,
    this.elements,
    this.type,
  });

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'moduleId', includeIfNull: false)
  final String? moduleId;
  @JsonKey(name: 'moduleVersion', includeIfNull: false)
  final int? moduleVersion;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'published', includeIfNull: false)
  final bool? published;
  @JsonKey(name: 'schemaRevision', includeIfNull: false)
  final num? schemaRevision;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'copyrightNotice', includeIfNull: false)
  final String? copyrightNotice;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(
      name: 'elements', includeIfNull: false, defaultValue: <SurveyElement>[])
  final List<SurveyElement>? elements;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyFromJson;
  static const toJsonFactory = _$SurveyToJson;
  Map<String, dynamic> toJson() => _$SurveyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Survey &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.moduleId, moduleId) ||
                const DeepCollectionEquality()
                    .equals(other.moduleId, moduleId)) &&
            (identical(other.moduleVersion, moduleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.moduleVersion, moduleVersion)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.published, published) ||
                const DeepCollectionEquality()
                    .equals(other.published, published)) &&
            (identical(other.schemaRevision, schemaRevision) ||
                const DeepCollectionEquality()
                    .equals(other.schemaRevision, schemaRevision)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.copyrightNotice, copyrightNotice) ||
                const DeepCollectionEquality()
                    .equals(other.copyrightNotice, copyrightNotice)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.elements, elements) ||
                const DeepCollectionEquality()
                    .equals(other.elements, elements)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(moduleId) ^
      const DeepCollectionEquality().hash(moduleVersion) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(published) ^
      const DeepCollectionEquality().hash(schemaRevision) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(copyrightNotice) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(elements) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyExtension on Survey {
  Survey copyWith(
      {String? guid,
      String? moduleId,
      int? moduleVersion,
      String? name,
      String? identifier,
      bool? published,
      num? schemaRevision,
      DateTime? createdOn,
      DateTime? modifiedOn,
      String? copyrightNotice,
      bool? deleted,
      num? version,
      List<SurveyElement>? elements,
      String? type}) {
    return Survey(
        guid: guid ?? this.guid,
        moduleId: moduleId ?? this.moduleId,
        moduleVersion: moduleVersion ?? this.moduleVersion,
        name: name ?? this.name,
        identifier: identifier ?? this.identifier,
        published: published ?? this.published,
        schemaRevision: schemaRevision ?? this.schemaRevision,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        copyrightNotice: copyrightNotice ?? this.copyrightNotice,
        deleted: deleted ?? this.deleted,
        version: version ?? this.version,
        elements: elements ?? this.elements,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyElement {
  SurveyElement({
    this.guid,
    this.beforeRules,
    this.afterRules,
    this.identifier,
    this.type,
  });

  factory SurveyElement.fromJson(Map<String, dynamic> json) =>
      _$SurveyElementFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(
      name: 'beforeRules', includeIfNull: false, defaultValue: <SurveyRule>[])
  final List<SurveyRule>? beforeRules;
  @JsonKey(
      name: 'afterRules', includeIfNull: false, defaultValue: <SurveyRule>[])
  final List<SurveyRule>? afterRules;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyElementFromJson;
  static const toJsonFactory = _$SurveyElementToJson;
  Map<String, dynamic> toJson() => _$SurveyElementToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyElement &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.beforeRules, beforeRules) ||
                const DeepCollectionEquality()
                    .equals(other.beforeRules, beforeRules)) &&
            (identical(other.afterRules, afterRules) ||
                const DeepCollectionEquality()
                    .equals(other.afterRules, afterRules)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(beforeRules) ^
      const DeepCollectionEquality().hash(afterRules) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyElementExtension on SurveyElement {
  SurveyElement copyWith(
      {String? guid,
      List<SurveyRule>? beforeRules,
      List<SurveyRule>? afterRules,
      String? identifier,
      String? type}) {
    return SurveyElement(
        guid: guid ?? this.guid,
        beforeRules: beforeRules ?? this.beforeRules,
        afterRules: afterRules ?? this.afterRules,
        identifier: identifier ?? this.identifier,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyInfoScreen {
  SurveyInfoScreen({
    this.title,
    this.prompt,
    this.promptDetail,
    this.image,
    this.guid,
    this.beforeRules,
    this.afterRules,
    this.identifier,
    this.type,
  });

  factory SurveyInfoScreen.fromJson(Map<String, dynamic> json) =>
      _$SurveyInfoScreenFromJson(json);

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'prompt', includeIfNull: false)
  final String? prompt;
  @JsonKey(name: 'promptDetail', includeIfNull: false)
  final String? promptDetail;
  @JsonKey(name: 'image', includeIfNull: false)
  final Image? image;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(
      name: 'beforeRules', includeIfNull: false, defaultValue: <SurveyRule>[])
  final List<SurveyRule>? beforeRules;
  @JsonKey(
      name: 'afterRules', includeIfNull: false, defaultValue: <SurveyRule>[])
  final List<SurveyRule>? afterRules;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyInfoScreenFromJson;
  static const toJsonFactory = _$SurveyInfoScreenToJson;
  Map<String, dynamic> toJson() => _$SurveyInfoScreenToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyInfoScreen &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.prompt, prompt) ||
                const DeepCollectionEquality().equals(other.prompt, prompt)) &&
            (identical(other.promptDetail, promptDetail) ||
                const DeepCollectionEquality()
                    .equals(other.promptDetail, promptDetail)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.beforeRules, beforeRules) ||
                const DeepCollectionEquality()
                    .equals(other.beforeRules, beforeRules)) &&
            (identical(other.afterRules, afterRules) ||
                const DeepCollectionEquality()
                    .equals(other.afterRules, afterRules)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(prompt) ^
      const DeepCollectionEquality().hash(promptDetail) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(beforeRules) ^
      const DeepCollectionEquality().hash(afterRules) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyInfoScreenExtension on SurveyInfoScreen {
  SurveyInfoScreen copyWith(
      {String? title,
      String? prompt,
      String? promptDetail,
      Image? image,
      String? guid,
      List<SurveyRule>? beforeRules,
      List<SurveyRule>? afterRules,
      String? identifier,
      String? type}) {
    return SurveyInfoScreen(
        title: title ?? this.title,
        prompt: prompt ?? this.prompt,
        promptDetail: promptDetail ?? this.promptDetail,
        image: image ?? this.image,
        guid: guid ?? this.guid,
        beforeRules: beforeRules ?? this.beforeRules,
        afterRules: afterRules ?? this.afterRules,
        identifier: identifier ?? this.identifier,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyQuestion {
  SurveyQuestion({
    this.title,
    this.prompt,
    this.promptDetail,
    this.uiHint,
    this.constraints,
    this.guid,
    this.beforeRules,
    this.afterRules,
    this.identifier,
    this.type,
  });

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionFromJson(json);

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'prompt', includeIfNull: false)
  final String? prompt;
  @JsonKey(name: 'promptDetail', includeIfNull: false)
  final String? promptDetail;
  @JsonKey(
      name: 'uiHint',
      includeIfNull: false,
      toJson: uIHintToJson,
      fromJson: uIHintFromJson)
  final enums.UIHint? uiHint;
  @JsonKey(name: 'constraints', includeIfNull: false)
  final Constraints? constraints;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(
      name: 'beforeRules', includeIfNull: false, defaultValue: <SurveyRule>[])
  final List<SurveyRule>? beforeRules;
  @JsonKey(
      name: 'afterRules', includeIfNull: false, defaultValue: <SurveyRule>[])
  final List<SurveyRule>? afterRules;
  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyQuestionFromJson;
  static const toJsonFactory = _$SurveyQuestionToJson;
  Map<String, dynamic> toJson() => _$SurveyQuestionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyQuestion &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.prompt, prompt) ||
                const DeepCollectionEquality().equals(other.prompt, prompt)) &&
            (identical(other.promptDetail, promptDetail) ||
                const DeepCollectionEquality()
                    .equals(other.promptDetail, promptDetail)) &&
            (identical(other.uiHint, uiHint) ||
                const DeepCollectionEquality().equals(other.uiHint, uiHint)) &&
            (identical(other.constraints, constraints) ||
                const DeepCollectionEquality()
                    .equals(other.constraints, constraints)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.beforeRules, beforeRules) ||
                const DeepCollectionEquality()
                    .equals(other.beforeRules, beforeRules)) &&
            (identical(other.afterRules, afterRules) ||
                const DeepCollectionEquality()
                    .equals(other.afterRules, afterRules)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(prompt) ^
      const DeepCollectionEquality().hash(promptDetail) ^
      const DeepCollectionEquality().hash(uiHint) ^
      const DeepCollectionEquality().hash(constraints) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(beforeRules) ^
      const DeepCollectionEquality().hash(afterRules) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyQuestionExtension on SurveyQuestion {
  SurveyQuestion copyWith(
      {String? title,
      String? prompt,
      String? promptDetail,
      enums.UIHint? uiHint,
      Constraints? constraints,
      String? guid,
      List<SurveyRule>? beforeRules,
      List<SurveyRule>? afterRules,
      String? identifier,
      String? type}) {
    return SurveyQuestion(
        title: title ?? this.title,
        prompt: prompt ?? this.prompt,
        promptDetail: promptDetail ?? this.promptDetail,
        uiHint: uiHint ?? this.uiHint,
        constraints: constraints ?? this.constraints,
        guid: guid ?? this.guid,
        beforeRules: beforeRules ?? this.beforeRules,
        afterRules: afterRules ?? this.afterRules,
        identifier: identifier ?? this.identifier,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyQuestionOption {
  SurveyQuestionOption({
    this.label,
    this.detail,
    this.value,
    this.image,
    this.exclusive,
    this.type,
  });

  factory SurveyQuestionOption.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionOptionFromJson(json);

  @JsonKey(name: 'label', includeIfNull: false)
  final String? label;
  @JsonKey(name: 'detail', includeIfNull: false)
  final String? detail;
  @JsonKey(name: 'value', includeIfNull: false)
  final String? value;
  @JsonKey(name: 'image', includeIfNull: false)
  final Image? image;
  @JsonKey(name: 'exclusive', includeIfNull: false)
  final bool? exclusive;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyQuestionOptionFromJson;
  static const toJsonFactory = _$SurveyQuestionOptionToJson;
  Map<String, dynamic> toJson() => _$SurveyQuestionOptionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyQuestionOption &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.exclusive, exclusive) ||
                const DeepCollectionEquality()
                    .equals(other.exclusive, exclusive)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(exclusive) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyQuestionOptionExtension on SurveyQuestionOption {
  SurveyQuestionOption copyWith(
      {String? label,
      String? detail,
      String? value,
      Image? image,
      bool? exclusive,
      String? type}) {
    return SurveyQuestionOption(
        label: label ?? this.label,
        detail: detail ?? this.detail,
        value: value ?? this.value,
        image: image ?? this.image,
        exclusive: exclusive ?? this.exclusive,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyReference {
  SurveyReference({
    this.identifier,
    this.guid,
    this.createdOn,
    this.href,
    this.type,
  });

  factory SurveyReference.fromJson(Map<String, dynamic> json) =>
      _$SurveyReferenceFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'href', includeIfNull: false)
  final String? href;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyReferenceFromJson;
  static const toJsonFactory = _$SurveyReferenceToJson;
  Map<String, dynamic> toJson() => _$SurveyReferenceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyReference &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.href, href) ||
                const DeepCollectionEquality().equals(other.href, href)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(href) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyReferenceExtension on SurveyReference {
  SurveyReference copyWith(
      {String? identifier,
      String? guid,
      DateTime? createdOn,
      String? href,
      String? type}) {
    return SurveyReference(
        identifier: identifier ?? this.identifier,
        guid: guid ?? this.guid,
        createdOn: createdOn ?? this.createdOn,
        href: href ?? this.href,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyRule {
  SurveyRule({
    this.$Operator,
    this.value,
    this.dataGroups,
    this.skipTo,
    this.endSurvey,
    this.displayIf,
    this.displayUnless,
    this.assignDataGroup,
    this.type,
  });

  factory SurveyRule.fromJson(Map<String, dynamic> json) =>
      _$SurveyRuleFromJson(json);

  @JsonKey(
      name: 'operator',
      includeIfNull: false,
      toJson: operatorToJson,
      fromJson: operatorFromJson)
  final enums.Operator? $Operator;
  @JsonKey(name: 'value', includeIfNull: false)
  final String? value;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'skipTo', includeIfNull: false)
  final String? skipTo;
  @JsonKey(name: 'endSurvey', includeIfNull: false)
  final bool? endSurvey;
  @JsonKey(name: 'displayIf', includeIfNull: false)
  final bool? displayIf;
  @JsonKey(name: 'displayUnless', includeIfNull: false)
  final bool? displayUnless;
  @JsonKey(name: 'assignDataGroup', includeIfNull: false)
  final String? assignDataGroup;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyRuleFromJson;
  static const toJsonFactory = _$SurveyRuleToJson;
  Map<String, dynamic> toJson() => _$SurveyRuleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyRule &&
            (identical(other.$Operator, $Operator) ||
                const DeepCollectionEquality()
                    .equals(other.$Operator, $Operator)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.skipTo, skipTo) ||
                const DeepCollectionEquality().equals(other.skipTo, skipTo)) &&
            (identical(other.endSurvey, endSurvey) ||
                const DeepCollectionEquality()
                    .equals(other.endSurvey, endSurvey)) &&
            (identical(other.displayIf, displayIf) ||
                const DeepCollectionEquality()
                    .equals(other.displayIf, displayIf)) &&
            (identical(other.displayUnless, displayUnless) ||
                const DeepCollectionEquality()
                    .equals(other.displayUnless, displayUnless)) &&
            (identical(other.assignDataGroup, assignDataGroup) ||
                const DeepCollectionEquality()
                    .equals(other.assignDataGroup, assignDataGroup)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash($Operator) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(skipTo) ^
      const DeepCollectionEquality().hash(endSurvey) ^
      const DeepCollectionEquality().hash(displayIf) ^
      const DeepCollectionEquality().hash(displayUnless) ^
      const DeepCollectionEquality().hash(assignDataGroup) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyRuleExtension on SurveyRule {
  SurveyRule copyWith(
      {enums.Operator? $Operator,
      String? value,
      List<String>? dataGroups,
      String? skipTo,
      bool? endSurvey,
      bool? displayIf,
      bool? displayUnless,
      String? assignDataGroup,
      String? type}) {
    return SurveyRule(
        $Operator: $Operator ?? this.$Operator,
        value: value ?? this.value,
        dataGroups: dataGroups ?? this.dataGroups,
        skipTo: skipTo ?? this.skipTo,
        endSurvey: endSurvey ?? this.endSurvey,
        displayIf: displayIf ?? this.displayIf,
        displayUnless: displayUnless ?? this.displayUnless,
        assignDataGroup: assignDataGroup ?? this.assignDataGroup,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class TaskReference {
  TaskReference({
    this.identifier,
    this.schema,
    this.type,
  });

  factory TaskReference.fromJson(Map<String, dynamic> json) =>
      _$TaskReferenceFromJson(json);

  @JsonKey(name: 'identifier', includeIfNull: false)
  final String? identifier;
  @JsonKey(name: 'schema', includeIfNull: false)
  final SchemaReference? schema;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$TaskReferenceFromJson;
  static const toJsonFactory = _$TaskReferenceToJson;
  Map<String, dynamic> toJson() => _$TaskReferenceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TaskReference &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.schema, schema) ||
                const DeepCollectionEquality().equals(other.schema, schema)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(schema) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $TaskReferenceExtension on TaskReference {
  TaskReference copyWith(
      {String? identifier, SchemaReference? schema, String? type}) {
    return TaskReference(
        identifier: identifier ?? this.identifier,
        schema: schema ?? this.schema,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Template {
  Template({
    this.guid,
    this.templateType,
    this.name,
    this.description,
    this.criteria,
    this.createdOn,
    this.modifiedOn,
    this.publishedCreatedOn,
    this.deleted,
    this.version,
    this.type,
  });

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(
      name: 'templateType',
      includeIfNull: false,
      toJson: templateTypeToJson,
      fromJson: templateTypeFromJson)
  final enums.TemplateType? templateType;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'criteria', includeIfNull: false)
  final Criteria? criteria;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'modifiedOn', includeIfNull: false)
  final DateTime? modifiedOn;
  @JsonKey(name: 'publishedCreatedOn', includeIfNull: false)
  final DateTime? publishedCreatedOn;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$TemplateFromJson;
  static const toJsonFactory = _$TemplateToJson;
  Map<String, dynamic> toJson() => _$TemplateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Template &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.templateType, templateType) ||
                const DeepCollectionEquality()
                    .equals(other.templateType, templateType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.criteria, criteria) ||
                const DeepCollectionEquality()
                    .equals(other.criteria, criteria)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.modifiedOn, modifiedOn) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedOn, modifiedOn)) &&
            (identical(other.publishedCreatedOn, publishedCreatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.publishedCreatedOn, publishedCreatedOn)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(templateType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(criteria) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(modifiedOn) ^
      const DeepCollectionEquality().hash(publishedCreatedOn) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $TemplateExtension on Template {
  Template copyWith(
      {String? guid,
      enums.TemplateType? templateType,
      String? name,
      String? description,
      Criteria? criteria,
      DateTime? createdOn,
      DateTime? modifiedOn,
      DateTime? publishedCreatedOn,
      bool? deleted,
      num? version,
      String? type}) {
    return Template(
        guid: guid ?? this.guid,
        templateType: templateType ?? this.templateType,
        name: name ?? this.name,
        description: description ?? this.description,
        criteria: criteria ?? this.criteria,
        createdOn: createdOn ?? this.createdOn,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        publishedCreatedOn: publishedCreatedOn ?? this.publishedCreatedOn,
        deleted: deleted ?? this.deleted,
        version: version ?? this.version,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class TemplateRevision {
  TemplateRevision({
    this.createdOn,
    this.createdBy,
    this.documentContent,
    this.subject,
    this.mimeType,
    this.type,
  });

  factory TemplateRevision.fromJson(Map<String, dynamic> json) =>
      _$TemplateRevisionFromJson(json);

  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final String? createdBy;
  @JsonKey(name: 'documentContent', includeIfNull: false)
  final String? documentContent;
  @JsonKey(name: 'subject', includeIfNull: false)
  final String? subject;
  @JsonKey(
      name: 'mimeType',
      includeIfNull: false,
      toJson: mimeTypeToJson,
      fromJson: mimeTypeFromJson)
  final enums.MimeType? mimeType;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$TemplateRevisionFromJson;
  static const toJsonFactory = _$TemplateRevisionToJson;
  Map<String, dynamic> toJson() => _$TemplateRevisionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TemplateRevision &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.documentContent, documentContent) ||
                const DeepCollectionEquality()
                    .equals(other.documentContent, documentContent)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(documentContent) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $TemplateRevisionExtension on TemplateRevision {
  TemplateRevision copyWith(
      {DateTime? createdOn,
      String? createdBy,
      String? documentContent,
      String? subject,
      enums.MimeType? mimeType,
      String? type}) {
    return TemplateRevision(
        createdOn: createdOn ?? this.createdOn,
        createdBy: createdBy ?? this.createdBy,
        documentContent: documentContent ?? this.documentContent,
        subject: subject ?? this.subject,
        mimeType: mimeType ?? this.mimeType,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Timeline {
  Timeline({
    this.duration,
    this.schedule,
    this.assessments,
    this.sessions,
    this.studyBursts,
    this.totalMinutes,
    this.totalNotifications,
    this.type,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);

  @JsonKey(name: 'duration', includeIfNull: false)
  final String? duration;
  @JsonKey(
      name: 'schedule',
      includeIfNull: false,
      defaultValue: <ScheduledSession>[])
  final List<ScheduledSession>? schedule;
  @JsonKey(
      name: 'assessments',
      includeIfNull: false,
      defaultValue: <AssessmentInfo>[])
  final List<AssessmentInfo>? assessments;
  @JsonKey(
      name: 'sessions', includeIfNull: false, defaultValue: <SessionInfo>[])
  final List<SessionInfo>? sessions;
  @JsonKey(
      name: 'studyBursts',
      includeIfNull: false,
      defaultValue: <StudyBurstInfo>[])
  final List<StudyBurstInfo>? studyBursts;
  @JsonKey(name: 'totalMinutes', includeIfNull: false)
  final int? totalMinutes;
  @JsonKey(name: 'totalNotifications', includeIfNull: false)
  final int? totalNotifications;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$TimelineFromJson;
  static const toJsonFactory = _$TimelineToJson;
  Map<String, dynamic> toJson() => _$TimelineToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Timeline &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.assessments, assessments) ||
                const DeepCollectionEquality()
                    .equals(other.assessments, assessments)) &&
            (identical(other.sessions, sessions) ||
                const DeepCollectionEquality()
                    .equals(other.sessions, sessions)) &&
            (identical(other.studyBursts, studyBursts) ||
                const DeepCollectionEquality()
                    .equals(other.studyBursts, studyBursts)) &&
            (identical(other.totalMinutes, totalMinutes) ||
                const DeepCollectionEquality()
                    .equals(other.totalMinutes, totalMinutes)) &&
            (identical(other.totalNotifications, totalNotifications) ||
                const DeepCollectionEquality()
                    .equals(other.totalNotifications, totalNotifications)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(assessments) ^
      const DeepCollectionEquality().hash(sessions) ^
      const DeepCollectionEquality().hash(studyBursts) ^
      const DeepCollectionEquality().hash(totalMinutes) ^
      const DeepCollectionEquality().hash(totalNotifications) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $TimelineExtension on Timeline {
  Timeline copyWith(
      {String? duration,
      List<ScheduledSession>? schedule,
      List<AssessmentInfo>? assessments,
      List<SessionInfo>? sessions,
      List<StudyBurstInfo>? studyBursts,
      int? totalMinutes,
      int? totalNotifications,
      String? type}) {
    return Timeline(
        duration: duration ?? this.duration,
        schedule: schedule ?? this.schedule,
        assessments: assessments ?? this.assessments,
        sessions: sessions ?? this.sessions,
        studyBursts: studyBursts ?? this.studyBursts,
        totalMinutes: totalMinutes ?? this.totalMinutes,
        totalNotifications: totalNotifications ?? this.totalNotifications,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class TimeWindow {
  TimeWindow({
    this.guid,
    this.startTime,
    this.expiration,
    this.persistent,
    this.type,
  });

  factory TimeWindow.fromJson(Map<String, dynamic> json) =>
      _$TimeWindowFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false)
  final String? guid;
  @JsonKey(name: 'startTime', includeIfNull: false)
  final String? startTime;
  @JsonKey(name: 'expiration', includeIfNull: false)
  final String? expiration;
  @JsonKey(name: 'persistent', includeIfNull: false)
  final bool? persistent;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$TimeWindowFromJson;
  static const toJsonFactory = _$TimeWindowToJson;
  Map<String, dynamic> toJson() => _$TimeWindowToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TimeWindow &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.expiration, expiration) ||
                const DeepCollectionEquality()
                    .equals(other.expiration, expiration)) &&
            (identical(other.persistent, persistent) ||
                const DeepCollectionEquality()
                    .equals(other.persistent, persistent)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(expiration) ^
      const DeepCollectionEquality().hash(persistent) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $TimeWindowExtension on TimeWindow {
  TimeWindow copyWith(
      {String? guid,
      String? startTime,
      String? expiration,
      bool? persistent,
      String? type}) {
    return TimeWindow(
        guid: guid ?? this.guid,
        startTime: startTime ?? this.startTime,
        expiration: expiration ?? this.expiration,
        persistent: persistent ?? this.persistent,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class DateTimeHolder {
  DateTimeHolder({
    this.dateTime,
    this.type,
  });

  factory DateTimeHolder.fromJson(Map<String, dynamic> json) =>
      _$DateTimeHolderFromJson(json);

  @JsonKey(name: 'dateTime', includeIfNull: false)
  final DateTime? dateTime;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$DateTimeHolderFromJson;
  static const toJsonFactory = _$DateTimeHolderToJson;
  Map<String, dynamic> toJson() => _$DateTimeHolderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DateTimeHolder &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $DateTimeHolderExtension on DateTimeHolder {
  DateTimeHolder copyWith({DateTime? dateTime, String? type}) {
    return DateTimeHolder(
        dateTime: dateTime ?? this.dateTime, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Upload {
  Upload({
    this.uploadId,
    this.encrypted,
    this.schemaId,
    this.schemaRevision,
    this.recordId,
    this.healthData,
    this.contentLength,
    this.contentMd5,
    this.contentType,
    this.filename,
    this.status,
    this.requestedOn,
    this.completedOn,
    this.completedBy,
    this.validationMessageList,
    this.healthRecordExporterStatus,
    this.zipped,
    this.type,
  });

  factory Upload.fromJson(Map<String, dynamic> json) => _$UploadFromJson(json);

  @JsonKey(name: 'uploadId', includeIfNull: false)
  final String? uploadId;
  @JsonKey(name: 'encrypted', includeIfNull: false)
  final bool? encrypted;
  @JsonKey(name: 'schemaId', includeIfNull: false)
  final String? schemaId;
  @JsonKey(name: 'schemaRevision', includeIfNull: false)
  final num? schemaRevision;
  @JsonKey(name: 'recordId', includeIfNull: false)
  final String? recordId;
  @JsonKey(name: 'healthData', includeIfNull: false)
  final HealthDataRecord? healthData;
  @JsonKey(name: 'contentLength', includeIfNull: false)
  final num? contentLength;
  @JsonKey(name: 'contentMd5', includeIfNull: false)
  final String? contentMd5;
  @JsonKey(name: 'contentType', includeIfNull: false)
  final String? contentType;
  @JsonKey(name: 'filename', includeIfNull: false)
  final String? filename;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: uploadStatusToJson,
      fromJson: uploadStatusFromJson)
  final enums.UploadStatus? status;
  @JsonKey(name: 'requestedOn', includeIfNull: false)
  final DateTime? requestedOn;
  @JsonKey(name: 'completedOn', includeIfNull: false)
  final DateTime? completedOn;
  @JsonKey(
      name: 'completedBy',
      includeIfNull: false,
      toJson: uploadCompletedByToJson,
      fromJson: uploadCompletedByFromJson)
  final enums.UploadCompletedBy? completedBy;
  @JsonKey(
      name: 'validationMessageList',
      includeIfNull: false,
      defaultValue: <String>[])
  final List<String>? validationMessageList;
  @JsonKey(
      name: 'healthRecordExporterStatus',
      includeIfNull: false,
      toJson: synapseExporterStatusToJson,
      fromJson: synapseExporterStatusFromJson)
  final enums.SynapseExporterStatus? healthRecordExporterStatus;
  @JsonKey(name: 'zipped', includeIfNull: false)
  final bool? zipped;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UploadFromJson;
  static const toJsonFactory = _$UploadToJson;
  Map<String, dynamic> toJson() => _$UploadToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Upload &&
            (identical(other.uploadId, uploadId) ||
                const DeepCollectionEquality()
                    .equals(other.uploadId, uploadId)) &&
            (identical(other.encrypted, encrypted) ||
                const DeepCollectionEquality()
                    .equals(other.encrypted, encrypted)) &&
            (identical(other.schemaId, schemaId) ||
                const DeepCollectionEquality()
                    .equals(other.schemaId, schemaId)) &&
            (identical(other.schemaRevision, schemaRevision) ||
                const DeepCollectionEquality()
                    .equals(other.schemaRevision, schemaRevision)) &&
            (identical(other.recordId, recordId) ||
                const DeepCollectionEquality()
                    .equals(other.recordId, recordId)) &&
            (identical(other.healthData, healthData) ||
                const DeepCollectionEquality()
                    .equals(other.healthData, healthData)) &&
            (identical(other.contentLength, contentLength) ||
                const DeepCollectionEquality()
                    .equals(other.contentLength, contentLength)) &&
            (identical(other.contentMd5, contentMd5) ||
                const DeepCollectionEquality()
                    .equals(other.contentMd5, contentMd5)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality()
                    .equals(other.filename, filename)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.requestedOn, requestedOn) ||
                const DeepCollectionEquality()
                    .equals(other.requestedOn, requestedOn)) &&
            (identical(other.completedOn, completedOn) ||
                const DeepCollectionEquality()
                    .equals(other.completedOn, completedOn)) &&
            (identical(other.completedBy, completedBy) ||
                const DeepCollectionEquality()
                    .equals(other.completedBy, completedBy)) &&
            (identical(other.validationMessageList, validationMessageList) ||
                const DeepCollectionEquality().equals(
                    other.validationMessageList, validationMessageList)) &&
            (identical(other.healthRecordExporterStatus,
                    healthRecordExporterStatus) ||
                const DeepCollectionEquality().equals(
                    other.healthRecordExporterStatus,
                    healthRecordExporterStatus)) &&
            (identical(other.zipped, zipped) ||
                const DeepCollectionEquality().equals(other.zipped, zipped)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uploadId) ^
      const DeepCollectionEquality().hash(encrypted) ^
      const DeepCollectionEquality().hash(schemaId) ^
      const DeepCollectionEquality().hash(schemaRevision) ^
      const DeepCollectionEquality().hash(recordId) ^
      const DeepCollectionEquality().hash(healthData) ^
      const DeepCollectionEquality().hash(contentLength) ^
      const DeepCollectionEquality().hash(contentMd5) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(requestedOn) ^
      const DeepCollectionEquality().hash(completedOn) ^
      const DeepCollectionEquality().hash(completedBy) ^
      const DeepCollectionEquality().hash(validationMessageList) ^
      const DeepCollectionEquality().hash(healthRecordExporterStatus) ^
      const DeepCollectionEquality().hash(zipped) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UploadExtension on Upload {
  Upload copyWith(
      {String? uploadId,
      bool? encrypted,
      String? schemaId,
      num? schemaRevision,
      String? recordId,
      HealthDataRecord? healthData,
      num? contentLength,
      String? contentMd5,
      String? contentType,
      String? filename,
      enums.UploadStatus? status,
      DateTime? requestedOn,
      DateTime? completedOn,
      enums.UploadCompletedBy? completedBy,
      List<String>? validationMessageList,
      enums.SynapseExporterStatus? healthRecordExporterStatus,
      bool? zipped,
      String? type}) {
    return Upload(
        uploadId: uploadId ?? this.uploadId,
        encrypted: encrypted ?? this.encrypted,
        schemaId: schemaId ?? this.schemaId,
        schemaRevision: schemaRevision ?? this.schemaRevision,
        recordId: recordId ?? this.recordId,
        healthData: healthData ?? this.healthData,
        contentLength: contentLength ?? this.contentLength,
        contentMd5: contentMd5 ?? this.contentMd5,
        contentType: contentType ?? this.contentType,
        filename: filename ?? this.filename,
        status: status ?? this.status,
        requestedOn: requestedOn ?? this.requestedOn,
        completedOn: completedOn ?? this.completedOn,
        completedBy: completedBy ?? this.completedBy,
        validationMessageList:
            validationMessageList ?? this.validationMessageList,
        healthRecordExporterStatus:
            healthRecordExporterStatus ?? this.healthRecordExporterStatus,
        zipped: zipped ?? this.zipped,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UploadFieldDefinition {
  UploadFieldDefinition({
    this.name,
    this.required,
    this.type,
    this.allowOtherChoices,
    this.fileExtension,
    this.mimeType,
    this.maxLength,
    this.multiChoiceAnswerList,
    this.unboundedText,
  });

  factory UploadFieldDefinition.fromJson(Map<String, dynamic> json) =>
      _$UploadFieldDefinitionFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'required', includeIfNull: false, defaultValue: true)
  final bool? required;
  @JsonKey(
      name: 'type',
      includeIfNull: false,
      toJson: uploadFieldTypeToJson,
      fromJson: uploadFieldTypeFromJson)
  final enums.UploadFieldType? type;
  @JsonKey(name: 'allowOtherChoices', includeIfNull: false)
  final bool? allowOtherChoices;
  @JsonKey(name: 'fileExtension', includeIfNull: false)
  final String? fileExtension;
  @JsonKey(name: 'mimeType', includeIfNull: false)
  final String? mimeType;
  @JsonKey(name: 'maxLength', includeIfNull: false)
  final int? maxLength;
  @JsonKey(
      name: 'multiChoiceAnswerList',
      includeIfNull: false,
      defaultValue: <String>[])
  final List<String>? multiChoiceAnswerList;
  @JsonKey(name: 'unboundedText', includeIfNull: false)
  final bool? unboundedText;
  static const fromJsonFactory = _$UploadFieldDefinitionFromJson;
  static const toJsonFactory = _$UploadFieldDefinitionToJson;
  Map<String, dynamic> toJson() => _$UploadFieldDefinitionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UploadFieldDefinition &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.allowOtherChoices, allowOtherChoices) ||
                const DeepCollectionEquality()
                    .equals(other.allowOtherChoices, allowOtherChoices)) &&
            (identical(other.fileExtension, fileExtension) ||
                const DeepCollectionEquality()
                    .equals(other.fileExtension, fileExtension)) &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.maxLength, maxLength) ||
                const DeepCollectionEquality()
                    .equals(other.maxLength, maxLength)) &&
            (identical(other.multiChoiceAnswerList, multiChoiceAnswerList) ||
                const DeepCollectionEquality().equals(
                    other.multiChoiceAnswerList, multiChoiceAnswerList)) &&
            (identical(other.unboundedText, unboundedText) ||
                const DeepCollectionEquality()
                    .equals(other.unboundedText, unboundedText)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(allowOtherChoices) ^
      const DeepCollectionEquality().hash(fileExtension) ^
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(maxLength) ^
      const DeepCollectionEquality().hash(multiChoiceAnswerList) ^
      const DeepCollectionEquality().hash(unboundedText) ^
      runtimeType.hashCode;
}

extension $UploadFieldDefinitionExtension on UploadFieldDefinition {
  UploadFieldDefinition copyWith(
      {String? name,
      bool? required,
      enums.UploadFieldType? type,
      bool? allowOtherChoices,
      String? fileExtension,
      String? mimeType,
      int? maxLength,
      List<String>? multiChoiceAnswerList,
      bool? unboundedText}) {
    return UploadFieldDefinition(
        name: name ?? this.name,
        required: required ?? this.required,
        type: type ?? this.type,
        allowOtherChoices: allowOtherChoices ?? this.allowOtherChoices,
        fileExtension: fileExtension ?? this.fileExtension,
        mimeType: mimeType ?? this.mimeType,
        maxLength: maxLength ?? this.maxLength,
        multiChoiceAnswerList:
            multiChoiceAnswerList ?? this.multiChoiceAnswerList,
        unboundedText: unboundedText ?? this.unboundedText);
  }
}

@JsonSerializable(explicitToJson: true)
class UploadRequest {
  UploadRequest({
    this.name,
    this.contentLength,
    this.contentMd5,
    this.contentType,
    this.encrypted,
    this.metadata,
    this.zipped,
    this.type,
  });

  factory UploadRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadRequestFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'contentLength', includeIfNull: false)
  final num? contentLength;
  @JsonKey(name: 'contentMd5', includeIfNull: false)
  final String? contentMd5;
  @JsonKey(name: 'contentType', includeIfNull: false)
  final String? contentType;
  @JsonKey(name: 'encrypted', includeIfNull: false, defaultValue: true)
  final bool? encrypted;
  @JsonKey(name: 'metadata', includeIfNull: false)
  final Map<String, dynamic>? metadata;
  @JsonKey(name: 'zipped', includeIfNull: false, defaultValue: true)
  final bool? zipped;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UploadRequestFromJson;
  static const toJsonFactory = _$UploadRequestToJson;
  Map<String, dynamic> toJson() => _$UploadRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UploadRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.contentLength, contentLength) ||
                const DeepCollectionEquality()
                    .equals(other.contentLength, contentLength)) &&
            (identical(other.contentMd5, contentMd5) ||
                const DeepCollectionEquality()
                    .equals(other.contentMd5, contentMd5)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.encrypted, encrypted) ||
                const DeepCollectionEquality()
                    .equals(other.encrypted, encrypted)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)) &&
            (identical(other.zipped, zipped) ||
                const DeepCollectionEquality().equals(other.zipped, zipped)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(contentLength) ^
      const DeepCollectionEquality().hash(contentMd5) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(encrypted) ^
      const DeepCollectionEquality().hash(metadata) ^
      const DeepCollectionEquality().hash(zipped) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UploadRequestExtension on UploadRequest {
  UploadRequest copyWith(
      {String? name,
      num? contentLength,
      String? contentMd5,
      String? contentType,
      bool? encrypted,
      Map<String, dynamic>? metadata,
      bool? zipped,
      String? type}) {
    return UploadRequest(
        name: name ?? this.name,
        contentLength: contentLength ?? this.contentLength,
        contentMd5: contentMd5 ?? this.contentMd5,
        contentType: contentType ?? this.contentType,
        encrypted: encrypted ?? this.encrypted,
        metadata: metadata ?? this.metadata,
        zipped: zipped ?? this.zipped,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UploadSchema {
  UploadSchema({
    this.maxAppVersions,
    this.minAppVersions,
    this.moduleId,
    this.moduleVersion,
    this.name,
    this.revision,
    this.schemaId,
    this.surveyGuid,
    this.appId,
    this.surveyCreatedOn,
    this.schemaType,
    this.deleted,
    this.version,
    this.fieldDefinitions,
    this.type,
  });

  factory UploadSchema.fromJson(Map<String, dynamic> json) =>
      _$UploadSchemaFromJson(json);

  @JsonKey(name: 'maxAppVersions', includeIfNull: false)
  final Map<String, dynamic>? maxAppVersions;
  @JsonKey(name: 'minAppVersions', includeIfNull: false)
  final Map<String, dynamic>? minAppVersions;
  @JsonKey(name: 'moduleId', includeIfNull: false)
  final String? moduleId;
  @JsonKey(name: 'moduleVersion', includeIfNull: false)
  final int? moduleVersion;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'revision', includeIfNull: false)
  final num? revision;
  @JsonKey(name: 'schemaId', includeIfNull: false)
  final String? schemaId;
  @JsonKey(name: 'surveyGuid', includeIfNull: false)
  final String? surveyGuid;
  @JsonKey(name: 'appId', includeIfNull: false)
  final String? appId;
  @JsonKey(name: 'surveyCreatedOn', includeIfNull: false)
  final DateTime? surveyCreatedOn;
  @JsonKey(
      name: 'schemaType',
      includeIfNull: false,
      toJson: uploadSchemaTypeToJson,
      fromJson: uploadSchemaTypeFromJson)
  final enums.UploadSchemaType? schemaType;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(
      name: 'fieldDefinitions',
      includeIfNull: false,
      defaultValue: <UploadFieldDefinition>[])
  final List<UploadFieldDefinition>? fieldDefinitions;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UploadSchemaFromJson;
  static const toJsonFactory = _$UploadSchemaToJson;
  Map<String, dynamic> toJson() => _$UploadSchemaToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UploadSchema &&
            (identical(other.maxAppVersions, maxAppVersions) ||
                const DeepCollectionEquality()
                    .equals(other.maxAppVersions, maxAppVersions)) &&
            (identical(other.minAppVersions, minAppVersions) ||
                const DeepCollectionEquality()
                    .equals(other.minAppVersions, minAppVersions)) &&
            (identical(other.moduleId, moduleId) ||
                const DeepCollectionEquality()
                    .equals(other.moduleId, moduleId)) &&
            (identical(other.moduleVersion, moduleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.moduleVersion, moduleVersion)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.schemaId, schemaId) ||
                const DeepCollectionEquality()
                    .equals(other.schemaId, schemaId)) &&
            (identical(other.surveyGuid, surveyGuid) ||
                const DeepCollectionEquality()
                    .equals(other.surveyGuid, surveyGuid)) &&
            (identical(other.appId, appId) ||
                const DeepCollectionEquality().equals(other.appId, appId)) &&
            (identical(other.surveyCreatedOn, surveyCreatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.surveyCreatedOn, surveyCreatedOn)) &&
            (identical(other.schemaType, schemaType) ||
                const DeepCollectionEquality()
                    .equals(other.schemaType, schemaType)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.fieldDefinitions, fieldDefinitions) ||
                const DeepCollectionEquality()
                    .equals(other.fieldDefinitions, fieldDefinitions)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(maxAppVersions) ^
      const DeepCollectionEquality().hash(minAppVersions) ^
      const DeepCollectionEquality().hash(moduleId) ^
      const DeepCollectionEquality().hash(moduleVersion) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(schemaId) ^
      const DeepCollectionEquality().hash(surveyGuid) ^
      const DeepCollectionEquality().hash(appId) ^
      const DeepCollectionEquality().hash(surveyCreatedOn) ^
      const DeepCollectionEquality().hash(schemaType) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(fieldDefinitions) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UploadSchemaExtension on UploadSchema {
  UploadSchema copyWith(
      {Map<String, dynamic>? maxAppVersions,
      Map<String, dynamic>? minAppVersions,
      String? moduleId,
      int? moduleVersion,
      String? name,
      num? revision,
      String? schemaId,
      String? surveyGuid,
      String? appId,
      DateTime? surveyCreatedOn,
      enums.UploadSchemaType? schemaType,
      bool? deleted,
      num? version,
      List<UploadFieldDefinition>? fieldDefinitions,
      String? type}) {
    return UploadSchema(
        maxAppVersions: maxAppVersions ?? this.maxAppVersions,
        minAppVersions: minAppVersions ?? this.minAppVersions,
        moduleId: moduleId ?? this.moduleId,
        moduleVersion: moduleVersion ?? this.moduleVersion,
        name: name ?? this.name,
        revision: revision ?? this.revision,
        schemaId: schemaId ?? this.schemaId,
        surveyGuid: surveyGuid ?? this.surveyGuid,
        appId: appId ?? this.appId,
        surveyCreatedOn: surveyCreatedOn ?? this.surveyCreatedOn,
        schemaType: schemaType ?? this.schemaType,
        deleted: deleted ?? this.deleted,
        version: version ?? this.version,
        fieldDefinitions: fieldDefinitions ?? this.fieldDefinitions,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UploadSession {
  UploadSession({
    this.id,
    this.url,
    this.expires,
    this.type,
  });

  factory UploadSession.fromJson(Map<String, dynamic> json) =>
      _$UploadSessionFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'url', includeIfNull: false)
  final String? url;
  @JsonKey(name: 'expires', includeIfNull: false)
  final DateTime? expires;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UploadSessionFromJson;
  static const toJsonFactory = _$UploadSessionToJson;
  Map<String, dynamic> toJson() => _$UploadSessionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UploadSession &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.expires, expires) ||
                const DeepCollectionEquality()
                    .equals(other.expires, expires)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(expires) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UploadSessionExtension on UploadSession {
  UploadSession copyWith(
      {String? id, String? url, DateTime? expires, String? type}) {
    return UploadSession(
        id: id ?? this.id,
        url: url ?? this.url,
        expires: expires ?? this.expires,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UploadValidationStatus {
  UploadValidationStatus({
    this.id,
    this.messageList,
    this.status,
    this.record,
    this.type,
  });

  factory UploadValidationStatus.fromJson(Map<String, dynamic> json) =>
      _$UploadValidationStatusFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'messageList', includeIfNull: false, defaultValue: <String>[])
  final List<String>? messageList;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: uploadStatusToJson,
      fromJson: uploadStatusFromJson)
  final enums.UploadStatus? status;
  @JsonKey(name: 'record', includeIfNull: false)
  final HealthDataRecord? record;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UploadValidationStatusFromJson;
  static const toJsonFactory = _$UploadValidationStatusToJson;
  Map<String, dynamic> toJson() => _$UploadValidationStatusToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UploadValidationStatus &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.messageList, messageList) ||
                const DeepCollectionEquality()
                    .equals(other.messageList, messageList)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.record, record) ||
                const DeepCollectionEquality().equals(other.record, record)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(messageList) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(record) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UploadValidationStatusExtension on UploadValidationStatus {
  UploadValidationStatus copyWith(
      {String? id,
      List<String>? messageList,
      enums.UploadStatus? status,
      HealthDataRecord? record,
      String? type}) {
    return UploadValidationStatus(
        id: id ?? this.id,
        messageList: messageList ?? this.messageList,
        status: status ?? this.status,
        record: record ?? this.record,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UserConsentHistory {
  UserConsentHistory({
    this.subpopulationGuid,
    this.consentCreatedOn,
    this.name,
    this.birthdate,
    this.imageData,
    this.imageMimeType,
    this.signedOn,
    this.withdrewOn,
    this.hasSignedActiveConsent,
    this.type,
  });

  factory UserConsentHistory.fromJson(Map<String, dynamic> json) =>
      _$UserConsentHistoryFromJson(json);

  @JsonKey(name: 'subpopulationGuid', includeIfNull: false)
  final String? subpopulationGuid;
  @JsonKey(name: 'consentCreatedOn', includeIfNull: false)
  final DateTime? consentCreatedOn;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'birthdate', includeIfNull: false, toJson: _dateToJson)
  final DateTime? birthdate;
  @JsonKey(name: 'imageData', includeIfNull: false)
  final String? imageData;
  @JsonKey(name: 'imageMimeType', includeIfNull: false)
  final String? imageMimeType;
  @JsonKey(name: 'signedOn', includeIfNull: false)
  final DateTime? signedOn;
  @JsonKey(name: 'withdrewOn', includeIfNull: false)
  final DateTime? withdrewOn;
  @JsonKey(name: 'hasSignedActiveConsent', includeIfNull: false)
  final bool? hasSignedActiveConsent;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UserConsentHistoryFromJson;
  static const toJsonFactory = _$UserConsentHistoryToJson;
  Map<String, dynamic> toJson() => _$UserConsentHistoryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserConsentHistory &&
            (identical(other.subpopulationGuid, subpopulationGuid) ||
                const DeepCollectionEquality()
                    .equals(other.subpopulationGuid, subpopulationGuid)) &&
            (identical(other.consentCreatedOn, consentCreatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.consentCreatedOn, consentCreatedOn)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.birthdate, birthdate) ||
                const DeepCollectionEquality()
                    .equals(other.birthdate, birthdate)) &&
            (identical(other.imageData, imageData) ||
                const DeepCollectionEquality()
                    .equals(other.imageData, imageData)) &&
            (identical(other.imageMimeType, imageMimeType) ||
                const DeepCollectionEquality()
                    .equals(other.imageMimeType, imageMimeType)) &&
            (identical(other.signedOn, signedOn) ||
                const DeepCollectionEquality()
                    .equals(other.signedOn, signedOn)) &&
            (identical(other.withdrewOn, withdrewOn) ||
                const DeepCollectionEquality()
                    .equals(other.withdrewOn, withdrewOn)) &&
            (identical(other.hasSignedActiveConsent, hasSignedActiveConsent) ||
                const DeepCollectionEquality().equals(
                    other.hasSignedActiveConsent, hasSignedActiveConsent)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(subpopulationGuid) ^
      const DeepCollectionEquality().hash(consentCreatedOn) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(birthdate) ^
      const DeepCollectionEquality().hash(imageData) ^
      const DeepCollectionEquality().hash(imageMimeType) ^
      const DeepCollectionEquality().hash(signedOn) ^
      const DeepCollectionEquality().hash(withdrewOn) ^
      const DeepCollectionEquality().hash(hasSignedActiveConsent) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UserConsentHistoryExtension on UserConsentHistory {
  UserConsentHistory copyWith(
      {String? subpopulationGuid,
      DateTime? consentCreatedOn,
      String? name,
      DateTime? birthdate,
      String? imageData,
      String? imageMimeType,
      DateTime? signedOn,
      DateTime? withdrewOn,
      bool? hasSignedActiveConsent,
      String? type}) {
    return UserConsentHistory(
        subpopulationGuid: subpopulationGuid ?? this.subpopulationGuid,
        consentCreatedOn: consentCreatedOn ?? this.consentCreatedOn,
        name: name ?? this.name,
        birthdate: birthdate ?? this.birthdate,
        imageData: imageData ?? this.imageData,
        imageMimeType: imageMimeType ?? this.imageMimeType,
        signedOn: signedOn ?? this.signedOn,
        withdrewOn: withdrewOn ?? this.withdrewOn,
        hasSignedActiveConsent:
            hasSignedActiveConsent ?? this.hasSignedActiveConsent,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UserSessionInfo {
  UserSessionInfo({
    this.firstName,
    this.lastName,
    this.externalId,
    this.id,
    this.notifyByEmail,
    this.attributes,
    this.sharingScope,
    this.createdOn,
    this.emailVerified,
    this.phoneVerified,
    this.status,
    this.roles,
    this.dataGroups,
    this.clientData,
    this.languages,
    this.studyIds,
    this.externalIds,
    this.authenticated,
    this.sessionToken,
    this.reauthToken,
    this.environment,
    this.email,
    this.phone,
    this.dataSharing,
    this.signedMostRecentConsent,
    this.synapseUserId,
    this.consented,
    this.consentStatuses,
    this.enrollments,
    this.orgMembership,
    this.type,
  });

  factory UserSessionInfo.fromJson(Map<String, dynamic> json) =>
      _$UserSessionInfoFromJson(json);

  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'externalId', includeIfNull: false)
  final String? externalId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'notifyByEmail', includeIfNull: false, defaultValue: true)
  final bool? notifyByEmail;
  @JsonKey(name: 'attributes', includeIfNull: false)
  final Map<String, dynamic>? attributes;
  @JsonKey(
      name: 'sharingScope',
      includeIfNull: false,
      toJson: sharingScopeToJson,
      fromJson: sharingScopeFromJson)
  final enums.SharingScope? sharingScope;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'emailVerified', includeIfNull: false)
  final bool? emailVerified;
  @JsonKey(name: 'phoneVerified', includeIfNull: false)
  final bool? phoneVerified;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: accountStatusToJson,
      fromJson: accountStatusFromJson)
  final enums.AccountStatus? status;
  @JsonKey(
      name: 'roles',
      includeIfNull: false,
      toJson: roleListToJson,
      fromJson: roleListFromJson)
  final List<enums.Role>? roles;
  @JsonKey(name: 'dataGroups', includeIfNull: false, defaultValue: <String>[])
  final List<String>? dataGroups;
  @JsonKey(name: 'clientData', includeIfNull: false)
  final Map<String, dynamic>? clientData;
  @JsonKey(name: 'languages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? languages;
  @JsonKey(name: 'studyIds', includeIfNull: false, defaultValue: <String>[])
  final List<String>? studyIds;
  @JsonKey(name: 'externalIds', includeIfNull: false)
  final Map<String, dynamic>? externalIds;
  @JsonKey(name: 'authenticated', includeIfNull: false)
  final bool? authenticated;
  @JsonKey(name: 'sessionToken', includeIfNull: false)
  final String? sessionToken;
  @JsonKey(name: 'reauthToken', includeIfNull: false)
  final String? reauthToken;
  @JsonKey(
      name: 'environment',
      includeIfNull: false,
      toJson: environmentToJson,
      fromJson: environmentFromJson)
  final enums.Environment? environment;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phone', includeIfNull: false)
  final Phone? phone;
  @JsonKey(name: 'dataSharing', includeIfNull: false)
  final bool? dataSharing;
  @JsonKey(name: 'signedMostRecentConsent', includeIfNull: false)
  final bool? signedMostRecentConsent;
  @JsonKey(name: 'synapseUserId', includeIfNull: false)
  final String? synapseUserId;
  @JsonKey(name: 'consented', includeIfNull: false)
  final bool? consented;
  @JsonKey(name: 'consentStatuses', includeIfNull: false)
  final Map<String, dynamic>? consentStatuses;
  @JsonKey(name: 'enrollments', includeIfNull: false)
  final Map<String, dynamic>? enrollments;
  @JsonKey(name: 'orgMembership', includeIfNull: false)
  final String? orgMembership;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UserSessionInfoFromJson;
  static const toJsonFactory = _$UserSessionInfoToJson;
  Map<String, dynamic> toJson() => _$UserSessionInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserSessionInfo &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.notifyByEmail, notifyByEmail) ||
                const DeepCollectionEquality()
                    .equals(other.notifyByEmail, notifyByEmail)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)) &&
            (identical(other.sharingScope, sharingScope) ||
                const DeepCollectionEquality()
                    .equals(other.sharingScope, sharingScope)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.phoneVerified, phoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.phoneVerified, phoneVerified)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.dataGroups, dataGroups) ||
                const DeepCollectionEquality()
                    .equals(other.dataGroups, dataGroups)) &&
            (identical(other.clientData, clientData) ||
                const DeepCollectionEquality()
                    .equals(other.clientData, clientData)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.studyIds, studyIds) ||
                const DeepCollectionEquality()
                    .equals(other.studyIds, studyIds)) &&
            (identical(other.externalIds, externalIds) ||
                const DeepCollectionEquality()
                    .equals(other.externalIds, externalIds)) &&
            (identical(other.authenticated, authenticated) ||
                const DeepCollectionEquality()
                    .equals(other.authenticated, authenticated)) &&
            (identical(other.sessionToken, sessionToken) ||
                const DeepCollectionEquality()
                    .equals(other.sessionToken, sessionToken)) &&
            (identical(other.reauthToken, reauthToken) ||
                const DeepCollectionEquality()
                    .equals(other.reauthToken, reauthToken)) &&
            (identical(other.environment, environment) ||
                const DeepCollectionEquality()
                    .equals(other.environment, environment)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.dataSharing, dataSharing) ||
                const DeepCollectionEquality()
                    .equals(other.dataSharing, dataSharing)) &&
            (identical(other.signedMostRecentConsent, signedMostRecentConsent) || const DeepCollectionEquality().equals(other.signedMostRecentConsent, signedMostRecentConsent)) &&
            (identical(other.synapseUserId, synapseUserId) || const DeepCollectionEquality().equals(other.synapseUserId, synapseUserId)) &&
            (identical(other.consented, consented) || const DeepCollectionEquality().equals(other.consented, consented)) &&
            (identical(other.consentStatuses, consentStatuses) || const DeepCollectionEquality().equals(other.consentStatuses, consentStatuses)) &&
            (identical(other.enrollments, enrollments) || const DeepCollectionEquality().equals(other.enrollments, enrollments)) &&
            (identical(other.orgMembership, orgMembership) || const DeepCollectionEquality().equals(other.orgMembership, orgMembership)) &&
            (identical(other.type, type) || const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(notifyByEmail) ^
      const DeepCollectionEquality().hash(attributes) ^
      const DeepCollectionEquality().hash(sharingScope) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(phoneVerified) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(dataGroups) ^
      const DeepCollectionEquality().hash(clientData) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(studyIds) ^
      const DeepCollectionEquality().hash(externalIds) ^
      const DeepCollectionEquality().hash(authenticated) ^
      const DeepCollectionEquality().hash(sessionToken) ^
      const DeepCollectionEquality().hash(reauthToken) ^
      const DeepCollectionEquality().hash(environment) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(dataSharing) ^
      const DeepCollectionEquality().hash(signedMostRecentConsent) ^
      const DeepCollectionEquality().hash(synapseUserId) ^
      const DeepCollectionEquality().hash(consented) ^
      const DeepCollectionEquality().hash(consentStatuses) ^
      const DeepCollectionEquality().hash(enrollments) ^
      const DeepCollectionEquality().hash(orgMembership) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UserSessionInfoExtension on UserSessionInfo {
  UserSessionInfo copyWith(
      {String? firstName,
      String? lastName,
      String? externalId,
      String? id,
      bool? notifyByEmail,
      Map<String, dynamic>? attributes,
      enums.SharingScope? sharingScope,
      DateTime? createdOn,
      bool? emailVerified,
      bool? phoneVerified,
      enums.AccountStatus? status,
      List<enums.Role>? roles,
      List<String>? dataGroups,
      Map<String, dynamic>? clientData,
      List<String>? languages,
      List<String>? studyIds,
      Map<String, dynamic>? externalIds,
      bool? authenticated,
      String? sessionToken,
      String? reauthToken,
      enums.Environment? environment,
      String? email,
      Phone? phone,
      bool? dataSharing,
      bool? signedMostRecentConsent,
      String? synapseUserId,
      bool? consented,
      Map<String, dynamic>? consentStatuses,
      Map<String, dynamic>? enrollments,
      String? orgMembership,
      String? type}) {
    return UserSessionInfo(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        externalId: externalId ?? this.externalId,
        id: id ?? this.id,
        notifyByEmail: notifyByEmail ?? this.notifyByEmail,
        attributes: attributes ?? this.attributes,
        sharingScope: sharingScope ?? this.sharingScope,
        createdOn: createdOn ?? this.createdOn,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneVerified: phoneVerified ?? this.phoneVerified,
        status: status ?? this.status,
        roles: roles ?? this.roles,
        dataGroups: dataGroups ?? this.dataGroups,
        clientData: clientData ?? this.clientData,
        languages: languages ?? this.languages,
        studyIds: studyIds ?? this.studyIds,
        externalIds: externalIds ?? this.externalIds,
        authenticated: authenticated ?? this.authenticated,
        sessionToken: sessionToken ?? this.sessionToken,
        reauthToken: reauthToken ?? this.reauthToken,
        environment: environment ?? this.environment,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        dataSharing: dataSharing ?? this.dataSharing,
        signedMostRecentConsent:
            signedMostRecentConsent ?? this.signedMostRecentConsent,
        synapseUserId: synapseUserId ?? this.synapseUserId,
        consented: consented ?? this.consented,
        consentStatuses: consentStatuses ?? this.consentStatuses,
        enrollments: enrollments ?? this.enrollments,
        orgMembership: orgMembership ?? this.orgMembership,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Verification {
  Verification({
    this.sptoken,
    this.type,
  });

  factory Verification.fromJson(Map<String, dynamic> json) =>
      _$VerificationFromJson(json);

  @JsonKey(name: 'sptoken', includeIfNull: false)
  final String? sptoken;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$VerificationFromJson;
  static const toJsonFactory = _$VerificationToJson;
  Map<String, dynamic> toJson() => _$VerificationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Verification &&
            (identical(other.sptoken, sptoken) ||
                const DeepCollectionEquality()
                    .equals(other.sptoken, sptoken)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sptoken) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $VerificationExtension on Verification {
  Verification copyWith({String? sptoken, String? type}) {
    return Verification(
        sptoken: sptoken ?? this.sptoken, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class VersionHolder {
  VersionHolder({
    this.version,
    this.type,
  });

  factory VersionHolder.fromJson(Map<String, dynamic> json) =>
      _$VersionHolderFromJson(json);

  @JsonKey(name: 'version', includeIfNull: false)
  final num? version;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$VersionHolderFromJson;
  static const toJsonFactory = _$VersionHolderToJson;
  Map<String, dynamic> toJson() => _$VersionHolderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VersionHolder &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $VersionHolderExtension on VersionHolder {
  VersionHolder copyWith({num? version, String? type}) {
    return VersionHolder(
        version: version ?? this.version, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Withdrawal {
  Withdrawal({
    this.reason,
    this.type,
  });

  factory Withdrawal.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalFromJson(json);

  @JsonKey(name: 'reason', includeIfNull: false)
  final String? reason;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$WithdrawalFromJson;
  static const toJsonFactory = _$WithdrawalToJson;
  Map<String, dynamic> toJson() => _$WithdrawalToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Withdrawal &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $WithdrawalExtension on Withdrawal {
  Withdrawal copyWith({String? reason, String? type}) {
    return Withdrawal(reason: reason ?? this.reason, type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ResourceList {
  ResourceList({
    this.requestParams,
    this.type,
  });

  factory ResourceList.fromJson(Map<String, dynamic> json) =>
      _$ResourceListFromJson(json);

  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ResourceListFromJson;
  static const toJsonFactory = _$ResourceListToJson;
  Map<String, dynamic> toJson() => _$ResourceListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ResourceList &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ResourceListExtension on ResourceList {
  ResourceList copyWith({RequestParams? requestParams, String? type}) {
    return ResourceList(
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class PagedResourceList {
  PagedResourceList({
    this.total,
    this.requestParams,
    this.type,
  });

  factory PagedResourceList.fromJson(Map<String, dynamic> json) =>
      _$PagedResourceListFromJson(json);

  @JsonKey(name: 'total', includeIfNull: false)
  final int? total;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$PagedResourceListFromJson;
  static const toJsonFactory = _$PagedResourceListToJson;
  Map<String, dynamic> toJson() => _$PagedResourceListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PagedResourceList &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PagedResourceListExtension on PagedResourceList {
  PagedResourceList copyWith(
      {int? total, RequestParams? requestParams, String? type}) {
    return PagedResourceList(
        total: total ?? this.total,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ForwardCursorPagedResourceList {
  ForwardCursorPagedResourceList({
    this.nextPageOffsetKey,
    this.hasNext,
    this.requestParams,
    this.type,
  });

  factory ForwardCursorPagedResourceList.fromJson(Map<String, dynamic> json) =>
      _$ForwardCursorPagedResourceListFromJson(json);

  @JsonKey(name: 'nextPageOffsetKey', includeIfNull: false)
  final String? nextPageOffsetKey;
  @JsonKey(name: 'hasNext', includeIfNull: false)
  final bool? hasNext;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ForwardCursorPagedResourceListFromJson;
  static const toJsonFactory = _$ForwardCursorPagedResourceListToJson;
  Map<String, dynamic> toJson() => _$ForwardCursorPagedResourceListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForwardCursorPagedResourceList &&
            (identical(other.nextPageOffsetKey, nextPageOffsetKey) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageOffsetKey, nextPageOffsetKey)) &&
            (identical(other.hasNext, hasNext) ||
                const DeepCollectionEquality()
                    .equals(other.hasNext, hasNext)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(nextPageOffsetKey) ^
      const DeepCollectionEquality().hash(hasNext) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ForwardCursorPagedResourceListExtension
    on ForwardCursorPagedResourceList {
  ForwardCursorPagedResourceList copyWith(
      {String? nextPageOffsetKey,
      bool? hasNext,
      RequestParams? requestParams,
      String? type}) {
    return ForwardCursorPagedResourceList(
        nextPageOffsetKey: nextPageOffsetKey ?? this.nextPageOffsetKey,
        hasNext: hasNext ?? this.hasNext,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AccountSummaryList {
  AccountSummaryList({
    this.items,
  });

  factory AccountSummaryList.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <AccountSummary>[])
  final List<AccountSummary>? items;
  static const fromJsonFactory = _$AccountSummaryListFromJson;
  static const toJsonFactory = _$AccountSummaryListToJson;
  Map<String, dynamic> toJson() => _$AccountSummaryListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountSummaryList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $AccountSummaryListExtension on AccountSummaryList {
  AccountSummaryList copyWith({List<AccountSummary>? items}) {
    return AccountSummaryList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivityList {
  ActivityList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ActivityList.fromJson(Map<String, dynamic> json) =>
      _$ActivityListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ScheduledActivity>[])
  final List<ScheduledActivity>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ActivityListFromJson;
  static const toJsonFactory = _$ActivityListToJson;
  Map<String, dynamic> toJson() => _$ActivityListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivityList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ActivityListExtension on ActivityList {
  ActivityList copyWith(
      {List<ScheduledActivity>? items,
      RequestParams? requestParams,
      String? type}) {
    return ActivityList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivityEventList {
  ActivityEventList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ActivityEventList.fromJson(Map<String, dynamic> json) =>
      _$ActivityEventListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <ActivityEvent>[])
  final List<ActivityEvent>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ActivityEventListFromJson;
  static const toJsonFactory = _$ActivityEventListToJson;
  Map<String, dynamic> toJson() => _$ActivityEventListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivityEventList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ActivityEventListExtension on ActivityEventList {
  ActivityEventList copyWith(
      {List<ActivityEvent>? items,
      RequestParams? requestParams,
      String? type}) {
    return ActivityEventList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AdherenceRecordList {
  AdherenceRecordList({
    this.items,
  });

  factory AdherenceRecordList.fromJson(Map<String, dynamic> json) =>
      _$AdherenceRecordListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <AdherenceRecord>[])
  final List<AdherenceRecord>? items;
  static const fromJsonFactory = _$AdherenceRecordListFromJson;
  static const toJsonFactory = _$AdherenceRecordListToJson;
  Map<String, dynamic> toJson() => _$AdherenceRecordListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AdherenceRecordList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $AdherenceRecordListExtension on AdherenceRecordList {
  AdherenceRecordList copyWith({List<AdherenceRecord>? items}) {
    return AdherenceRecordList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class AppConfigList {
  AppConfigList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory AppConfigList.fromJson(Map<String, dynamic> json) =>
      _$AppConfigListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <AppConfig>[])
  final List<AppConfig>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppConfigListFromJson;
  static const toJsonFactory = _$AppConfigListToJson;
  Map<String, dynamic> toJson() => _$AppConfigListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppConfigList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppConfigListExtension on AppConfigList {
  AppConfigList copyWith(
      {List<AppConfig>? items, RequestParams? requestParams, String? type}) {
    return AppConfigList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AppConfigElementList {
  AppConfigElementList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory AppConfigElementList.fromJson(Map<String, dynamic> json) =>
      _$AppConfigElementListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <AppConfigElement>[])
  final List<AppConfigElement>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppConfigElementListFromJson;
  static const toJsonFactory = _$AppConfigElementListToJson;
  Map<String, dynamic> toJson() => _$AppConfigElementListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppConfigElementList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppConfigElementListExtension on AppConfigElementList {
  AppConfigElementList copyWith(
      {List<AppConfigElement>? items,
      RequestParams? requestParams,
      String? type}) {
    return AppConfigElementList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AppList {
  AppList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory AppList.fromJson(Map<String, dynamic> json) =>
      _$AppListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <App>[])
  final List<App>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$AppListFromJson;
  static const toJsonFactory = _$AppListToJson;
  Map<String, dynamic> toJson() => _$AppListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AppListExtension on AppList {
  AppList copyWith(
      {List<App>? items, RequestParams? requestParams, String? type}) {
    return AppList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class AssessmentList {
  AssessmentList({
    this.items,
  });

  factory AssessmentList.fromJson(Map<String, dynamic> json) =>
      _$AssessmentListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Assessment>[])
  final List<Assessment>? items;
  static const fromJsonFactory = _$AssessmentListFromJson;
  static const toJsonFactory = _$AssessmentListToJson;
  Map<String, dynamic> toJson() => _$AssessmentListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssessmentList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $AssessmentListExtension on AssessmentList {
  AssessmentList copyWith({List<Assessment>? items}) {
    return AssessmentList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class CompoundActivityDefinitionList {
  CompoundActivityDefinitionList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory CompoundActivityDefinitionList.fromJson(Map<String, dynamic> json) =>
      _$CompoundActivityDefinitionListFromJson(json);

  @JsonKey(
      name: 'items',
      includeIfNull: false,
      defaultValue: <CompoundActivityDefinition>[])
  final List<CompoundActivityDefinition>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$CompoundActivityDefinitionListFromJson;
  static const toJsonFactory = _$CompoundActivityDefinitionListToJson;
  Map<String, dynamic> toJson() => _$CompoundActivityDefinitionListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CompoundActivityDefinitionList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $CompoundActivityDefinitionListExtension
    on CompoundActivityDefinitionList {
  CompoundActivityDefinitionList copyWith(
      {List<CompoundActivityDefinition>? items,
      RequestParams? requestParams,
      String? type}) {
    return CompoundActivityDefinitionList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class EnrollmentDetailList {
  EnrollmentDetailList({
    this.items,
  });

  factory EnrollmentDetailList.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentDetailListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <EnrollmentDetail>[])
  final List<EnrollmentDetail>? items;
  static const fromJsonFactory = _$EnrollmentDetailListFromJson;
  static const toJsonFactory = _$EnrollmentDetailListToJson;
  Map<String, dynamic> toJson() => _$EnrollmentDetailListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrollmentDetailList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $EnrollmentDetailListExtension on EnrollmentDetailList {
  EnrollmentDetailList copyWith({List<EnrollmentDetail>? items}) {
    return EnrollmentDetailList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ExternalIdentifierList {
  ExternalIdentifierList({
    this.items,
  });

  factory ExternalIdentifierList.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdentifierListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ExternalIdentifier>[])
  final List<ExternalIdentifier>? items;
  static const fromJsonFactory = _$ExternalIdentifierListFromJson;
  static const toJsonFactory = _$ExternalIdentifierListToJson;
  Map<String, dynamic> toJson() => _$ExternalIdentifierListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExternalIdentifierList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $ExternalIdentifierListExtension on ExternalIdentifierList {
  ExternalIdentifierList copyWith({List<ExternalIdentifier>? items}) {
    return ExternalIdentifierList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ExternalResourceList {
  ExternalResourceList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ExternalResourceList.fromJson(Map<String, dynamic> json) =>
      _$ExternalResourceListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ExternalResource>[])
  final List<ExternalResource>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ExternalResourceListFromJson;
  static const toJsonFactory = _$ExternalResourceListToJson;
  Map<String, dynamic> toJson() => _$ExternalResourceListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExternalResourceList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ExternalResourceListExtension on ExternalResourceList {
  ExternalResourceList copyWith(
      {List<ExternalResource>? items,
      RequestParams? requestParams,
      String? type}) {
    return ExternalResourceList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class FileMetadataList {
  FileMetadataList({
    this.items,
  });

  factory FileMetadataList.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <FileMetadata>[])
  final List<FileMetadata>? items;
  static const fromJsonFactory = _$FileMetadataListFromJson;
  static const toJsonFactory = _$FileMetadataListToJson;
  Map<String, dynamic> toJson() => _$FileMetadataListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileMetadataList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $FileMetadataListExtension on FileMetadataList {
  FileMetadataList copyWith({List<FileMetadata>? items}) {
    return FileMetadataList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class FileRevisionList {
  FileRevisionList({
    this.items,
  });

  factory FileRevisionList.fromJson(Map<String, dynamic> json) =>
      _$FileRevisionListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <FileRevision>[])
  final List<FileRevision>? items;
  static const fromJsonFactory = _$FileRevisionListFromJson;
  static const toJsonFactory = _$FileRevisionListToJson;
  Map<String, dynamic> toJson() => _$FileRevisionListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileRevisionList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $FileRevisionListExtension on FileRevisionList {
  FileRevisionList copyWith({List<FileRevision>? items}) {
    return FileRevisionList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class HealthDataDocumentationList {
  HealthDataDocumentationList({
    this.items,
  });

  factory HealthDataDocumentationList.fromJson(Map<String, dynamic> json) =>
      _$HealthDataDocumentationListFromJson(json);

  @JsonKey(
      name: 'items',
      includeIfNull: false,
      defaultValue: <HealthDataDocumentation>[])
  final List<HealthDataDocumentation>? items;
  static const fromJsonFactory = _$HealthDataDocumentationListFromJson;
  static const toJsonFactory = _$HealthDataDocumentationListToJson;
  Map<String, dynamic> toJson() => _$HealthDataDocumentationListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HealthDataDocumentationList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $HealthDataDocumentationListExtension on HealthDataDocumentationList {
  HealthDataDocumentationList copyWith({List<HealthDataDocumentation>? items}) {
    return HealthDataDocumentationList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class HealthDataRecordList {
  HealthDataRecordList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory HealthDataRecordList.fromJson(Map<String, dynamic> json) =>
      _$HealthDataRecordListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <HealthDataRecord>[])
  final List<HealthDataRecord>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$HealthDataRecordListFromJson;
  static const toJsonFactory = _$HealthDataRecordListToJson;
  Map<String, dynamic> toJson() => _$HealthDataRecordListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HealthDataRecordList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $HealthDataRecordListExtension on HealthDataRecordList {
  HealthDataRecordList copyWith(
      {List<HealthDataRecord>? items,
      RequestParams? requestParams,
      String? type}) {
    return HealthDataRecordList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class HealthDataRecordEx3List {
  HealthDataRecordEx3List({
    this.items,
  });

  factory HealthDataRecordEx3List.fromJson(Map<String, dynamic> json) =>
      _$HealthDataRecordEx3ListFromJson(json);

  @JsonKey(
      name: 'items',
      includeIfNull: false,
      defaultValue: <HealthDataRecordEx3>[])
  final List<HealthDataRecordEx3>? items;
  static const fromJsonFactory = _$HealthDataRecordEx3ListFromJson;
  static const toJsonFactory = _$HealthDataRecordEx3ListToJson;
  Map<String, dynamic> toJson() => _$HealthDataRecordEx3ListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HealthDataRecordEx3List &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $HealthDataRecordEx3ListExtension on HealthDataRecordEx3List {
  HealthDataRecordEx3List copyWith({List<HealthDataRecordEx3>? items}) {
    return HealthDataRecordEx3List(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationRegistrationList {
  NotificationRegistrationList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory NotificationRegistrationList.fromJson(Map<String, dynamic> json) =>
      _$NotificationRegistrationListFromJson(json);

  @JsonKey(
      name: 'items',
      includeIfNull: false,
      defaultValue: <NotificationRegistration>[])
  final List<NotificationRegistration>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$NotificationRegistrationListFromJson;
  static const toJsonFactory = _$NotificationRegistrationListToJson;
  Map<String, dynamic> toJson() => _$NotificationRegistrationListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationRegistrationList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $NotificationRegistrationListExtension
    on NotificationRegistrationList {
  NotificationRegistrationList copyWith(
      {List<NotificationRegistration>? items,
      RequestParams? requestParams,
      String? type}) {
    return NotificationRegistrationList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationTopicList {
  NotificationTopicList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory NotificationTopicList.fromJson(Map<String, dynamic> json) =>
      _$NotificationTopicListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <NotificationTopic>[])
  final List<NotificationTopic>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$NotificationTopicListFromJson;
  static const toJsonFactory = _$NotificationTopicListToJson;
  Map<String, dynamic> toJson() => _$NotificationTopicListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationTopicList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $NotificationTopicListExtension on NotificationTopicList {
  NotificationTopicList copyWith(
      {List<NotificationTopic>? items,
      RequestParams? requestParams,
      String? type}) {
    return NotificationTopicList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class MasterSchedulerConfigList {
  MasterSchedulerConfigList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory MasterSchedulerConfigList.fromJson(Map<String, dynamic> json) =>
      _$MasterSchedulerConfigListFromJson(json);

  @JsonKey(
      name: 'items',
      includeIfNull: false,
      defaultValue: <MasterSchedulerConfig>[])
  final List<MasterSchedulerConfig>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$MasterSchedulerConfigListFromJson;
  static const toJsonFactory = _$MasterSchedulerConfigListToJson;
  Map<String, dynamic> toJson() => _$MasterSchedulerConfigListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MasterSchedulerConfigList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $MasterSchedulerConfigListExtension on MasterSchedulerConfigList {
  MasterSchedulerConfigList copyWith(
      {List<MasterSchedulerConfig>? items,
      RequestParams? requestParams,
      String? type}) {
    return MasterSchedulerConfigList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class PagedExternalResourceList {
  PagedExternalResourceList({
    this.items,
  });

  factory PagedExternalResourceList.fromJson(Map<String, dynamic> json) =>
      _$PagedExternalResourceListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ExternalResource>[])
  final List<ExternalResource>? items;
  static const fromJsonFactory = _$PagedExternalResourceListFromJson;
  static const toJsonFactory = _$PagedExternalResourceListToJson;
  Map<String, dynamic> toJson() => _$PagedExternalResourceListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PagedExternalResourceList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $PagedExternalResourceListExtension on PagedExternalResourceList {
  PagedExternalResourceList copyWith({List<ExternalResource>? items}) {
    return PagedExternalResourceList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ReportDataList {
  ReportDataList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ReportDataList.fromJson(Map<String, dynamic> json) =>
      _$ReportDataListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <ReportData>[])
  final List<ReportData>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ReportDataListFromJson;
  static const toJsonFactory = _$ReportDataListToJson;
  Map<String, dynamic> toJson() => _$ReportDataListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportDataList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ReportDataListExtension on ReportDataList {
  ReportDataList copyWith(
      {List<ReportData>? items, RequestParams? requestParams, String? type}) {
    return ReportDataList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ForwardCursorReportDataList {
  ForwardCursorReportDataList({
    this.items,
  });

  factory ForwardCursorReportDataList.fromJson(Map<String, dynamic> json) =>
      _$ForwardCursorReportDataListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <ReportData>[])
  final List<ReportData>? items;
  static const fromJsonFactory = _$ForwardCursorReportDataListFromJson;
  static const toJsonFactory = _$ForwardCursorReportDataListToJson;
  Map<String, dynamic> toJson() => _$ForwardCursorReportDataListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForwardCursorReportDataList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $ForwardCursorReportDataListExtension on ForwardCursorReportDataList {
  ForwardCursorReportDataList copyWith({List<ReportData>? items}) {
    return ForwardCursorReportDataList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class OrganizationList {
  OrganizationList({
    this.items,
  });

  factory OrganizationList.fromJson(Map<String, dynamic> json) =>
      _$OrganizationListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Organization>[])
  final List<Organization>? items;
  static const fromJsonFactory = _$OrganizationListFromJson;
  static const toJsonFactory = _$OrganizationListToJson;
  Map<String, dynamic> toJson() => _$OrganizationListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrganizationList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $OrganizationListExtension on OrganizationList {
  OrganizationList copyWith({List<Organization>? items}) {
    return OrganizationList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ParticipantDataList {
  ParticipantDataList({
    this.items,
  });

  factory ParticipantDataList.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDataListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ParticipantData>[])
  final List<ParticipantData>? items;
  static const fromJsonFactory = _$ParticipantDataListFromJson;
  static const toJsonFactory = _$ParticipantDataListToJson;
  Map<String, dynamic> toJson() => _$ParticipantDataListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParticipantDataList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $ParticipantDataListExtension on ParticipantDataList {
  ParticipantDataList copyWith({List<ParticipantData>? items}) {
    return ParticipantDataList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ParticipantFileList {
  ParticipantFileList({
    this.items,
  });

  factory ParticipantFileList.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFileListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ParticipantFile>[])
  final List<ParticipantFile>? items;
  static const fromJsonFactory = _$ParticipantFileListFromJson;
  static const toJsonFactory = _$ParticipantFileListToJson;
  Map<String, dynamic> toJson() => _$ParticipantFileListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParticipantFileList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $ParticipantFileListExtension on ParticipantFileList {
  ParticipantFileList copyWith({List<ParticipantFile>? items}) {
    return ParticipantFileList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ParticipantVersionList {
  ParticipantVersionList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ParticipantVersionList.fromJson(Map<String, dynamic> json) =>
      _$ParticipantVersionListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ParticipantVersion>[])
  final List<ParticipantVersion>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ParticipantVersionListFromJson;
  static const toJsonFactory = _$ParticipantVersionListToJson;
  Map<String, dynamic> toJson() => _$ParticipantVersionListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParticipantVersionList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ParticipantVersionListExtension on ParticipantVersionList {
  ParticipantVersionList copyWith(
      {List<ParticipantVersion>? items,
      RequestParams? requestParams,
      String? type}) {
    return ParticipantVersionList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ReportIndexList {
  ReportIndexList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ReportIndexList.fromJson(Map<String, dynamic> json) =>
      _$ReportIndexListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <ReportIndex>[])
  final List<ReportIndex>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ReportIndexListFromJson;
  static const toJsonFactory = _$ReportIndexListToJson;
  Map<String, dynamic> toJson() => _$ReportIndexListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportIndexList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ReportIndexListExtension on ReportIndexList {
  ReportIndexList copyWith(
      {List<ReportIndex>? items, RequestParams? requestParams, String? type}) {
    return ReportIndexList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduleList {
  ScheduleList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ScheduleList.fromJson(Map<String, dynamic> json) =>
      _$ScheduleListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Schedule>[])
  final List<Schedule>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduleListFromJson;
  static const toJsonFactory = _$ScheduleListToJson;
  Map<String, dynamic> toJson() => _$ScheduleListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduleList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduleListExtension on ScheduleList {
  ScheduleList copyWith(
      {List<Schedule>? items, RequestParams? requestParams, String? type}) {
    return ScheduleList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledActivityList {
  ScheduledActivityList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ScheduledActivityList.fromJson(Map<String, dynamic> json) =>
      _$ScheduledActivityListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ScheduledActivity>[])
  final List<ScheduledActivity>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduledActivityListFromJson;
  static const toJsonFactory = _$ScheduledActivityListToJson;
  Map<String, dynamic> toJson() => _$ScheduledActivityListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduledActivityList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduledActivityListExtension on ScheduledActivityList {
  ScheduledActivityList copyWith(
      {List<ScheduledActivity>? items,
      RequestParams? requestParams,
      String? type}) {
    return ScheduledActivityList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledActivityListV4 {
  ScheduledActivityListV4({
    this.items,
    this.requestParams,
    this.type,
  });

  factory ScheduledActivityListV4.fromJson(Map<String, dynamic> json) =>
      _$ScheduledActivityListV4FromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ScheduledActivity>[])
  final List<ScheduledActivity>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ScheduledActivityListV4FromJson;
  static const toJsonFactory = _$ScheduledActivityListV4ToJson;
  Map<String, dynamic> toJson() => _$ScheduledActivityListV4ToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScheduledActivityListV4 &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ScheduledActivityListV4Extension on ScheduledActivityListV4 {
  ScheduledActivityListV4 copyWith(
      {List<ScheduledActivity>? items,
      RequestParams? requestParams,
      String? type}) {
    return ScheduledActivityListV4(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class ForwardCursorScheduledActivityList {
  ForwardCursorScheduledActivityList({
    this.items,
  });

  factory ForwardCursorScheduledActivityList.fromJson(
          Map<String, dynamic> json) =>
      _$ForwardCursorScheduledActivityListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <ScheduledActivity>[])
  final List<ScheduledActivity>? items;
  static const fromJsonFactory = _$ForwardCursorScheduledActivityListFromJson;
  static const toJsonFactory = _$ForwardCursorScheduledActivityListToJson;
  Map<String, dynamic> toJson() =>
      _$ForwardCursorScheduledActivityListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForwardCursorScheduledActivityList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $ForwardCursorScheduledActivityListExtension
    on ForwardCursorScheduledActivityList {
  ForwardCursorScheduledActivityList copyWith(
      {List<ScheduledActivity>? items}) {
    return ForwardCursorScheduledActivityList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class ForwardCursorStringList {
  ForwardCursorStringList({
    this.items,
  });

  factory ForwardCursorStringList.fromJson(Map<String, dynamic> json) =>
      _$ForwardCursorStringListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <String>[])
  final List<String>? items;
  static const fromJsonFactory = _$ForwardCursorStringListFromJson;
  static const toJsonFactory = _$ForwardCursorStringListToJson;
  Map<String, dynamic> toJson() => _$ForwardCursorStringListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForwardCursorStringList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $ForwardCursorStringListExtension on ForwardCursorStringList {
  ForwardCursorStringList copyWith({List<String>? items}) {
    return ForwardCursorStringList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class SchedulePlanList {
  SchedulePlanList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory SchedulePlanList.fromJson(Map<String, dynamic> json) =>
      _$SchedulePlanListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <SchedulePlan>[])
  final List<SchedulePlan>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SchedulePlanListFromJson;
  static const toJsonFactory = _$SchedulePlanListToJson;
  Map<String, dynamic> toJson() => _$SchedulePlanListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SchedulePlanList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SchedulePlanListExtension on SchedulePlanList {
  SchedulePlanList copyWith(
      {List<SchedulePlan>? items, RequestParams? requestParams, String? type}) {
    return SchedulePlanList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SharedModuleMetadataList {
  SharedModuleMetadataList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory SharedModuleMetadataList.fromJson(Map<String, dynamic> json) =>
      _$SharedModuleMetadataListFromJson(json);

  @JsonKey(
      name: 'items',
      includeIfNull: false,
      defaultValue: <SharedModuleMetadata>[])
  final List<SharedModuleMetadata>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SharedModuleMetadataListFromJson;
  static const toJsonFactory = _$SharedModuleMetadataListToJson;
  Map<String, dynamic> toJson() => _$SharedModuleMetadataListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SharedModuleMetadataList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SharedModuleMetadataListExtension on SharedModuleMetadataList {
  SharedModuleMetadataList copyWith(
      {List<SharedModuleMetadata>? items,
      RequestParams? requestParams,
      String? type}) {
    return SharedModuleMetadataList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StringList {
  StringList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory StringList.fromJson(Map<String, dynamic> json) =>
      _$StringListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <String>[])
  final List<String>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StringListFromJson;
  static const toJsonFactory = _$StringListToJson;
  Map<String, dynamic> toJson() => _$StringListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StringList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StringListExtension on StringList {
  StringList copyWith(
      {List<String>? items, RequestParams? requestParams, String? type}) {
    return StringList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyActivityEventList {
  StudyActivityEventList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory StudyActivityEventList.fromJson(Map<String, dynamic> json) =>
      _$StudyActivityEventListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <StudyActivityEvent>[])
  final List<StudyActivityEvent>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyActivityEventListFromJson;
  static const toJsonFactory = _$StudyActivityEventListToJson;
  Map<String, dynamic> toJson() => _$StudyActivityEventListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyActivityEventList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyActivityEventListExtension on StudyActivityEventList {
  StudyActivityEventList copyWith(
      {List<StudyActivityEvent>? items,
      RequestParams? requestParams,
      String? type}) {
    return StudyActivityEventList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyActivityEventPagedList {
  StudyActivityEventPagedList({
    this.items,
  });

  factory StudyActivityEventPagedList.fromJson(Map<String, dynamic> json) =>
      _$StudyActivityEventPagedListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <StudyActivityEvent>[])
  final List<StudyActivityEvent>? items;
  static const fromJsonFactory = _$StudyActivityEventPagedListFromJson;
  static const toJsonFactory = _$StudyActivityEventPagedListToJson;
  Map<String, dynamic> toJson() => _$StudyActivityEventPagedListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyActivityEventPagedList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $StudyActivityEventPagedListExtension on StudyActivityEventPagedList {
  StudyActivityEventPagedList copyWith({List<StudyActivityEvent>? items}) {
    return StudyActivityEventPagedList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyConsentList {
  StudyConsentList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory StudyConsentList.fromJson(Map<String, dynamic> json) =>
      _$StudyConsentListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <StudyConsent>[])
  final List<StudyConsent>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StudyConsentListFromJson;
  static const toJsonFactory = _$StudyConsentListToJson;
  Map<String, dynamic> toJson() => _$StudyConsentListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyConsentList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StudyConsentListExtension on StudyConsentList {
  StudyConsentList copyWith(
      {List<StudyConsent>? items, RequestParams? requestParams, String? type}) {
    return StudyConsentList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StudyList {
  StudyList({
    this.items,
  });

  factory StudyList.fromJson(Map<String, dynamic> json) =>
      _$StudyListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Study>[])
  final List<Study>? items;
  static const fromJsonFactory = _$StudyListFromJson;
  static const toJsonFactory = _$StudyListToJson;
  Map<String, dynamic> toJson() => _$StudyListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StudyList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $StudyListExtension on StudyList {
  StudyList copyWith({List<Study>? items}) {
    return StudyList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class SubpopulationList {
  SubpopulationList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory SubpopulationList.fromJson(Map<String, dynamic> json) =>
      _$SubpopulationListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Subpopulation>[])
  final List<Subpopulation>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SubpopulationListFromJson;
  static const toJsonFactory = _$SubpopulationListToJson;
  Map<String, dynamic> toJson() => _$SubpopulationListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubpopulationList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SubpopulationListExtension on SubpopulationList {
  SubpopulationList copyWith(
      {List<Subpopulation>? items,
      RequestParams? requestParams,
      String? type}) {
    return SubpopulationList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionStatusList {
  SubscriptionStatusList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory SubscriptionStatusList.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStatusListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <SubscriptionStatus>[])
  final List<SubscriptionStatus>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SubscriptionStatusListFromJson;
  static const toJsonFactory = _$SubscriptionStatusListToJson;
  Map<String, dynamic> toJson() => _$SubscriptionStatusListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionStatusList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SubscriptionStatusListExtension on SubscriptionStatusList {
  SubscriptionStatusList copyWith(
      {List<SubscriptionStatus>? items,
      RequestParams? requestParams,
      String? type}) {
    return SubscriptionStatusList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyList {
  SurveyList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory SurveyList.fromJson(Map<String, dynamic> json) =>
      _$SurveyListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Survey>[])
  final List<Survey>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$SurveyListFromJson;
  static const toJsonFactory = _$SurveyListToJson;
  Map<String, dynamic> toJson() => _$SurveyListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $SurveyListExtension on SurveyList {
  SurveyList copyWith(
      {List<Survey>? items, RequestParams? requestParams, String? type}) {
    return SurveyList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class TemplateList {
  TemplateList({
    this.items,
  });

  factory TemplateList.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Template>[])
  final List<Template>? items;
  static const fromJsonFactory = _$TemplateListFromJson;
  static const toJsonFactory = _$TemplateListToJson;
  Map<String, dynamic> toJson() => _$TemplateListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TemplateList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $TemplateListExtension on TemplateList {
  TemplateList copyWith({List<Template>? items}) {
    return TemplateList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class TemplateRevisionList {
  TemplateRevisionList({
    this.items,
  });

  factory TemplateRevisionList.fromJson(Map<String, dynamic> json) =>
      _$TemplateRevisionListFromJson(json);

  @JsonKey(
      name: 'items', includeIfNull: false, defaultValue: <TemplateRevision>[])
  final List<TemplateRevision>? items;
  static const fromJsonFactory = _$TemplateRevisionListFromJson;
  static const toJsonFactory = _$TemplateRevisionListToJson;
  Map<String, dynamic> toJson() => _$TemplateRevisionListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TemplateRevisionList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $TemplateRevisionListExtension on TemplateRevisionList {
  TemplateRevisionList copyWith({List<TemplateRevision>? items}) {
    return TemplateRevisionList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class UploadList {
  UploadList({
    this.items,
  });

  factory UploadList.fromJson(Map<String, dynamic> json) =>
      _$UploadListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <Upload>[])
  final List<Upload>? items;
  static const fromJsonFactory = _$UploadListFromJson;
  static const toJsonFactory = _$UploadListToJson;
  Map<String, dynamic> toJson() => _$UploadListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UploadList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^ runtimeType.hashCode;
}

extension $UploadListExtension on UploadList {
  UploadList copyWith({List<Upload>? items}) {
    return UploadList(items: items ?? this.items);
  }
}

@JsonSerializable(explicitToJson: true)
class UploadSchemaList {
  UploadSchemaList({
    this.items,
    this.requestParams,
    this.type,
  });

  factory UploadSchemaList.fromJson(Map<String, dynamic> json) =>
      _$UploadSchemaListFromJson(json);

  @JsonKey(name: 'items', includeIfNull: false, defaultValue: <UploadSchema>[])
  final List<UploadSchema>? items;
  @JsonKey(name: 'requestParams', includeIfNull: false)
  final RequestParams? requestParams;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$UploadSchemaListFromJson;
  static const toJsonFactory = _$UploadSchemaListToJson;
  Map<String, dynamic> toJson() => _$UploadSchemaListToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UploadSchemaList &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.requestParams, requestParams) ||
                const DeepCollectionEquality()
                    .equals(other.requestParams, requestParams)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(requestParams) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UploadSchemaListExtension on UploadSchemaList {
  UploadSchemaList copyWith(
      {List<UploadSchema>? items, RequestParams? requestParams, String? type}) {
    return UploadSchemaList(
        items: items ?? this.items,
        requestParams: requestParams ?? this.requestParams,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class Constraints {
  Constraints({
    this.dataType,
    this.required,
    this.type,
  });

  factory Constraints.fromJson(Map<String, dynamic> json) =>
      _$ConstraintsFromJson(json);

  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$ConstraintsFromJson;
  static const toJsonFactory = _$ConstraintsToJson;
  Map<String, dynamic> toJson() => _$ConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Constraints &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ConstraintsExtension on Constraints {
  Constraints copyWith(
      {enums.DataType? dataType, bool? required, String? type}) {
    return Constraints(
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class MultiValueConstraints {
  MultiValueConstraints({
    this.allowOther,
    this.allowMultiple,
    this.enumeration,
    this.dataType,
    this.required,
    this.type,
  });

  factory MultiValueConstraints.fromJson(Map<String, dynamic> json) =>
      _$MultiValueConstraintsFromJson(json);

  @JsonKey(name: 'allowOther', includeIfNull: false)
  final bool? allowOther;
  @JsonKey(name: 'allowMultiple', includeIfNull: false)
  final bool? allowMultiple;
  @JsonKey(
      name: 'enumeration',
      includeIfNull: false,
      defaultValue: <SurveyQuestionOption>[])
  final List<SurveyQuestionOption>? enumeration;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$MultiValueConstraintsFromJson;
  static const toJsonFactory = _$MultiValueConstraintsToJson;
  Map<String, dynamic> toJson() => _$MultiValueConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MultiValueConstraints &&
            (identical(other.allowOther, allowOther) ||
                const DeepCollectionEquality()
                    .equals(other.allowOther, allowOther)) &&
            (identical(other.allowMultiple, allowMultiple) ||
                const DeepCollectionEquality()
                    .equals(other.allowMultiple, allowMultiple)) &&
            (identical(other.enumeration, enumeration) ||
                const DeepCollectionEquality()
                    .equals(other.enumeration, enumeration)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allowOther) ^
      const DeepCollectionEquality().hash(allowMultiple) ^
      const DeepCollectionEquality().hash(enumeration) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $MultiValueConstraintsExtension on MultiValueConstraints {
  MultiValueConstraints copyWith(
      {bool? allowOther,
      bool? allowMultiple,
      List<SurveyQuestionOption>? enumeration,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return MultiValueConstraints(
        allowOther: allowOther ?? this.allowOther,
        allowMultiple: allowMultiple ?? this.allowMultiple,
        enumeration: enumeration ?? this.enumeration,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class BooleanConstraints {
  BooleanConstraints();

  factory BooleanConstraints.fromJson(Map<String, dynamic> json) =>
      _$BooleanConstraintsFromJson(json);

  static const fromJsonFactory = _$BooleanConstraintsFromJson;
  static const toJsonFactory = _$BooleanConstraintsToJson;
  Map<String, dynamic> toJson() => _$BooleanConstraintsToJson(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class IntegerConstraints {
  IntegerConstraints({
    this.unit,
    this.minValue,
    this.maxValue,
    this.step,
    this.dataType,
    this.required,
    this.type,
  });

  factory IntegerConstraints.fromJson(Map<String, dynamic> json) =>
      _$IntegerConstraintsFromJson(json);

  @JsonKey(
      name: 'unit',
      includeIfNull: false,
      toJson: unitToJson,
      fromJson: unitFromJson)
  final enums.Unit? unit;
  @JsonKey(name: 'minValue', includeIfNull: false)
  final int? minValue;
  @JsonKey(name: 'maxValue', includeIfNull: false)
  final int? maxValue;
  @JsonKey(name: 'step', includeIfNull: false)
  final int? step;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$IntegerConstraintsFromJson;
  static const toJsonFactory = _$IntegerConstraintsToJson;
  Map<String, dynamic> toJson() => _$IntegerConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IntegerConstraints &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $IntegerConstraintsExtension on IntegerConstraints {
  IntegerConstraints copyWith(
      {enums.Unit? unit,
      int? minValue,
      int? maxValue,
      int? step,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return IntegerConstraints(
        unit: unit ?? this.unit,
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue,
        step: step ?? this.step,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class DecimalConstraints {
  DecimalConstraints({
    this.unit,
    this.minValue,
    this.maxValue,
    this.step,
    this.dataType,
    this.required,
    this.type,
  });

  factory DecimalConstraints.fromJson(Map<String, dynamic> json) =>
      _$DecimalConstraintsFromJson(json);

  @JsonKey(
      name: 'unit',
      includeIfNull: false,
      toJson: unitToJson,
      fromJson: unitFromJson)
  final enums.Unit? unit;
  @JsonKey(name: 'minValue', includeIfNull: false)
  final double? minValue;
  @JsonKey(name: 'maxValue', includeIfNull: false)
  final double? maxValue;
  @JsonKey(name: 'step', includeIfNull: false)
  final double? step;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$DecimalConstraintsFromJson;
  static const toJsonFactory = _$DecimalConstraintsToJson;
  Map<String, dynamic> toJson() => _$DecimalConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DecimalConstraints &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $DecimalConstraintsExtension on DecimalConstraints {
  DecimalConstraints copyWith(
      {enums.Unit? unit,
      double? minValue,
      double? maxValue,
      double? step,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return DecimalConstraints(
        unit: unit ?? this.unit,
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue,
        step: step ?? this.step,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class StringConstraints {
  StringConstraints({
    this.minLength,
    this.maxLength,
    this.pattern,
    this.patternErrorMessage,
    this.patternPlaceholder,
    this.dataType,
    this.required,
    this.type,
  });

  factory StringConstraints.fromJson(Map<String, dynamic> json) =>
      _$StringConstraintsFromJson(json);

  @JsonKey(name: 'minLength', includeIfNull: false)
  final int? minLength;
  @JsonKey(name: 'maxLength', includeIfNull: false)
  final int? maxLength;
  @JsonKey(name: 'pattern', includeIfNull: false)
  final String? pattern;
  @JsonKey(name: 'patternErrorMessage', includeIfNull: false)
  final String? patternErrorMessage;
  @JsonKey(name: 'patternPlaceholder', includeIfNull: false)
  final String? patternPlaceholder;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$StringConstraintsFromJson;
  static const toJsonFactory = _$StringConstraintsToJson;
  Map<String, dynamic> toJson() => _$StringConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StringConstraints &&
            (identical(other.minLength, minLength) ||
                const DeepCollectionEquality()
                    .equals(other.minLength, minLength)) &&
            (identical(other.maxLength, maxLength) ||
                const DeepCollectionEquality()
                    .equals(other.maxLength, maxLength)) &&
            (identical(other.pattern, pattern) ||
                const DeepCollectionEquality()
                    .equals(other.pattern, pattern)) &&
            (identical(other.patternErrorMessage, patternErrorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.patternErrorMessage, patternErrorMessage)) &&
            (identical(other.patternPlaceholder, patternPlaceholder) ||
                const DeepCollectionEquality()
                    .equals(other.patternPlaceholder, patternPlaceholder)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(minLength) ^
      const DeepCollectionEquality().hash(maxLength) ^
      const DeepCollectionEquality().hash(pattern) ^
      const DeepCollectionEquality().hash(patternErrorMessage) ^
      const DeepCollectionEquality().hash(patternPlaceholder) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $StringConstraintsExtension on StringConstraints {
  StringConstraints copyWith(
      {int? minLength,
      int? maxLength,
      String? pattern,
      String? patternErrorMessage,
      String? patternPlaceholder,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return StringConstraints(
        minLength: minLength ?? this.minLength,
        maxLength: maxLength ?? this.maxLength,
        pattern: pattern ?? this.pattern,
        patternErrorMessage: patternErrorMessage ?? this.patternErrorMessage,
        patternPlaceholder: patternPlaceholder ?? this.patternPlaceholder,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class DateTimeConstraints {
  DateTimeConstraints({
    this.allowFuture,
    this.allowPast,
    this.earliestValue,
    this.latestValue,
    this.dataType,
    this.required,
    this.type,
  });

  factory DateTimeConstraints.fromJson(Map<String, dynamic> json) =>
      _$DateTimeConstraintsFromJson(json);

  @JsonKey(name: 'allowFuture', includeIfNull: false, defaultValue: false)
  final bool? allowFuture;
  @JsonKey(name: 'allowPast', includeIfNull: false, defaultValue: true)
  final bool? allowPast;
  @JsonKey(name: 'earliestValue', includeIfNull: false)
  final DateTime? earliestValue;
  @JsonKey(name: 'latestValue', includeIfNull: false)
  final DateTime? latestValue;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$DateTimeConstraintsFromJson;
  static const toJsonFactory = _$DateTimeConstraintsToJson;
  Map<String, dynamic> toJson() => _$DateTimeConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DateTimeConstraints &&
            (identical(other.allowFuture, allowFuture) ||
                const DeepCollectionEquality()
                    .equals(other.allowFuture, allowFuture)) &&
            (identical(other.allowPast, allowPast) ||
                const DeepCollectionEquality()
                    .equals(other.allowPast, allowPast)) &&
            (identical(other.earliestValue, earliestValue) ||
                const DeepCollectionEquality()
                    .equals(other.earliestValue, earliestValue)) &&
            (identical(other.latestValue, latestValue) ||
                const DeepCollectionEquality()
                    .equals(other.latestValue, latestValue)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allowFuture) ^
      const DeepCollectionEquality().hash(allowPast) ^
      const DeepCollectionEquality().hash(earliestValue) ^
      const DeepCollectionEquality().hash(latestValue) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $DateTimeConstraintsExtension on DateTimeConstraints {
  DateTimeConstraints copyWith(
      {bool? allowFuture,
      bool? allowPast,
      DateTime? earliestValue,
      DateTime? latestValue,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return DateTimeConstraints(
        allowFuture: allowFuture ?? this.allowFuture,
        allowPast: allowPast ?? this.allowPast,
        earliestValue: earliestValue ?? this.earliestValue,
        latestValue: latestValue ?? this.latestValue,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class DateConstraints {
  DateConstraints({
    this.allowFuture,
    this.allowPast,
    this.earliestValue,
    this.latestValue,
    this.dataType,
    this.required,
    this.type,
  });

  factory DateConstraints.fromJson(Map<String, dynamic> json) =>
      _$DateConstraintsFromJson(json);

  @JsonKey(name: 'allowFuture', includeIfNull: false, defaultValue: false)
  final bool? allowFuture;
  @JsonKey(name: 'allowPast', includeIfNull: false, defaultValue: true)
  final bool? allowPast;
  @JsonKey(name: 'earliestValue', includeIfNull: false, toJson: _dateToJson)
  final DateTime? earliestValue;
  @JsonKey(name: 'latestValue', includeIfNull: false, toJson: _dateToJson)
  final DateTime? latestValue;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$DateConstraintsFromJson;
  static const toJsonFactory = _$DateConstraintsToJson;
  Map<String, dynamic> toJson() => _$DateConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DateConstraints &&
            (identical(other.allowFuture, allowFuture) ||
                const DeepCollectionEquality()
                    .equals(other.allowFuture, allowFuture)) &&
            (identical(other.allowPast, allowPast) ||
                const DeepCollectionEquality()
                    .equals(other.allowPast, allowPast)) &&
            (identical(other.earliestValue, earliestValue) ||
                const DeepCollectionEquality()
                    .equals(other.earliestValue, earliestValue)) &&
            (identical(other.latestValue, latestValue) ||
                const DeepCollectionEquality()
                    .equals(other.latestValue, latestValue)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allowFuture) ^
      const DeepCollectionEquality().hash(allowPast) ^
      const DeepCollectionEquality().hash(earliestValue) ^
      const DeepCollectionEquality().hash(latestValue) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $DateConstraintsExtension on DateConstraints {
  DateConstraints copyWith(
      {bool? allowFuture,
      bool? allowPast,
      DateTime? earliestValue,
      DateTime? latestValue,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return DateConstraints(
        allowFuture: allowFuture ?? this.allowFuture,
        allowPast: allowPast ?? this.allowPast,
        earliestValue: earliestValue ?? this.earliestValue,
        latestValue: latestValue ?? this.latestValue,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class PostalCodeConstraints {
  PostalCodeConstraints({
    this.countryCode,
    this.sparseZipCodePrefixes,
    this.dataType,
    this.required,
    this.type,
  });

  factory PostalCodeConstraints.fromJson(Map<String, dynamic> json) =>
      _$PostalCodeConstraintsFromJson(json);

  @JsonKey(
      name: 'countryCode',
      includeIfNull: false,
      toJson: countryCodeToJson,
      fromJson: countryCodeFromJson)
  final enums.CountryCode? countryCode;
  @JsonKey(
      name: 'sparseZipCodePrefixes',
      includeIfNull: false,
      defaultValue: <String>[])
  final List<String>? sparseZipCodePrefixes;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$PostalCodeConstraintsFromJson;
  static const toJsonFactory = _$PostalCodeConstraintsToJson;
  Map<String, dynamic> toJson() => _$PostalCodeConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostalCodeConstraints &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.sparseZipCodePrefixes, sparseZipCodePrefixes) ||
                const DeepCollectionEquality().equals(
                    other.sparseZipCodePrefixes, sparseZipCodePrefixes)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(sparseZipCodePrefixes) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PostalCodeConstraintsExtension on PostalCodeConstraints {
  PostalCodeConstraints copyWith(
      {enums.CountryCode? countryCode,
      List<String>? sparseZipCodePrefixes,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return PostalCodeConstraints(
        countryCode: countryCode ?? this.countryCode,
        sparseZipCodePrefixes:
            sparseZipCodePrefixes ?? this.sparseZipCodePrefixes,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class YearMonthConstraints {
  YearMonthConstraints({
    this.allowFuture,
    this.allowPast,
    this.earliestValue,
    this.latestValue,
    this.dataType,
    this.required,
    this.type,
  });

  factory YearMonthConstraints.fromJson(Map<String, dynamic> json) =>
      _$YearMonthConstraintsFromJson(json);

  @JsonKey(name: 'allowFuture', includeIfNull: false, defaultValue: false)
  final bool? allowFuture;
  @JsonKey(name: 'allowPast', includeIfNull: false, defaultValue: true)
  final bool? allowPast;
  @JsonKey(name: 'earliestValue', includeIfNull: false)
  final String? earliestValue;
  @JsonKey(name: 'latestValue', includeIfNull: false)
  final String? latestValue;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$YearMonthConstraintsFromJson;
  static const toJsonFactory = _$YearMonthConstraintsToJson;
  Map<String, dynamic> toJson() => _$YearMonthConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is YearMonthConstraints &&
            (identical(other.allowFuture, allowFuture) ||
                const DeepCollectionEquality()
                    .equals(other.allowFuture, allowFuture)) &&
            (identical(other.allowPast, allowPast) ||
                const DeepCollectionEquality()
                    .equals(other.allowPast, allowPast)) &&
            (identical(other.earliestValue, earliestValue) ||
                const DeepCollectionEquality()
                    .equals(other.earliestValue, earliestValue)) &&
            (identical(other.latestValue, latestValue) ||
                const DeepCollectionEquality()
                    .equals(other.latestValue, latestValue)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allowFuture) ^
      const DeepCollectionEquality().hash(allowPast) ^
      const DeepCollectionEquality().hash(earliestValue) ^
      const DeepCollectionEquality().hash(latestValue) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $YearMonthConstraintsExtension on YearMonthConstraints {
  YearMonthConstraints copyWith(
      {bool? allowFuture,
      bool? allowPast,
      String? earliestValue,
      String? latestValue,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return YearMonthConstraints(
        allowFuture: allowFuture ?? this.allowFuture,
        allowPast: allowPast ?? this.allowPast,
        earliestValue: earliestValue ?? this.earliestValue,
        latestValue: latestValue ?? this.latestValue,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class YearConstraints {
  YearConstraints({
    this.allowFuture,
    this.allowPast,
    this.earliestValue,
    this.latestValue,
    this.dataType,
    this.required,
    this.type,
  });

  factory YearConstraints.fromJson(Map<String, dynamic> json) =>
      _$YearConstraintsFromJson(json);

  @JsonKey(name: 'allowFuture', includeIfNull: false, defaultValue: false)
  final bool? allowFuture;
  @JsonKey(name: 'allowPast', includeIfNull: false, defaultValue: true)
  final bool? allowPast;
  @JsonKey(name: 'earliestValue', includeIfNull: false)
  final String? earliestValue;
  @JsonKey(name: 'latestValue', includeIfNull: false)
  final String? latestValue;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$YearConstraintsFromJson;
  static const toJsonFactory = _$YearConstraintsToJson;
  Map<String, dynamic> toJson() => _$YearConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is YearConstraints &&
            (identical(other.allowFuture, allowFuture) ||
                const DeepCollectionEquality()
                    .equals(other.allowFuture, allowFuture)) &&
            (identical(other.allowPast, allowPast) ||
                const DeepCollectionEquality()
                    .equals(other.allowPast, allowPast)) &&
            (identical(other.earliestValue, earliestValue) ||
                const DeepCollectionEquality()
                    .equals(other.earliestValue, earliestValue)) &&
            (identical(other.latestValue, latestValue) ||
                const DeepCollectionEquality()
                    .equals(other.latestValue, latestValue)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allowFuture) ^
      const DeepCollectionEquality().hash(allowPast) ^
      const DeepCollectionEquality().hash(earliestValue) ^
      const DeepCollectionEquality().hash(latestValue) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $YearConstraintsExtension on YearConstraints {
  YearConstraints copyWith(
      {bool? allowFuture,
      bool? allowPast,
      String? earliestValue,
      String? latestValue,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return YearConstraints(
        allowFuture: allowFuture ?? this.allowFuture,
        allowPast: allowPast ?? this.allowPast,
        earliestValue: earliestValue ?? this.earliestValue,
        latestValue: latestValue ?? this.latestValue,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class TimeConstraints {
  TimeConstraints();

  factory TimeConstraints.fromJson(Map<String, dynamic> json) =>
      _$TimeConstraintsFromJson(json);

  static const fromJsonFactory = _$TimeConstraintsFromJson;
  static const toJsonFactory = _$TimeConstraintsToJson;
  Map<String, dynamic> toJson() => _$TimeConstraintsToJson(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class DurationConstraints {
  DurationConstraints({
    this.unit,
    this.minValue,
    this.maxValue,
    this.step,
    this.dataType,
    this.required,
    this.type,
  });

  factory DurationConstraints.fromJson(Map<String, dynamic> json) =>
      _$DurationConstraintsFromJson(json);

  @JsonKey(
      name: 'unit',
      includeIfNull: false,
      toJson: unitToJson,
      fromJson: unitFromJson)
  final enums.Unit? unit;
  @JsonKey(name: 'minValue', includeIfNull: false)
  final int? minValue;
  @JsonKey(name: 'maxValue', includeIfNull: false)
  final int? maxValue;
  @JsonKey(name: 'step', includeIfNull: false)
  final int? step;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$DurationConstraintsFromJson;
  static const toJsonFactory = _$DurationConstraintsToJson;
  Map<String, dynamic> toJson() => _$DurationConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DurationConstraints &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $DurationConstraintsExtension on DurationConstraints {
  DurationConstraints copyWith(
      {enums.Unit? unit,
      int? minValue,
      int? maxValue,
      int? step,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return DurationConstraints(
        unit: unit ?? this.unit,
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue,
        step: step ?? this.step,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class BloodPressureConstraints {
  BloodPressureConstraints({
    this.unit,
    this.dataType,
    this.required,
    this.type,
  });

  factory BloodPressureConstraints.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureConstraintsFromJson(json);

  @JsonKey(
      name: 'unit',
      includeIfNull: false,
      toJson: unitToJson,
      fromJson: unitFromJson)
  final enums.Unit? unit;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$BloodPressureConstraintsFromJson;
  static const toJsonFactory = _$BloodPressureConstraintsToJson;
  Map<String, dynamic> toJson() => _$BloodPressureConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BloodPressureConstraints &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $BloodPressureConstraintsExtension on BloodPressureConstraints {
  BloodPressureConstraints copyWith(
      {enums.Unit? unit,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return BloodPressureConstraints(
        unit: unit ?? this.unit,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class HeightConstraints {
  HeightConstraints({
    this.unit,
    this.forInfant,
    this.dataType,
    this.required,
    this.type,
  });

  factory HeightConstraints.fromJson(Map<String, dynamic> json) =>
      _$HeightConstraintsFromJson(json);

  @JsonKey(
      name: 'unit',
      includeIfNull: false,
      toJson: unitToJson,
      fromJson: unitFromJson)
  final enums.Unit? unit;
  @JsonKey(name: 'forInfant', includeIfNull: false)
  final bool? forInfant;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$HeightConstraintsFromJson;
  static const toJsonFactory = _$HeightConstraintsToJson;
  Map<String, dynamic> toJson() => _$HeightConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HeightConstraints &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.forInfant, forInfant) ||
                const DeepCollectionEquality()
                    .equals(other.forInfant, forInfant)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(forInfant) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $HeightConstraintsExtension on HeightConstraints {
  HeightConstraints copyWith(
      {enums.Unit? unit,
      bool? forInfant,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return HeightConstraints(
        unit: unit ?? this.unit,
        forInfant: forInfant ?? this.forInfant,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class WeightConstraints {
  WeightConstraints({
    this.unit,
    this.forInfant,
    this.dataType,
    this.required,
    this.type,
  });

  factory WeightConstraints.fromJson(Map<String, dynamic> json) =>
      _$WeightConstraintsFromJson(json);

  @JsonKey(
      name: 'unit',
      includeIfNull: false,
      toJson: unitToJson,
      fromJson: unitFromJson)
  final enums.Unit? unit;
  @JsonKey(name: 'forInfant', includeIfNull: false)
  final bool? forInfant;
  @JsonKey(
      name: 'dataType',
      includeIfNull: false,
      toJson: dataTypeToJson,
      fromJson: dataTypeFromJson)
  final enums.DataType? dataType;
  @JsonKey(name: 'required', includeIfNull: false)
  final bool? required;
  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;
  static const fromJsonFactory = _$WeightConstraintsFromJson;
  static const toJsonFactory = _$WeightConstraintsToJson;
  Map<String, dynamic> toJson() => _$WeightConstraintsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WeightConstraints &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.forInfant, forInfant) ||
                const DeepCollectionEquality()
                    .equals(other.forInfant, forInfant)) &&
            (identical(other.dataType, dataType) ||
                const DeepCollectionEquality()
                    .equals(other.dataType, dataType)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(forInfant) ^
      const DeepCollectionEquality().hash(dataType) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $WeightConstraintsExtension on WeightConstraints {
  WeightConstraints copyWith(
      {enums.Unit? unit,
      bool? forInfant,
      enums.DataType? dataType,
      bool? required,
      String? type}) {
    return WeightConstraints(
        unit: unit ?? this.unit,
        forInfant: forInfant ?? this.forInfant,
        dataType: dataType ?? this.dataType,
        required: required ?? this.required,
        type: type ?? this.type);
  }
}

String? sharingScopeToJson(enums.SharingScope? sharingScope) {
  return enums.$SharingScopeMap[sharingScope];
}

enums.SharingScope sharingScopeFromJson(Object? sharingScope) {
  if (sharingScope is int) {
    return enums.$SharingScopeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == sharingScope.toString(),
            orElse: () =>
                const MapEntry(enums.SharingScope.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (sharingScope is String) {
    return enums.$SharingScopeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == sharingScope.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.SharingScope.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SharingScope.swaggerGeneratedUnknown;
}

List<String> sharingScopeListToJson(List<enums.SharingScope>? sharingScope) {
  if (sharingScope == null) {
    return [];
  }

  return sharingScope.map((e) => enums.$SharingScopeMap[e]!).toList();
}

List<enums.SharingScope> sharingScopeListFromJson(List? sharingScope) {
  if (sharingScope == null) {
    return [];
  }

  return sharingScope.map((e) => sharingScopeFromJson(e.toString())).toList();
}

String? accountStatusToJson(enums.AccountStatus? accountStatus) {
  return enums.$AccountStatusMap[accountStatus];
}

enums.AccountStatus accountStatusFromJson(Object? accountStatus) {
  if (accountStatus is int) {
    return enums.$AccountStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == accountStatus.toString(),
            orElse: () =>
                const MapEntry(enums.AccountStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (accountStatus is String) {
    return enums.$AccountStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == accountStatus.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.AccountStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.AccountStatus.swaggerGeneratedUnknown;
}

List<String> accountStatusListToJson(List<enums.AccountStatus>? accountStatus) {
  if (accountStatus == null) {
    return [];
  }

  return accountStatus.map((e) => enums.$AccountStatusMap[e]!).toList();
}

List<enums.AccountStatus> accountStatusListFromJson(List? accountStatus) {
  if (accountStatus == null) {
    return [];
  }

  return accountStatus.map((e) => accountStatusFromJson(e.toString())).toList();
}

String? activityEventUpdateTypeToJson(
    enums.ActivityEventUpdateType? activityEventUpdateType) {
  return enums.$ActivityEventUpdateTypeMap[activityEventUpdateType];
}

enums.ActivityEventUpdateType activityEventUpdateTypeFromJson(
    Object? activityEventUpdateType) {
  if (activityEventUpdateType is int) {
    return enums.$ActivityEventUpdateTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                activityEventUpdateType.toString(),
            orElse: () => const MapEntry(
                enums.ActivityEventUpdateType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (activityEventUpdateType is String) {
    return enums.$ActivityEventUpdateTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                activityEventUpdateType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ActivityEventUpdateType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ActivityEventUpdateType.swaggerGeneratedUnknown;
}

List<String> activityEventUpdateTypeListToJson(
    List<enums.ActivityEventUpdateType>? activityEventUpdateType) {
  if (activityEventUpdateType == null) {
    return [];
  }

  return activityEventUpdateType
      .map((e) => enums.$ActivityEventUpdateTypeMap[e]!)
      .toList();
}

List<enums.ActivityEventUpdateType> activityEventUpdateTypeListFromJson(
    List? activityEventUpdateType) {
  if (activityEventUpdateType == null) {
    return [];
  }

  return activityEventUpdateType
      .map((e) => activityEventUpdateTypeFromJson(e.toString()))
      .toList();
}

String? contactRoleToJson(enums.ContactRole? contactRole) {
  return enums.$ContactRoleMap[contactRole];
}

enums.ContactRole contactRoleFromJson(Object? contactRole) {
  if (contactRole is int) {
    return enums.$ContactRoleMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == contactRole.toString(),
            orElse: () =>
                const MapEntry(enums.ContactRole.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (contactRole is String) {
    return enums.$ContactRoleMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == contactRole.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.ContactRole.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ContactRole.swaggerGeneratedUnknown;
}

List<String> contactRoleListToJson(List<enums.ContactRole>? contactRole) {
  if (contactRole == null) {
    return [];
  }

  return contactRole.map((e) => enums.$ContactRoleMap[e]!).toList();
}

List<enums.ContactRole> contactRoleListFromJson(List? contactRole) {
  if (contactRole == null) {
    return [];
  }

  return contactRole.map((e) => contactRoleFromJson(e.toString())).toList();
}

String? countryCodeToJson(enums.CountryCode? countryCode) {
  return enums.$CountryCodeMap[countryCode];
}

enums.CountryCode countryCodeFromJson(Object? countryCode) {
  if (countryCode is int) {
    return enums.$CountryCodeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == countryCode.toString(),
            orElse: () =>
                const MapEntry(enums.CountryCode.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (countryCode is String) {
    return enums.$CountryCodeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == countryCode.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.CountryCode.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.CountryCode.swaggerGeneratedUnknown;
}

List<String> countryCodeListToJson(List<enums.CountryCode>? countryCode) {
  if (countryCode == null) {
    return [];
  }

  return countryCode.map((e) => enums.$CountryCodeMap[e]!).toList();
}

List<enums.CountryCode> countryCodeListFromJson(List? countryCode) {
  if (countryCode == null) {
    return [];
  }

  return countryCode.map((e) => countryCodeFromJson(e.toString())).toList();
}

String? dataTypeToJson(enums.DataType? dataType) {
  return enums.$DataTypeMap[dataType];
}

enums.DataType dataTypeFromJson(Object? dataType) {
  if (dataType is int) {
    return enums.$DataTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == dataType.toString(),
            orElse: () =>
                const MapEntry(enums.DataType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (dataType is String) {
    return enums.$DataTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == dataType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.DataType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.DataType.swaggerGeneratedUnknown;
}

List<String> dataTypeListToJson(List<enums.DataType>? dataType) {
  if (dataType == null) {
    return [];
  }

  return dataType.map((e) => enums.$DataTypeMap[e]!).toList();
}

List<enums.DataType> dataTypeListFromJson(List? dataType) {
  if (dataType == null) {
    return [];
  }

  return dataType.map((e) => dataTypeFromJson(e.toString())).toList();
}

String? enrollmentFilterToJson(enums.EnrollmentFilter? enrollmentFilter) {
  return enums.$EnrollmentFilterMap[enrollmentFilter];
}

enums.EnrollmentFilter enrollmentFilterFromJson(Object? enrollmentFilter) {
  if (enrollmentFilter is int) {
    return enums.$EnrollmentFilterMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == enrollmentFilter.toString(),
            orElse: () => const MapEntry(
                enums.EnrollmentFilter.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (enrollmentFilter is String) {
    return enums.$EnrollmentFilterMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == enrollmentFilter.toLowerCase(),
            orElse: () => const MapEntry(
                enums.EnrollmentFilter.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.EnrollmentFilter.swaggerGeneratedUnknown;
}

List<String> enrollmentFilterListToJson(
    List<enums.EnrollmentFilter>? enrollmentFilter) {
  if (enrollmentFilter == null) {
    return [];
  }

  return enrollmentFilter.map((e) => enums.$EnrollmentFilterMap[e]!).toList();
}

List<enums.EnrollmentFilter> enrollmentFilterListFromJson(
    List? enrollmentFilter) {
  if (enrollmentFilter == null) {
    return [];
  }

  return enrollmentFilter
      .map((e) => enrollmentFilterFromJson(e.toString()))
      .toList();
}

String? environmentToJson(enums.Environment? environment) {
  return enums.$EnvironmentMap[environment];
}

enums.Environment environmentFromJson(Object? environment) {
  if (environment is int) {
    return enums.$EnvironmentMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == environment.toString(),
            orElse: () =>
                const MapEntry(enums.Environment.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (environment is String) {
    return enums.$EnvironmentMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == environment.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.Environment.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.Environment.swaggerGeneratedUnknown;
}

List<String> environmentListToJson(List<enums.Environment>? environment) {
  if (environment == null) {
    return [];
  }

  return environment.map((e) => enums.$EnvironmentMap[e]!).toList();
}

List<enums.Environment> environmentListFromJson(List? environment) {
  if (environment == null) {
    return [];
  }

  return environment.map((e) => environmentFromJson(e.toString())).toList();
}

String? fileDispositionToJson(enums.FileDisposition? fileDisposition) {
  return enums.$FileDispositionMap[fileDisposition];
}

enums.FileDisposition fileDispositionFromJson(Object? fileDisposition) {
  if (fileDisposition is int) {
    return enums.$FileDispositionMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == fileDisposition.toString(),
            orElse: () => const MapEntry(
                enums.FileDisposition.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (fileDisposition is String) {
    return enums.$FileDispositionMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == fileDisposition.toLowerCase(),
            orElse: () => const MapEntry(
                enums.FileDisposition.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.FileDisposition.swaggerGeneratedUnknown;
}

List<String> fileDispositionListToJson(
    List<enums.FileDisposition>? fileDisposition) {
  if (fileDisposition == null) {
    return [];
  }

  return fileDisposition.map((e) => enums.$FileDispositionMap[e]!).toList();
}

List<enums.FileDisposition> fileDispositionListFromJson(List? fileDisposition) {
  if (fileDisposition == null) {
    return [];
  }

  return fileDisposition
      .map((e) => fileDispositionFromJson(e.toString()))
      .toList();
}

String? fileRevisionStatusToJson(enums.FileRevisionStatus? fileRevisionStatus) {
  return enums.$FileRevisionStatusMap[fileRevisionStatus];
}

enums.FileRevisionStatus fileRevisionStatusFromJson(
    Object? fileRevisionStatus) {
  if (fileRevisionStatus is int) {
    return enums.$FileRevisionStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == fileRevisionStatus.toString(),
            orElse: () => const MapEntry(
                enums.FileRevisionStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (fileRevisionStatus is String) {
    return enums.$FileRevisionStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == fileRevisionStatus.toLowerCase(),
            orElse: () => const MapEntry(
                enums.FileRevisionStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.FileRevisionStatus.swaggerGeneratedUnknown;
}

List<String> fileRevisionStatusListToJson(
    List<enums.FileRevisionStatus>? fileRevisionStatus) {
  if (fileRevisionStatus == null) {
    return [];
  }

  return fileRevisionStatus
      .map((e) => enums.$FileRevisionStatusMap[e]!)
      .toList();
}

List<enums.FileRevisionStatus> fileRevisionStatusListFromJson(
    List? fileRevisionStatus) {
  if (fileRevisionStatus == null) {
    return [];
  }

  return fileRevisionStatus
      .map((e) => fileRevisionStatusFromJson(e.toString()))
      .toList();
}

String? irbDecisionTypeToJson(enums.IrbDecisionType? irbDecisionType) {
  return enums.$IrbDecisionTypeMap[irbDecisionType];
}

enums.IrbDecisionType irbDecisionTypeFromJson(Object? irbDecisionType) {
  if (irbDecisionType is int) {
    return enums.$IrbDecisionTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == irbDecisionType.toString(),
            orElse: () => const MapEntry(
                enums.IrbDecisionType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (irbDecisionType is String) {
    return enums.$IrbDecisionTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == irbDecisionType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.IrbDecisionType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.IrbDecisionType.swaggerGeneratedUnknown;
}

List<String> irbDecisionTypeListToJson(
    List<enums.IrbDecisionType>? irbDecisionType) {
  if (irbDecisionType == null) {
    return [];
  }

  return irbDecisionType.map((e) => enums.$IrbDecisionTypeMap[e]!).toList();
}

List<enums.IrbDecisionType> irbDecisionTypeListFromJson(List? irbDecisionType) {
  if (irbDecisionType == null) {
    return [];
  }

  return irbDecisionType
      .map((e) => irbDecisionTypeFromJson(e.toString()))
      .toList();
}

String? notificationProtocolToJson(
    enums.NotificationProtocol? notificationProtocol) {
  return enums.$NotificationProtocolMap[notificationProtocol];
}

enums.NotificationProtocol notificationProtocolFromJson(
    Object? notificationProtocol) {
  if (notificationProtocol is int) {
    return enums.$NotificationProtocolMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == notificationProtocol.toString(),
            orElse: () => const MapEntry(
                enums.NotificationProtocol.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (notificationProtocol is String) {
    return enums.$NotificationProtocolMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                notificationProtocol.toLowerCase(),
            orElse: () => const MapEntry(
                enums.NotificationProtocol.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.NotificationProtocol.swaggerGeneratedUnknown;
}

List<String> notificationProtocolListToJson(
    List<enums.NotificationProtocol>? notificationProtocol) {
  if (notificationProtocol == null) {
    return [];
  }

  return notificationProtocol
      .map((e) => enums.$NotificationProtocolMap[e]!)
      .toList();
}

List<enums.NotificationProtocol> notificationProtocolListFromJson(
    List? notificationProtocol) {
  if (notificationProtocol == null) {
    return [];
  }

  return notificationProtocol
      .map((e) => notificationProtocolFromJson(e.toString()))
      .toList();
}

String? notificationTypeToJson(enums.NotificationType? notificationType) {
  return enums.$NotificationTypeMap[notificationType];
}

enums.NotificationType notificationTypeFromJson(Object? notificationType) {
  if (notificationType is int) {
    return enums.$NotificationTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == notificationType.toString(),
            orElse: () => const MapEntry(
                enums.NotificationType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (notificationType is String) {
    return enums.$NotificationTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == notificationType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.NotificationType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.NotificationType.swaggerGeneratedUnknown;
}

List<String> notificationTypeListToJson(
    List<enums.NotificationType>? notificationType) {
  if (notificationType == null) {
    return [];
  }

  return notificationType.map((e) => enums.$NotificationTypeMap[e]!).toList();
}

List<enums.NotificationType> notificationTypeListFromJson(
    List? notificationType) {
  if (notificationType == null) {
    return [];
  }

  return notificationType
      .map((e) => notificationTypeFromJson(e.toString()))
      .toList();
}

String? performanceOrderToJson(enums.PerformanceOrder? performanceOrder) {
  return enums.$PerformanceOrderMap[performanceOrder];
}

enums.PerformanceOrder performanceOrderFromJson(Object? performanceOrder) {
  if (performanceOrder is int) {
    return enums.$PerformanceOrderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == performanceOrder.toString(),
            orElse: () => const MapEntry(
                enums.PerformanceOrder.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (performanceOrder is String) {
    return enums.$PerformanceOrderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == performanceOrder.toLowerCase(),
            orElse: () => const MapEntry(
                enums.PerformanceOrder.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.PerformanceOrder.swaggerGeneratedUnknown;
}

List<String> performanceOrderListToJson(
    List<enums.PerformanceOrder>? performanceOrder) {
  if (performanceOrder == null) {
    return [];
  }

  return performanceOrder.map((e) => enums.$PerformanceOrderMap[e]!).toList();
}

List<enums.PerformanceOrder> performanceOrderListFromJson(
    List? performanceOrder) {
  if (performanceOrder == null) {
    return [];
  }

  return performanceOrder
      .map((e) => performanceOrderFromJson(e.toString()))
      .toList();
}

String? adherenceRecordTypeToJson(
    enums.AdherenceRecordType? adherenceRecordType) {
  return enums.$AdherenceRecordTypeMap[adherenceRecordType];
}

enums.AdherenceRecordType adherenceRecordTypeFromJson(
    Object? adherenceRecordType) {
  if (adherenceRecordType is int) {
    return enums.$AdherenceRecordTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == adherenceRecordType.toString(),
            orElse: () => const MapEntry(
                enums.AdherenceRecordType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (adherenceRecordType is String) {
    return enums.$AdherenceRecordTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                adherenceRecordType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.AdherenceRecordType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.AdherenceRecordType.swaggerGeneratedUnknown;
}

List<String> adherenceRecordTypeListToJson(
    List<enums.AdherenceRecordType>? adherenceRecordType) {
  if (adherenceRecordType == null) {
    return [];
  }

  return adherenceRecordType
      .map((e) => enums.$AdherenceRecordTypeMap[e]!)
      .toList();
}

List<enums.AdherenceRecordType> adherenceRecordTypeListFromJson(
    List? adherenceRecordType) {
  if (adherenceRecordType == null) {
    return [];
  }

  return adherenceRecordType
      .map((e) => adherenceRecordTypeFromJson(e.toString()))
      .toList();
}

String? scheduleTypeToJson(enums.ScheduleType? scheduleType) {
  return enums.$ScheduleTypeMap[scheduleType];
}

enums.ScheduleType scheduleTypeFromJson(Object? scheduleType) {
  if (scheduleType is int) {
    return enums.$ScheduleTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == scheduleType.toString(),
            orElse: () =>
                const MapEntry(enums.ScheduleType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (scheduleType is String) {
    return enums.$ScheduleTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == scheduleType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.ScheduleType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ScheduleType.swaggerGeneratedUnknown;
}

List<String> scheduleTypeListToJson(List<enums.ScheduleType>? scheduleType) {
  if (scheduleType == null) {
    return [];
  }

  return scheduleType.map((e) => enums.$ScheduleTypeMap[e]!).toList();
}

List<enums.ScheduleType> scheduleTypeListFromJson(List? scheduleType) {
  if (scheduleType == null) {
    return [];
  }

  return scheduleType.map((e) => scheduleTypeFromJson(e.toString())).toList();
}

String? sessionCompletionStateToJson(
    enums.SessionCompletionState? sessionCompletionState) {
  return enums.$SessionCompletionStateMap[sessionCompletionState];
}

enums.SessionCompletionState sessionCompletionStateFromJson(
    Object? sessionCompletionState) {
  if (sessionCompletionState is int) {
    return enums.$SessionCompletionStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                sessionCompletionState.toString(),
            orElse: () => const MapEntry(
                enums.SessionCompletionState.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (sessionCompletionState is String) {
    return enums.$SessionCompletionStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                sessionCompletionState.toLowerCase(),
            orElse: () => const MapEntry(
                enums.SessionCompletionState.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SessionCompletionState.swaggerGeneratedUnknown;
}

List<String> sessionCompletionStateListToJson(
    List<enums.SessionCompletionState>? sessionCompletionState) {
  if (sessionCompletionState == null) {
    return [];
  }

  return sessionCompletionState
      .map((e) => enums.$SessionCompletionStateMap[e]!)
      .toList();
}

List<enums.SessionCompletionState> sessionCompletionStateListFromJson(
    List? sessionCompletionState) {
  if (sessionCompletionState == null) {
    return [];
  }

  return sessionCompletionState
      .map((e) => sessionCompletionStateFromJson(e.toString()))
      .toList();
}

String? signInTypeToJson(enums.SignInType? signInType) {
  return enums.$SignInTypeMap[signInType];
}

enums.SignInType signInTypeFromJson(Object? signInType) {
  if (signInType is int) {
    return enums.$SignInTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == signInType.toString(),
            orElse: () =>
                const MapEntry(enums.SignInType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (signInType is String) {
    return enums.$SignInTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == signInType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.SignInType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SignInType.swaggerGeneratedUnknown;
}

List<String> signInTypeListToJson(List<enums.SignInType>? signInType) {
  if (signInType == null) {
    return [];
  }

  return signInType.map((e) => enums.$SignInTypeMap[e]!).toList();
}

List<enums.SignInType> signInTypeListFromJson(List? signInType) {
  if (signInType == null) {
    return [];
  }

  return signInType.map((e) => signInTypeFromJson(e.toString())).toList();
}

String? smsTypeToJson(enums.SmsType? smsType) {
  return enums.$SmsTypeMap[smsType];
}

enums.SmsType smsTypeFromJson(Object? smsType) {
  if (smsType is int) {
    return enums.$SmsTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == smsType.toString(),
            orElse: () =>
                const MapEntry(enums.SmsType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (smsType is String) {
    return enums.$SmsTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == smsType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.SmsType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SmsType.swaggerGeneratedUnknown;
}

List<String> smsTypeListToJson(List<enums.SmsType>? smsType) {
  if (smsType == null) {
    return [];
  }

  return smsType.map((e) => enums.$SmsTypeMap[e]!).toList();
}

List<enums.SmsType> smsTypeListFromJson(List? smsType) {
  if (smsType == null) {
    return [];
  }

  return smsType.map((e) => smsTypeFromJson(e.toString())).toList();
}

String? sortOrderToJson(enums.SortOrder? sortOrder) {
  return enums.$SortOrderMap[sortOrder];
}

enums.SortOrder sortOrderFromJson(Object? sortOrder) {
  if (sortOrder is int) {
    return enums.$SortOrderMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == sortOrder.toString(),
            orElse: () =>
                const MapEntry(enums.SortOrder.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (sortOrder is String) {
    return enums.$SortOrderMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == sortOrder.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.SortOrder.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SortOrder.swaggerGeneratedUnknown;
}

List<String> sortOrderListToJson(List<enums.SortOrder>? sortOrder) {
  if (sortOrder == null) {
    return [];
  }

  return sortOrder.map((e) => enums.$SortOrderMap[e]!).toList();
}

List<enums.SortOrder> sortOrderListFromJson(List? sortOrder) {
  if (sortOrder == null) {
    return [];
  }

  return sortOrder.map((e) => sortOrderFromJson(e.toString())).toList();
}

String? studyPhaseToJson(enums.StudyPhase? studyPhase) {
  return enums.$StudyPhaseMap[studyPhase];
}

enums.StudyPhase studyPhaseFromJson(Object? studyPhase) {
  if (studyPhase is int) {
    return enums.$StudyPhaseMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == studyPhase.toString(),
            orElse: () =>
                const MapEntry(enums.StudyPhase.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (studyPhase is String) {
    return enums.$StudyPhaseMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == studyPhase.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.StudyPhase.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.StudyPhase.swaggerGeneratedUnknown;
}

List<String> studyPhaseListToJson(List<enums.StudyPhase>? studyPhase) {
  if (studyPhase == null) {
    return [];
  }

  return studyPhase.map((e) => enums.$StudyPhaseMap[e]!).toList();
}

List<enums.StudyPhase> studyPhaseListFromJson(List? studyPhase) {
  if (studyPhase == null) {
    return [];
  }

  return studyPhase.map((e) => studyPhaseFromJson(e.toString())).toList();
}

String? roleToJson(enums.Role? role) {
  return enums.$RoleMap[role];
}

enums.Role roleFromJson(Object? role) {
  if (role is int) {
    return enums.$RoleMap.entries
        .firstWhere((element) => element.value.toLowerCase() == role.toString(),
            orElse: () =>
                const MapEntry(enums.Role.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (role is String) {
    return enums.$RoleMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == role.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.Role.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.Role.swaggerGeneratedUnknown;
}

List<String> roleListToJson(List<enums.Role>? role) {
  if (role == null) {
    return [];
  }

  return role.map((e) => enums.$RoleMap[e]!).toList();
}

List<enums.Role> roleListFromJson(List? role) {
  if (role == null) {
    return [];
  }

  return role.map((e) => roleFromJson(e.toString())).toList();
}

String? activityTypeToJson(enums.ActivityType? activityType) {
  return enums.$ActivityTypeMap[activityType];
}

enums.ActivityType activityTypeFromJson(Object? activityType) {
  if (activityType is int) {
    return enums.$ActivityTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == activityType.toString(),
            orElse: () =>
                const MapEntry(enums.ActivityType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (activityType is String) {
    return enums.$ActivityTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == activityType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.ActivityType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ActivityType.swaggerGeneratedUnknown;
}

List<String> activityTypeListToJson(List<enums.ActivityType>? activityType) {
  if (activityType == null) {
    return [];
  }

  return activityType.map((e) => enums.$ActivityTypeMap[e]!).toList();
}

List<enums.ActivityType> activityTypeListFromJson(List? activityType) {
  if (activityType == null) {
    return [];
  }

  return activityType.map((e) => activityTypeFromJson(e.toString())).toList();
}

String? unitToJson(enums.Unit? unit) {
  return enums.$UnitMap[unit];
}

enums.Unit unitFromJson(Object? unit) {
  if (unit is int) {
    return enums.$UnitMap.entries
        .firstWhere((element) => element.value.toLowerCase() == unit.toString(),
            orElse: () =>
                const MapEntry(enums.Unit.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (unit is String) {
    return enums.$UnitMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == unit.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.Unit.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.Unit.swaggerGeneratedUnknown;
}

List<String> unitListToJson(List<enums.Unit>? unit) {
  if (unit == null) {
    return [];
  }

  return unit.map((e) => enums.$UnitMap[e]!).toList();
}

List<enums.Unit> unitListFromJson(List? unit) {
  if (unit == null) {
    return [];
  }

  return unit.map((e) => unitFromJson(e.toString())).toList();
}

String? mimeTypeToJson(enums.MimeType? mimeType) {
  return enums.$MimeTypeMap[mimeType];
}

enums.MimeType mimeTypeFromJson(Object? mimeType) {
  if (mimeType is int) {
    return enums.$MimeTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == mimeType.toString(),
            orElse: () =>
                const MapEntry(enums.MimeType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (mimeType is String) {
    return enums.$MimeTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == mimeType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.MimeType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MimeType.swaggerGeneratedUnknown;
}

List<String> mimeTypeListToJson(List<enums.MimeType>? mimeType) {
  if (mimeType == null) {
    return [];
  }

  return mimeType.map((e) => enums.$MimeTypeMap[e]!).toList();
}

List<enums.MimeType> mimeTypeListFromJson(List? mimeType) {
  if (mimeType == null) {
    return [];
  }

  return mimeType.map((e) => mimeTypeFromJson(e.toString())).toList();
}

String? uIHintToJson(enums.UIHint? uIHint) {
  return enums.$UIHintMap[uIHint];
}

enums.UIHint uIHintFromJson(Object? uIHint) {
  if (uIHint is int) {
    return enums.$UIHintMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == uIHint.toString(),
            orElse: () =>
                const MapEntry(enums.UIHint.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (uIHint is String) {
    return enums.$UIHintMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == uIHint.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.UIHint.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UIHint.swaggerGeneratedUnknown;
}

List<String> uIHintListToJson(List<enums.UIHint>? uIHint) {
  if (uIHint == null) {
    return [];
  }

  return uIHint.map((e) => enums.$UIHintMap[e]!).toList();
}

List<enums.UIHint> uIHintListFromJson(List? uIHint) {
  if (uIHint == null) {
    return [];
  }

  return uIHint.map((e) => uIHintFromJson(e.toString())).toList();
}

String? operatorToJson(enums.Operator? operator) {
  return enums.$OperatorMap[operator];
}

enums.Operator operatorFromJson(Object? operator) {
  if (operator is int) {
    return enums.$OperatorMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == operator.toString(),
            orElse: () =>
                const MapEntry(enums.Operator.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (operator is String) {
    return enums.$OperatorMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == operator.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.Operator.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.Operator.swaggerGeneratedUnknown;
}

List<String> operatorListToJson(List<enums.Operator>? operator) {
  if (operator == null) {
    return [];
  }

  return operator.map((e) => enums.$OperatorMap[e]!).toList();
}

List<enums.Operator> operatorListFromJson(List? operator) {
  if (operator == null) {
    return [];
  }

  return operator.map((e) => operatorFromJson(e.toString())).toList();
}

String? reportTypeToJson(enums.ReportType? reportType) {
  return enums.$ReportTypeMap[reportType];
}

enums.ReportType reportTypeFromJson(Object? reportType) {
  if (reportType is int) {
    return enums.$ReportTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == reportType.toString(),
            orElse: () =>
                const MapEntry(enums.ReportType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (reportType is String) {
    return enums.$ReportTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == reportType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.ReportType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ReportType.swaggerGeneratedUnknown;
}

List<String> reportTypeListToJson(List<enums.ReportType>? reportType) {
  if (reportType == null) {
    return [];
  }

  return reportType.map((e) => enums.$ReportTypeMap[e]!).toList();
}

List<enums.ReportType> reportTypeListFromJson(List? reportType) {
  if (reportType == null) {
    return [];
  }

  return reportType.map((e) => reportTypeFromJson(e.toString())).toList();
}

String? searchTermPredicateToJson(
    enums.SearchTermPredicate? searchTermPredicate) {
  return enums.$SearchTermPredicateMap[searchTermPredicate];
}

enums.SearchTermPredicate searchTermPredicateFromJson(
    Object? searchTermPredicate) {
  if (searchTermPredicate is int) {
    return enums.$SearchTermPredicateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == searchTermPredicate.toString(),
            orElse: () => const MapEntry(
                enums.SearchTermPredicate.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (searchTermPredicate is String) {
    return enums.$SearchTermPredicateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                searchTermPredicate.toLowerCase(),
            orElse: () => const MapEntry(
                enums.SearchTermPredicate.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SearchTermPredicate.swaggerGeneratedUnknown;
}

List<String> searchTermPredicateListToJson(
    List<enums.SearchTermPredicate>? searchTermPredicate) {
  if (searchTermPredicate == null) {
    return [];
  }

  return searchTermPredicate
      .map((e) => enums.$SearchTermPredicateMap[e]!)
      .toList();
}

List<enums.SearchTermPredicate> searchTermPredicateListFromJson(
    List? searchTermPredicate) {
  if (searchTermPredicate == null) {
    return [];
  }

  return searchTermPredicate
      .map((e) => searchTermPredicateFromJson(e.toString()))
      .toList();
}

String? stringSearchPositionToJson(
    enums.StringSearchPosition? stringSearchPosition) {
  return enums.$StringSearchPositionMap[stringSearchPosition];
}

enums.StringSearchPosition stringSearchPositionFromJson(
    Object? stringSearchPosition) {
  if (stringSearchPosition is int) {
    return enums.$StringSearchPositionMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == stringSearchPosition.toString(),
            orElse: () => const MapEntry(
                enums.StringSearchPosition.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (stringSearchPosition is String) {
    return enums.$StringSearchPositionMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                stringSearchPosition.toLowerCase(),
            orElse: () => const MapEntry(
                enums.StringSearchPosition.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.StringSearchPosition.swaggerGeneratedUnknown;
}

List<String> stringSearchPositionListToJson(
    List<enums.StringSearchPosition>? stringSearchPosition) {
  if (stringSearchPosition == null) {
    return [];
  }

  return stringSearchPosition
      .map((e) => enums.$StringSearchPositionMap[e]!)
      .toList();
}

List<enums.StringSearchPosition> stringSearchPositionListFromJson(
    List? stringSearchPosition) {
  if (stringSearchPosition == null) {
    return [];
  }

  return stringSearchPosition
      .map((e) => stringSearchPositionFromJson(e.toString()))
      .toList();
}

String? sharedModuleTypeToJson(enums.SharedModuleType? sharedModuleType) {
  return enums.$SharedModuleTypeMap[sharedModuleType];
}

enums.SharedModuleType sharedModuleTypeFromJson(Object? sharedModuleType) {
  if (sharedModuleType is int) {
    return enums.$SharedModuleTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == sharedModuleType.toString(),
            orElse: () => const MapEntry(
                enums.SharedModuleType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (sharedModuleType is String) {
    return enums.$SharedModuleTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == sharedModuleType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.SharedModuleType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SharedModuleType.swaggerGeneratedUnknown;
}

List<String> sharedModuleTypeListToJson(
    List<enums.SharedModuleType>? sharedModuleType) {
  if (sharedModuleType == null) {
    return [];
  }

  return sharedModuleType.map((e) => enums.$SharedModuleTypeMap[e]!).toList();
}

List<enums.SharedModuleType> sharedModuleTypeListFromJson(
    List? sharedModuleType) {
  if (sharedModuleType == null) {
    return [];
  }

  return sharedModuleType
      .map((e) => sharedModuleTypeFromJson(e.toString()))
      .toList();
}

String? templateTypeToJson(enums.TemplateType? templateType) {
  return enums.$TemplateTypeMap[templateType];
}

enums.TemplateType templateTypeFromJson(Object? templateType) {
  if (templateType is int) {
    return enums.$TemplateTypeMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == templateType.toString(),
            orElse: () =>
                const MapEntry(enums.TemplateType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (templateType is String) {
    return enums.$TemplateTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == templateType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.TemplateType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.TemplateType.swaggerGeneratedUnknown;
}

List<String> templateTypeListToJson(List<enums.TemplateType>? templateType) {
  if (templateType == null) {
    return [];
  }

  return templateType.map((e) => enums.$TemplateTypeMap[e]!).toList();
}

List<enums.TemplateType> templateTypeListFromJson(List? templateType) {
  if (templateType == null) {
    return [];
  }

  return templateType.map((e) => templateTypeFromJson(e.toString())).toList();
}

String? uploadStatusToJson(enums.UploadStatus? uploadStatus) {
  return enums.$UploadStatusMap[uploadStatus];
}

enums.UploadStatus uploadStatusFromJson(Object? uploadStatus) {
  if (uploadStatus is int) {
    return enums.$UploadStatusMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == uploadStatus.toString(),
            orElse: () =>
                const MapEntry(enums.UploadStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (uploadStatus is String) {
    return enums.$UploadStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == uploadStatus.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.UploadStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UploadStatus.swaggerGeneratedUnknown;
}

List<String> uploadStatusListToJson(List<enums.UploadStatus>? uploadStatus) {
  if (uploadStatus == null) {
    return [];
  }

  return uploadStatus.map((e) => enums.$UploadStatusMap[e]!).toList();
}

List<enums.UploadStatus> uploadStatusListFromJson(List? uploadStatus) {
  if (uploadStatus == null) {
    return [];
  }

  return uploadStatus.map((e) => uploadStatusFromJson(e.toString())).toList();
}

String? uploadSchemaTypeToJson(enums.UploadSchemaType? uploadSchemaType) {
  return enums.$UploadSchemaTypeMap[uploadSchemaType];
}

enums.UploadSchemaType uploadSchemaTypeFromJson(Object? uploadSchemaType) {
  if (uploadSchemaType is int) {
    return enums.$UploadSchemaTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == uploadSchemaType.toString(),
            orElse: () => const MapEntry(
                enums.UploadSchemaType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (uploadSchemaType is String) {
    return enums.$UploadSchemaTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == uploadSchemaType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UploadSchemaType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UploadSchemaType.swaggerGeneratedUnknown;
}

List<String> uploadSchemaTypeListToJson(
    List<enums.UploadSchemaType>? uploadSchemaType) {
  if (uploadSchemaType == null) {
    return [];
  }

  return uploadSchemaType.map((e) => enums.$UploadSchemaTypeMap[e]!).toList();
}

List<enums.UploadSchemaType> uploadSchemaTypeListFromJson(
    List? uploadSchemaType) {
  if (uploadSchemaType == null) {
    return [];
  }

  return uploadSchemaType
      .map((e) => uploadSchemaTypeFromJson(e.toString()))
      .toList();
}

String? uploadValidationStrictnessToJson(
    enums.UploadValidationStrictness? uploadValidationStrictness) {
  return enums.$UploadValidationStrictnessMap[uploadValidationStrictness];
}

enums.UploadValidationStrictness uploadValidationStrictnessFromJson(
    Object? uploadValidationStrictness) {
  if (uploadValidationStrictness is int) {
    return enums.$UploadValidationStrictnessMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                uploadValidationStrictness.toString(),
            orElse: () => const MapEntry(
                enums.UploadValidationStrictness.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (uploadValidationStrictness is String) {
    return enums.$UploadValidationStrictnessMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                uploadValidationStrictness.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UploadValidationStrictness.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UploadValidationStrictness.swaggerGeneratedUnknown;
}

List<String> uploadValidationStrictnessListToJson(
    List<enums.UploadValidationStrictness>? uploadValidationStrictness) {
  if (uploadValidationStrictness == null) {
    return [];
  }

  return uploadValidationStrictness
      .map((e) => enums.$UploadValidationStrictnessMap[e]!)
      .toList();
}

List<enums.UploadValidationStrictness> uploadValidationStrictnessListFromJson(
    List? uploadValidationStrictness) {
  if (uploadValidationStrictness == null) {
    return [];
  }

  return uploadValidationStrictness
      .map((e) => uploadValidationStrictnessFromJson(e.toString()))
      .toList();
}

String? synapseExporterStatusToJson(
    enums.SynapseExporterStatus? synapseExporterStatus) {
  return enums.$SynapseExporterStatusMap[synapseExporterStatus];
}

enums.SynapseExporterStatus synapseExporterStatusFromJson(
    Object? synapseExporterStatus) {
  if (synapseExporterStatus is int) {
    return enums.$SynapseExporterStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == synapseExporterStatus.toString(),
            orElse: () => const MapEntry(
                enums.SynapseExporterStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (synapseExporterStatus is String) {
    return enums.$SynapseExporterStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                synapseExporterStatus.toLowerCase(),
            orElse: () => const MapEntry(
                enums.SynapseExporterStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SynapseExporterStatus.swaggerGeneratedUnknown;
}

List<String> synapseExporterStatusListToJson(
    List<enums.SynapseExporterStatus>? synapseExporterStatus) {
  if (synapseExporterStatus == null) {
    return [];
  }

  return synapseExporterStatus
      .map((e) => enums.$SynapseExporterStatusMap[e]!)
      .toList();
}

List<enums.SynapseExporterStatus> synapseExporterStatusListFromJson(
    List? synapseExporterStatus) {
  if (synapseExporterStatus == null) {
    return [];
  }

  return synapseExporterStatus
      .map((e) => synapseExporterStatusFromJson(e.toString()))
      .toList();
}

String? scheduleStatusToJson(enums.ScheduleStatus? scheduleStatus) {
  return enums.$ScheduleStatusMap[scheduleStatus];
}

enums.ScheduleStatus scheduleStatusFromJson(Object? scheduleStatus) {
  if (scheduleStatus is int) {
    return enums.$ScheduleStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == scheduleStatus.toString(),
            orElse: () => const MapEntry(
                enums.ScheduleStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (scheduleStatus is String) {
    return enums.$ScheduleStatusMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == scheduleStatus.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ScheduleStatus.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ScheduleStatus.swaggerGeneratedUnknown;
}

List<String> scheduleStatusListToJson(
    List<enums.ScheduleStatus>? scheduleStatus) {
  if (scheduleStatus == null) {
    return [];
  }

  return scheduleStatus.map((e) => enums.$ScheduleStatusMap[e]!).toList();
}

List<enums.ScheduleStatus> scheduleStatusListFromJson(List? scheduleStatus) {
  if (scheduleStatus == null) {
    return [];
  }

  return scheduleStatus
      .map((e) => scheduleStatusFromJson(e.toString()))
      .toList();
}

String? uploadFieldTypeToJson(enums.UploadFieldType? uploadFieldType) {
  return enums.$UploadFieldTypeMap[uploadFieldType];
}

enums.UploadFieldType uploadFieldTypeFromJson(Object? uploadFieldType) {
  if (uploadFieldType is int) {
    return enums.$UploadFieldTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == uploadFieldType.toString(),
            orElse: () => const MapEntry(
                enums.UploadFieldType.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (uploadFieldType is String) {
    return enums.$UploadFieldTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == uploadFieldType.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UploadFieldType.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UploadFieldType.swaggerGeneratedUnknown;
}

List<String> uploadFieldTypeListToJson(
    List<enums.UploadFieldType>? uploadFieldType) {
  if (uploadFieldType == null) {
    return [];
  }

  return uploadFieldType.map((e) => enums.$UploadFieldTypeMap[e]!).toList();
}

List<enums.UploadFieldType> uploadFieldTypeListFromJson(List? uploadFieldType) {
  if (uploadFieldType == null) {
    return [];
  }

  return uploadFieldType
      .map((e) => uploadFieldTypeFromJson(e.toString()))
      .toList();
}

String? resourceCategoryToJson(enums.ResourceCategory? resourceCategory) {
  return enums.$ResourceCategoryMap[resourceCategory];
}

enums.ResourceCategory resourceCategoryFromJson(Object? resourceCategory) {
  if (resourceCategory is int) {
    return enums.$ResourceCategoryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == resourceCategory.toString(),
            orElse: () => const MapEntry(
                enums.ResourceCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (resourceCategory is String) {
    return enums.$ResourceCategoryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == resourceCategory.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ResourceCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ResourceCategory.swaggerGeneratedUnknown;
}

List<String> resourceCategoryListToJson(
    List<enums.ResourceCategory>? resourceCategory) {
  if (resourceCategory == null) {
    return [];
  }

  return resourceCategory.map((e) => enums.$ResourceCategoryMap[e]!).toList();
}

List<enums.ResourceCategory> resourceCategoryListFromJson(
    List? resourceCategory) {
  if (resourceCategory == null) {
    return [];
  }

  return resourceCategory
      .map((e) => resourceCategoryFromJson(e.toString()))
      .toList();
}

String? uploadCompletedByToJson(enums.UploadCompletedBy? uploadCompletedBy) {
  return enums.$UploadCompletedByMap[uploadCompletedBy];
}

enums.UploadCompletedBy uploadCompletedByFromJson(Object? uploadCompletedBy) {
  if (uploadCompletedBy is int) {
    return enums.$UploadCompletedByMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == uploadCompletedBy.toString(),
            orElse: () => const MapEntry(
                enums.UploadCompletedBy.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (uploadCompletedBy is String) {
    return enums.$UploadCompletedByMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == uploadCompletedBy.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UploadCompletedBy.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UploadCompletedBy.swaggerGeneratedUnknown;
}

List<String> uploadCompletedByListToJson(
    List<enums.UploadCompletedBy>? uploadCompletedBy) {
  if (uploadCompletedBy == null) {
    return [];
  }

  return uploadCompletedBy.map((e) => enums.$UploadCompletedByMap[e]!).toList();
}

List<enums.UploadCompletedBy> uploadCompletedByListFromJson(
    List? uploadCompletedBy) {
  if (uploadCompletedBy == null) {
    return [];
  }

  return uploadCompletedBy
      .map((e) => uploadCompletedByFromJson(e.toString()))
      .toList();
}

String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}