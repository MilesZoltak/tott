class DataForUpload {
  const DataForUpload(this.taskGuid, this.sessionInstanceGuid, this.recordingPath, this.startDate, this.endDate, this.deviceTypeIdentifier, this.dataGroups, this.appVersion, this.deviceInfo, this.participantIds, this.participantAgeMonths, this.taskPayload, this.extraData);
  final String taskGuid;
  final String sessionInstanceGuid;
  final String recordingPath;
  final DateTime startDate;
  final DateTime endDate;
  final String deviceTypeIdentifier;
  final List<String> dataGroups;
  final String appVersion;
  final String deviceInfo;
  final List<String> participantIds;
  final List<int> participantAgeMonths;
  final Map<String, dynamic> taskPayload;
  final Map<String, dynamic> extraData;

  Map<String, dynamic> toMap() {
    return {
      "taskGuid": taskGuid,
      "sessionInstanceGuid": sessionInstanceGuid,
      "recordingPath": recordingPath,
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "deviceTypeIdentifier": deviceTypeIdentifier,
      "dataGroups": dataGroups,
      "appVersion": appVersion,
      "deviceInfo": deviceInfo,
      "participantIds": participantIds,
      "participantAgeMonths": participantAgeMonths,
      "taskPayload": taskPayload,
      "extraData": extraData
    };
  }
}