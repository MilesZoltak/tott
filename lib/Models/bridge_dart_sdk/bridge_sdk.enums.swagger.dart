import 'package:json_annotation/json_annotation.dart';

enum SharingScope {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('no_sharing')
  noSharing,
  @JsonValue('sponsors_and_partners')
  sponsorsAndPartners,
  @JsonValue('all_qualified_researchers')
  allQualifiedResearchers
}

const $SharingScopeMap = {
  SharingScope.noSharing: 'no_sharing',
  SharingScope.sponsorsAndPartners: 'sponsors_and_partners',
  SharingScope.allQualifiedResearchers: 'all_qualified_researchers'
};

enum AccountStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('enabled')
  enabled,
  @JsonValue('disabled')
  disabled,
  @JsonValue('unverified')
  unverified
}

const $AccountStatusMap = {
  AccountStatus.enabled: 'enabled',
  AccountStatus.disabled: 'disabled',
  AccountStatus.unverified: 'unverified'
};

enum ActivityEventUpdateType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('mutable')
  mutable,
  @JsonValue('immutable')
  immutable,
  @JsonValue('future_only')
  futureOnly
}

const $ActivityEventUpdateTypeMap = {
  ActivityEventUpdateType.mutable: 'mutable',
  ActivityEventUpdateType.immutable: 'immutable',
  ActivityEventUpdateType.futureOnly: 'future_only'
};

enum ContactRole {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('irb')
  irb,
  @JsonValue('principal_investigator')
  principalInvestigator,
  @JsonValue('investigator')
  investigator,
  @JsonValue('sponsor')
  sponsor,
  @JsonValue('study_support')
  studySupport,
  @JsonValue('technical_support')
  technicalSupport
}

const $ContactRoleMap = {
  ContactRole.irb: 'irb',
  ContactRole.principalInvestigator: 'principal_investigator',
  ContactRole.investigator: 'investigator',
  ContactRole.sponsor: 'sponsor',
  ContactRole.studySupport: 'study_support',
  ContactRole.technicalSupport: 'technical_support'
};

enum CountryCode {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('ca')
  ca,
  @JsonValue('us')
  us
}

const $CountryCodeMap = {CountryCode.ca: 'ca', CountryCode.us: 'us'};

enum DataType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('duration')
  duration,
  @JsonValue('string')
  string,
  @JsonValue('integer')
  integer,
  @JsonValue('decimal')
  decimal,
  @JsonValue('boolean')
  boolean,
  @JsonValue('date')
  date,
  @JsonValue('time')
  time,
  @JsonValue('datetime')
  datetime,
  @JsonValue('bloodpressure')
  bloodpressure,
  @JsonValue('height')
  height,
  @JsonValue('weight')
  weight,
  @JsonValue('yearmonth')
  yearmonth,
  @JsonValue('year')
  year,
  @JsonValue('postalcode')
  postalcode
}

const $DataTypeMap = {
  DataType.duration: 'duration',
  DataType.string: 'string',
  DataType.integer: 'integer',
  DataType.decimal: 'decimal',
  DataType.boolean: 'boolean',
  DataType.date: 'date',
  DataType.time: 'time',
  DataType.datetime: 'datetime',
  DataType.bloodpressure: 'bloodpressure',
  DataType.height: 'height',
  DataType.weight: 'weight',
  DataType.yearmonth: 'yearmonth',
  DataType.year: 'year',
  DataType.postalcode: 'postalcode'
};

enum EnrollmentFilter {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('enrolled')
  enrolled,
  @JsonValue('withdrawn')
  withdrawn,
  @JsonValue('all')
  all
}

const $EnrollmentFilterMap = {
  EnrollmentFilter.enrolled: 'enrolled',
  EnrollmentFilter.withdrawn: 'withdrawn',
  EnrollmentFilter.all: 'all'
};

