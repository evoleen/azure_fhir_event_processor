import 'dart:convert';

import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';
import 'package:fhir_r4/fhir_r4.dart';
import 'package:test/test.dart';

void main() {
  group('Subscription notification format (Fire Arrow MESSAGE channel)', () {
    test('FhirEvent.fromSubscriptionJson parses notification JSON', () {
      const jsonStr = '''
        {
          "notificationId": "550e8400-e29b-41d4-a716-446655440000",
          "timestamp": "2024-01-15T10:30:00Z",
          "subscriptionId": "Subscription/123",
          "eventType": "CREATE",
          "resourceType": "Patient",
          "resourceId": "Patient/456",
          "resourceVersionId": "Patient/456/_history/1",
          "payloadContentType": "application/fhir+json",
          "criteria": "Patient?"
        }
      ''';
      final json = jsonDecode(jsonStr) as Map<String, Object?>;
      final event = FhirEvent.fromSubscriptionJson(json);

      expect(event.id, '550e8400-e29b-41d4-a716-446655440000');
      expect(event.eventType, FhirEventType.resourceCreated);
      expect(event.resourceType, 'Patient');
      expect(event.resourceId, 'Patient/456');
      expect(event.resourceVersionId, 'Patient/456/_history/1');
      expect(event.subscriptionId, 'Subscription/123');
      expect(event.subscriptionTimestamp, '2024-01-15T10:30:00Z');
      expect(event.criteria, 'Patient?');
      expect(event.data, isNull);
    });

    test('FhirEvent.fromJson auto-detects subscription format', () {
      const jsonStr = '''
        {
          "notificationId": "660e8400-e29b-41d4-a716-446655440001",
          "subscriptionId": "Subscription/456",
          "eventType": "UPDATE",
          "resourceType": "Observation",
          "resourceId": "Observation/789"
        }
      ''';
      final json = jsonDecode(jsonStr) as Map<String, Object?>;
      final event = FhirEvent.fromJson(json);

      expect(event.eventType, FhirEventType.resourceUpdated);
      expect(event.resourceType, 'Observation');
      expect(event.resourceId, 'Observation/789');
    });

    test('SubscriptionNotificationFhirMessageParser produces FhirMessage', () {
      const body = '''
        {
          "notificationId": "a1b2c3",
          "subscriptionId": "Subscription/1",
          "eventType": "DELETE",
          "resourceType": "Patient",
          "resourceId": "Patient/999"
        }
      ''';
      const metadata = QueueMessageMetadata(
        id: 'msg-1',
        popReceipt: 'receipt',
        insertionTime: '2024-01-01T00:00:00Z',
        expirationTime: '2024-01-02T00:00:00Z',
        dequeueCount: 0,
      );
      final parser = SubscriptionNotificationFhirMessageParser();
      final message = parser.parse(body, metadata);

      expect(message.id, 'msg-1');
      expect(message.fhirEvent.id, 'a1b2c3');
      expect(message.fhirEvent.eventType, FhirEventType.resourceDeleted);
      expect(message.fhirEvent.resourceType, 'Patient');
      expect(message.fhirEvent.resourceId, 'Patient/999');
    });

    test('payloadResource parses FHIR JSON when payload and contentType present',
        () {
      const patientPayload =
          '{"resourceType":"Patient","id":"456","meta":{"versionId":"1"}}';
      final json = <String, Object?>{
        'notificationId': '550e8400-e29b-41d4-a716-446655440000',
        'subscriptionId': 'Subscription/123',
        'eventType': 'CREATE',
        'resourceType': 'Patient',
        'resourceId': 'Patient/456',
        'payload': patientPayload,
        'payloadContentType': 'application/fhir+json',
      };
      final event = FhirEvent.fromSubscriptionJson(json);

      expect(event.payload, isNotNull);
      expect(event.payloadContentType, 'application/fhir+json');

      final resource = event.payloadResource;
      expect(resource, isNotNull);
      expect(resource, isA<Patient>());
      expect((resource! as Patient).id?.valueString, '456');
    });

    test('payloadResource is null when payload is missing', () {
      const jsonStr = '''
        {
          "notificationId": "n1",
          "subscriptionId": "Subscription/1",
          "eventType": "CREATE",
          "resourceType": "Patient",
          "resourceId": "Patient/1"
        }
      ''';
      final event =
          FhirEvent.fromSubscriptionJson(jsonDecode(jsonStr) as Map<String, Object?>);
      expect(event.payload, isNull);
      expect(event.payloadResource, isNull);
    });

    test('payloadResource is null when payload is not JSON content type', () {
      const jsonStr = '''
        {
          "notificationId": "n1",
          "subscriptionId": "Subscription/1",
          "eventType": "CREATE",
          "resourceType": "Patient",
          "resourceId": "Patient/1",
          "payload": "<Patient/>",
          "payloadContentType": "application/fhir+xml"
        }
      ''';
      final event =
          FhirEvent.fromSubscriptionJson(jsonDecode(jsonStr) as Map<String, Object?>);
      expect(event.payloadResource, isNull);
    });
  });
}
