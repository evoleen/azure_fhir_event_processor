import 'dart:convert';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_event_body.dart';

class FhirEvent {
  final String id;
  final String topic;
  final String subject;
  final FhirEventBody body;
  final String eventType;
  final String dataVersion;
  final String metadataVersion;
  final String eventTime;

  FhirEvent({
    required this.id,
    required this.topic,
    required this.subject,
    required this.eventType,
    required this.dataVersion,
    required this.metadataVersion,
    required this.eventTime,
    required this.body,
  });

  static FhirEvent fromJsonStr(jsonStr) {
    final eventJsonObj = jsonDecode(jsonStr) as Map<String, dynamic>;
    final fhirEventBody = FhirEventBody.fromJsonObj(eventJsonObj['data']);

    return FhirEvent(
      id: eventJsonObj['id'],
      topic: eventJsonObj['topic'],
      subject: eventJsonObj['subject'],
      eventType: eventJsonObj['eventType'],
      dataVersion: eventJsonObj['dataVersion'],
      metadataVersion: eventJsonObj['metadataVersion'],
      eventTime: eventJsonObj['eventTime'],
      body: fhirEventBody,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topic': topic,
      'subject': subject,
      'eventType': eventType,
      'dataVersion': dataVersion,
      'metadataVersion': metadataVersion,
      'eventTime': eventTime,
      'body': body.toJson()
    };
  }
}