enum Environment {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('local')
  local,
  @JsonValue('develop')
  develop,
  @JsonValue('staging')
  staging,
  @JsonValue('production')
  production
}

const $EnvironmentMap = {
  Environment.local: 'local',
  Environment.develop: 'develop',
  Environment.staging: 'staging',
  Environment.production: 'production'
};

enum FileDisposition {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('inline')
  inline,
  @JsonValue('attachment')
  attachment
}

const $FileDispositionMap = {
  FileDisposition.inline: 'inline',
  FileDisposition.attachment: 'attachment'
};

enum FileRevisionStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('pending')
  pending,
  @JsonValue('available')
  available
}

const $FileRevisionStatusMap = {
  FileRevisionStatus.pending: 'pending',
  FileRevisionStatus.available: 'available'
};

enum IrbDecisionType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('exempt')
  exempt,
  @JsonValue('approved')
  approved
}

const $IrbDecisionTypeMap = {
  IrbDecisionType.exempt: 'exempt',
  IrbDecisionType.approved: 'approved'
};

enum NotificationProtocol {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('application')
  application,
  @JsonValue('sms')
  sms
}

const $NotificationProtocolMap = {
  NotificationProtocol.application: 'application',
  NotificationProtocol.sms: 'sms'
};

enum NotificationType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('after_window_start')
  afterWindowStart,
  @JsonValue('before_window_end')
  beforeWindowEnd
}

const $NotificationTypeMap = {
  NotificationType.afterWindowStart: 'after_window_start',
  NotificationType.beforeWindowEnd: 'before_window_end'
};

enum PerformanceOrder {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('participant_choice')
  participantChoice,
  @JsonValue('sequential')
  sequential,
  @JsonValue('randomized')
  randomized
}

const $PerformanceOrderMap = {
  PerformanceOrder.participantChoice: 'participant_choice',
  PerformanceOrder.sequential: 'sequential',
  PerformanceOrder.randomized: 'randomized'
};

enum AdherenceRecordType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('assessment')
  assessment,
  @JsonValue('session')
  session
}

const $AdherenceRecordTypeMap = {
  AdherenceRecordType.assessment: 'assessment',
  AdherenceRecordType.session: 'session'
};

enum ScheduleType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('once')
  once,
  @JsonValue('recurring')
  recurring,
  @JsonValue('persistent')
  persistent
}

const $ScheduleTypeMap = {
  ScheduleType.once: 'once',
  ScheduleType.recurring: 'recurring',
  ScheduleType.persistent: 'persistent'
};

enum SessionCompletionState {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('not_yet_available')
  notYetAvailable,
  @JsonValue('unstarted')
  unstarted,
  @JsonValue('started')
  started,
  @JsonValue('completed')
  completed,
  @JsonValue('abandoned')
  abandoned,
  @JsonValue('expired')
  expired,
  @JsonValue('not_applicable')
  notApplicable,
  @JsonValue('declined')
  declined
}

const $SessionCompletionStateMap = {
  SessionCompletionState.notYetAvailable: 'not_yet_available',
  SessionCompletionState.unstarted: 'unstarted',
  SessionCompletionState.started: 'started',
  SessionCompletionState.completed: 'completed',
  SessionCompletionState.abandoned: 'abandoned',
  SessionCompletionState.expired: 'expired',
  SessionCompletionState.notApplicable: 'not_applicable',
  SessionCompletionState.declined: 'declined'
};

enum SignInType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('email_password')
  emailPassword,
  @JsonValue('phone_password')
  phonePassword,
  @JsonValue('external_id_password')
  externalIdPassword,
  @JsonValue('email_message')
  emailMessage,
  @JsonValue('phone_message')
  phoneMessage
}

const $SignInTypeMap = {
  SignInType.emailPassword: 'email_password',
  SignInType.phonePassword: 'phone_password',
  SignInType.externalIdPassword: 'external_id_password',
  SignInType.emailMessage: 'email_message',
  SignInType.phoneMessage: 'phone_message'
};

