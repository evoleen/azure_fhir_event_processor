class FhirEventBody {
  final String resourceFhirId;
  final String resourceType;
  final String resourceFhirAccount;
  final int resourceVersionId;

  FhirEventBody({
    required this.resourceFhirId,
    required this.resourceType,
    required this.resourceFhirAccount,
    required this.resourceVersionId,
  });

  static FhirEventBody fromJsonObj(Map<String, dynamic> jsonObj) {
    return FhirEventBody(
      resourceFhirId: jsonObj['resourceFhirId'],
      resourceType: jsonObj['resourceType'],
      resourceFhirAccount: jsonObj['resourceFhirAccount'],
      resourceVersionId: jsonObj['resourceVersionId'],
    );
  }
}