enum SmsType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('promotional')
  promotional,
  @JsonValue('transactional')
  transactional
}

const $SmsTypeMap = {
  SmsType.promotional: 'promotional',
  SmsType.transactional: 'transactional'
};

enum SortOrder {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('asc')
  asc,
  @JsonValue('desc')
  desc
}

const $SortOrderMap = {SortOrder.asc: 'asc', SortOrder.desc: 'desc'};

enum StudyPhase {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('legacy')
  legacy,
  @JsonValue('design')
  design,
  @JsonValue('recruitment')
  recruitment,
  @JsonValue('in_flight')
  inFlight,
  @JsonValue('analysis')
  analysis,
  @JsonValue('completed')
  completed,
  @JsonValue('withdrawn')
  withdrawn
}

const $StudyPhaseMap = {
  StudyPhase.legacy: 'legacy',
  StudyPhase.design: 'design',
  StudyPhase.recruitment: 'recruitment',
  StudyPhase.inFlight: 'in_flight',
  StudyPhase.analysis: 'analysis',
  StudyPhase.completed: 'completed',
  StudyPhase.withdrawn: 'withdrawn'
};

enum Role {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('developer')
  developer,
  @JsonValue('researcher')
  researcher,
  @JsonValue('study_coordinator')
  studyCoordinator,
  @JsonValue('study_designer')
  studyDesigner,
  @JsonValue('admin')
  admin,
  @JsonValue('org_admin')
  orgAdmin,
  @JsonValue('worker')
  worker,
  @JsonValue('superadmin')
  superadmin
}

const $RoleMap = {
  Role.developer: 'developer',
  Role.researcher: 'researcher',
  Role.studyCoordinator: 'study_coordinator',
  Role.studyDesigner: 'study_designer',
  Role.admin: 'admin',
  Role.orgAdmin: 'org_admin',
  Role.worker: 'worker',
  Role.superadmin: 'superadmin'
};

enum ActivityType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('compound')
  compound,
  @JsonValue('survey')
  survey,
  @JsonValue('task')
  task
}

const $ActivityTypeMap = {
  ActivityType.compound: 'compound',
  ActivityType.survey: 'survey',
  ActivityType.task: 'task'
};

enum Unit {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('seconds')
  seconds,
  @JsonValue('minutes')
  minutes,
  @JsonValue('hours')
  hours,
  @JsonValue('days')
  days,
  @JsonValue('weeks')
  weeks,
  @JsonValue('months')
  months,
  @JsonValue('years')
  years,
  @JsonValue('inches')
  inches,
  @JsonValue('feet')
  feet,
  @JsonValue('yards')
  yards,
  @JsonValue('miles')
  miles,
  @JsonValue('ounces')
  ounces,
  @JsonValue('pounds')
  pounds,
  @JsonValue('pints')
  pints,
  @JsonValue('quarts')
  quarts,
  @JsonValue('gallons')
  gallons,
  @JsonValue('centimeters')
  centimeters,
  @JsonValue('meters')
  meters,
  @JsonValue('kilometers')
  kilometers,
  @JsonValue('grams')
  grams,
  @JsonValue('kilograms')
  kilograms,
  @JsonValue('milliliters')
  milliliters,
  @JsonValue('cubic_centimeters')
  cubicCentimeters,
  @JsonValue('liters')
  liters,
  @JsonValue('cubic_meters')
  cubicMeters,
  @JsonValue('millimeters_mercury')
  millimetersMercury
}

const $UnitMap = {
  Unit.seconds: 'seconds',
  Unit.minutes: 'minutes',
  Unit.hours: 'hours',
  Unit.days: 'days',
  Unit.weeks: 'weeks',
  Unit.months: 'months',
  Unit.years: 'years',
  Unit.inches: 'inches',
  Unit.feet: 'feet',
  Unit.yards: 'yards',
  Unit.miles: 'miles',
  Unit.ounces: 'ounces',
  Unit.pounds: 'pounds',
  Unit.pints: 'pints',
  Unit.quarts: 'quarts',
  Unit.gallons: 'gallons',
  Unit.centimeters: 'centimeters',
  Unit.meters: 'meters',
  Unit.kilometers: 'kilometers',
  Unit.grams: 'grams',
  Unit.kilograms: 'kilograms',
  Unit.milliliters: 'milliliters',
  Unit.cubicCentimeters: 'cubic_centimeters',
  Unit.liters: 'liters',
  Unit.cubicMeters: 'cubic_meters',
  Unit.millimetersMercury: 'millimeters_mercury'
};

enum MimeType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('text/plain')
  textPlain,
  @JsonValue('text/html')
  textHtml,
  @JsonValue('application/pdf')
  applicationPdf
}

const $MimeTypeMap = {
  MimeType.textPlain: 'text/plain',
  MimeType.textHtml: 'text/html',
  MimeType.applicationPdf: 'application/pdf'
};

enum UIHint {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('bloodpressure')
  bloodpressure,
  @JsonValue('checkbox')
  checkbox,
  @JsonValue('combobox')
  combobox,
  @JsonValue('datepicker')
  datepicker,
  @JsonValue('datetimepicker')
  datetimepicker,
  @JsonValue('height')
  height,
  @JsonValue('list')
  list,
  @JsonValue('multilinetext')
  multilinetext,
  @JsonValue('numberfield')
  numberfield,
  @JsonValue('radiobutton')
  radiobutton,
  @JsonValue('select')
  select,
  @JsonValue('slider')
  slider,
  @JsonValue('textfield')
  textfield,
  @JsonValue('timepicker')
  timepicker,
  @JsonValue('toggle')
  toggle,
  @JsonValue('weight')
  weight,
  @JsonValue('yearmonth')
  yearmonth,
  @JsonValue('year')
  year,
  @JsonValue('postalcode')
  postalcode
}

const $UIHintMap = {
  UIHint.bloodpressure: 'bloodpressure',
  UIHint.checkbox: 'checkbox',
  UIHint.combobox: 'combobox',
  UIHint.datepicker: 'datepicker',
  UIHint.datetimepicker: 'datetimepicker',
  UIHint.height: 'height',
  UIHint.list: 'list',
  UIHint.multilinetext: 'multilinetext',
  UIHint.numberfield: 'numberfield',
  UIHint.radiobutton: 'radiobutton',
  UIHint.select: 'select',
  UIHint.slider: 'slider',
  UIHint.textfield: 'textfield',
  UIHint.timepicker: 'timepicker',
  UIHint.toggle: 'toggle',
  UIHint.weight: 'weight',
  UIHint.yearmonth: 'yearmonth',
  UIHint.year: 'year',
  UIHint.postalcode: 'postalcode'
};

enum Operator {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('eq')
  eq,
  @JsonValue('ne')
  ne,
  @JsonValue('lt')
  lt,
  @JsonValue('gt')
  gt,
  @JsonValue('le')
  le,
  @JsonValue('ge')
  ge,
  @JsonValue('de')
  de,
  @JsonValue('always')
  always,
  @JsonValue('any')
  any,
  @JsonValue('all')
  all
}

const $OperatorMap = {
  Operator.eq: 'eq',
  Operator.ne: 'ne',
  Operator.lt: 'lt',
  Operator.gt: 'gt',
  Operator.le: 'le',
  Operator.ge: 'ge',
  Operator.de: 'de',
  Operator.always: 'always',
  Operator.any: 'any',
  Operator.all: 'all'
};

enum ReportType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('participant')
  participant,
  @JsonValue('study')
  study
}

const $ReportTypeMap = {
  ReportType.participant: 'participant',
  ReportType.study: 'study'
};

enum SearchTermPredicate {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('and')
  and,
  @JsonValue('or')
  or
}

const $SearchTermPredicateMap = {
  SearchTermPredicate.and: 'and',
  SearchTermPredicate.or: 'or'
};

enum StringSearchPosition {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('prefix')
  prefix,
  @JsonValue('infix')
  infix,
  @JsonValue('postfix')
  postfix,
  @JsonValue('exact')
  exact
}

const $StringSearchPositionMap = {
  StringSearchPosition.prefix: 'prefix',
  StringSearchPosition.infix: 'infix',
  StringSearchPosition.postfix: 'postfix',
  StringSearchPosition.exact: 'exact'
};

enum SharedModuleType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('schema')
  schema,
  @JsonValue('survey')
  survey
}

const $SharedModuleTypeMap = {
  SharedModuleType.schema: 'schema',
  SharedModuleType.survey: 'survey'
};

enum TemplateType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('email_account_exists')
  emailAccountExists,
  @JsonValue('email_app_install_link')
  emailAppInstallLink,
  @JsonValue('email_reset_password')
  emailResetPassword,
  @JsonValue('email_sign_in')
  emailSignIn,
  @JsonValue('email_signed_consent')
  emailSignedConsent,
  @JsonValue('email_verify_email')
  emailVerifyEmail,
  @JsonValue('sms_account_exists')
  smsAccountExists,
  @JsonValue('sms_app_install_link')
  smsAppInstallLink,
  @JsonValue('sms_phone_sign_in')
  smsPhoneSignIn,
  @JsonValue('sms_reset_password')
  smsResetPassword,
  @JsonValue('sms_signed_consent')
  smsSignedConsent,
  @JsonValue('sms_verify_phone')
  smsVerifyPhone
}

const $TemplateTypeMap = {
  TemplateType.emailAccountExists: 'email_account_exists',
  TemplateType.emailAppInstallLink: 'email_app_install_link',
  TemplateType.emailResetPassword: 'email_reset_password',
  TemplateType.emailSignIn: 'email_sign_in',
  TemplateType.emailSignedConsent: 'email_signed_consent',
  TemplateType.emailVerifyEmail: 'email_verify_email',
  TemplateType.smsAccountExists: 'sms_account_exists',
  TemplateType.smsAppInstallLink: 'sms_app_install_link',
  TemplateType.smsPhoneSignIn: 'sms_phone_sign_in',
  TemplateType.smsResetPassword: 'sms_reset_password',
  TemplateType.smsSignedConsent: 'sms_signed_consent',
  TemplateType.smsVerifyPhone: 'sms_verify_phone'
};

enum UploadStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('unknown')
  unknown,
  @JsonValue('requested')
  requested,
  @JsonValue('validation_in_progress')
  validationInProgress,
  @JsonValue('validation_failed')
  validationFailed,
  @JsonValue('duplicate')
  duplicate,
  @JsonValue('succeeded')
  succeeded
}

const $UploadStatusMap = {
  UploadStatus.unknown: 'unknown',
  UploadStatus.requested: 'requested',
  UploadStatus.validationInProgress: 'validation_in_progress',
  UploadStatus.validationFailed: 'validation_failed',
  UploadStatus.duplicate: 'duplicate',
  UploadStatus.succeeded: 'succeeded'
};

enum UploadSchemaType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('ios_data')
  iosData,
  @JsonValue('ios_survey')
  iosSurvey,
  @JsonValue('upload_v2')
  uploadV2
}

const $UploadSchemaTypeMap = {
  UploadSchemaType.iosData: 'ios_data',
  UploadSchemaType.iosSurvey: 'ios_survey',
  UploadSchemaType.uploadV2: 'upload_v2'
};

enum UploadValidationStrictness {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('warning')
  warning,
  @JsonValue('report')
  report,
  @JsonValue('strict')
  strict
}

const $UploadValidationStrictnessMap = {
  UploadValidationStrictness.warning: 'warning',
  UploadValidationStrictness.report: 'report',
  UploadValidationStrictness.strict: 'strict'
};

enum SynapseExporterStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('not_exported')
  notExported,
  @JsonValue('succeeded')
  succeeded
}

const $SynapseExporterStatusMap = {
  SynapseExporterStatus.notExported: 'not_exported',
  SynapseExporterStatus.succeeded: 'succeeded'
};

enum ScheduleStatus {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('deleted')
  deleted,
  @JsonValue('finished')
  finished,
  @JsonValue('started')
  started,
  @JsonValue('expired')
  expired,
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('available')
  available
}

const $ScheduleStatusMap = {
  ScheduleStatus.deleted: 'deleted',
  ScheduleStatus.finished: 'finished',
  ScheduleStatus.started: 'started',
  ScheduleStatus.expired: 'expired',
  ScheduleStatus.scheduled: 'scheduled',
  ScheduleStatus.available: 'available'
};

enum UploadFieldType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('attachment_blob')
  attachmentBlob,
  @JsonValue('attachment_csv')
  attachmentCsv,
  @JsonValue('attachment_json_blob')
  attachmentJsonBlob,
  @JsonValue('attachment_json_table')
  attachmentJsonTable,
  @JsonValue('attachment_v2')
  attachmentV2,
  @JsonValue('boolean')
  boolean,
  @JsonValue('calendar_date')
  calendarDate,
  @JsonValue('duration_v2')
  durationV2,
  @JsonValue('float')
  float,
  @JsonValue('inline_json_blob')
  inlineJsonBlob,
  @JsonValue('int')
  int,
  @JsonValue('large_text_attachment')
  largeTextAttachment,
  @JsonValue('multi_choice')
  multiChoice,
  @JsonValue('single_choice')
  singleChoice,
  @JsonValue('string')
  string,
  @JsonValue('time_v2')
  timeV2,
  @JsonValue('timestamp')
  timestamp
}

const $UploadFieldTypeMap = {
  UploadFieldType.attachmentBlob: 'attachment_blob',
  UploadFieldType.attachmentCsv: 'attachment_csv',
  UploadFieldType.attachmentJsonBlob: 'attachment_json_blob',
  UploadFieldType.attachmentJsonTable: 'attachment_json_table',
  UploadFieldType.attachmentV2: 'attachment_v2',
  UploadFieldType.boolean: 'boolean',
  UploadFieldType.calendarDate: 'calendar_date',
  UploadFieldType.durationV2: 'duration_v2',
  UploadFieldType.float: 'float',
  UploadFieldType.inlineJsonBlob: 'inline_json_blob',
  UploadFieldType.int: 'int',
  UploadFieldType.largeTextAttachment: 'large_text_attachment',
  UploadFieldType.multiChoice: 'multi_choice',
  UploadFieldType.singleChoice: 'single_choice',
  UploadFieldType.string: 'string',
  UploadFieldType.timeV2: 'time_v2',
  UploadFieldType.timestamp: 'timestamp'
};

enum ResourceCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('customization_options')
  customizationOptions,
  @JsonValue('data_repository')
  dataRepository,
  @JsonValue('science_documentation')
  scienceDocumentation,
  @JsonValue('developer_documentation')
  developerDocumentation,
  @JsonValue('license')
  license,
  @JsonValue('publication')
  publication,
  @JsonValue('release_note')
  releaseNote,
  @JsonValue('sample_app')
  sampleApp,
  @JsonValue('sample_data')
  sampleData,
  @JsonValue('screenshot')
  screenshot,
  @JsonValue('see_also')
  seeAlso,
  @JsonValue('used_in_study')
  usedInStudy,
  @JsonValue('website')
  website,
  @JsonValue('other')
  other
}

const $ResourceCategoryMap = {
  ResourceCategory.customizationOptions: 'customization_options',
  ResourceCategory.dataRepository: 'data_repository',
  ResourceCategory.scienceDocumentation: 'science_documentation',
  ResourceCategory.developerDocumentation: 'developer_documentation',
  ResourceCategory.license: 'license',
  ResourceCategory.publication: 'publication',
  ResourceCategory.releaseNote: 'release_note',
  ResourceCategory.sampleApp: 'sample_app',
  ResourceCategory.sampleData: 'sample_data',
  ResourceCategory.screenshot: 'screenshot',
  ResourceCategory.seeAlso: 'see_also',
  ResourceCategory.usedInStudy: 'used_in_study',
  ResourceCategory.website: 'website',
  ResourceCategory.other: 'other'
};

enum UploadCompletedBy {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('app')
  app,
  @JsonValue('s3_worker')
  s3Worker
}

const $UploadCompletedByMap = {
  UploadCompletedBy.app: 'app',
  UploadCompletedBy.s3Worker: 's3_worker'
};

enum V1AssessmentsIdentifierAssessmentIdResourcesGetCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('customization_options')
  customizationOptions,
  @JsonValue('data_repository')
  dataRepository,
  @JsonValue('science_documentation')
  scienceDocumentation,
  @JsonValue('developer_documentation')
  developerDocumentation,
  @JsonValue('license')
  license,
  @JsonValue('publication')
  publication,
  @JsonValue('release_note')
  releaseNote,
  @JsonValue('sample_app')
  sampleApp,
  @JsonValue('sample_data')
  sampleData,
  @JsonValue('screenshot')
  screenshot,
  @JsonValue('see_also')
  seeAlso,
  @JsonValue('used_in_study')
  usedInStudy,
  @JsonValue('website')
  website,
  @JsonValue('other')
  other
}

const $V1AssessmentsIdentifierAssessmentIdResourcesGetCategoryMap = {
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.customizationOptions:
      'customization_options',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.dataRepository:
      'data_repository',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.scienceDocumentation:
      'science_documentation',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory
      .developerDocumentation: 'developer_documentation',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.license: 'license',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.publication:
      'publication',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.releaseNote:
      'release_note',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.sampleApp:
      'sample_app',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.sampleData:
      'sample_data',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.screenshot:
      'screenshot',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.seeAlso: 'see_also',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.usedInStudy:
      'used_in_study',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.website: 'website',
  V1AssessmentsIdentifierAssessmentIdResourcesGetCategory.other: 'other'
};

enum V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('customization_options')
  customizationOptions,
  @JsonValue('data_repository')
  dataRepository,
  @JsonValue('science_documentation')
  scienceDocumentation,
  @JsonValue('developer_documentation')
  developerDocumentation,
  @JsonValue('license')
  license,
  @JsonValue('publication')
  publication,
  @JsonValue('release_note')
  releaseNote,
  @JsonValue('sample_app')
  sampleApp,
  @JsonValue('sample_data')
  sampleData,
  @JsonValue('screenshot')
  screenshot,
  @JsonValue('see_also')
  seeAlso,
  @JsonValue('used_in_study')
  usedInStudy,
  @JsonValue('website')
  website,
  @JsonValue('other')
  other
}

const $V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategoryMap = {
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory
      .customizationOptions: 'customization_options',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.dataRepository:
      'data_repository',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory
      .scienceDocumentation: 'science_documentation',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory
      .developerDocumentation: 'developer_documentation',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.license:
      'license',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.publication:
      'publication',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.releaseNote:
      'release_note',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.sampleApp:
      'sample_app',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.sampleData:
      'sample_data',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.screenshot:
      'screenshot',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.seeAlso:
      'see_also',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.usedInStudy:
      'used_in_study',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.website:
      'website',
  V1SharedassessmentsIdentifierAssessmentIdResourcesGetCategory.other: 'other'
};
