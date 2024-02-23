import 'package:azstore/azstore.dart';
import 'package:evoleen_fhir_events/evoleen_fhir_events.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'message_client_test.mocks.dart';

const xmlMessageStr = '''
  <QueueMessage><MessageId
      MessageId>ddd-8438ecb7-06a2-4f04-b8b2-211b6f236003</MessageId>
      <InsertionTime>Mon, 19 Feb 2024 13:08:42 GMT</InsertionTime>
      <ExpirationTime>Mon, 26 Feb 2024 13:08:42 GMT</ExpirationTime>
      <PopReceipt>test-AgAAAAMAAAAAAAAAoo0A5kBj2gE=</PopReceipt>
      <TimeNextVisible>Mon, 19 Feb 2024 14:35:34 GMT</TimeNextVisible>
      <DequeueCount>3</DequeueCount>
      <MessageText>eyJpZCI6ImY0ZjQ1ZGU1LWUzNWQtYzFmNy0xNjhlLTM1NDMzYmU0M2ViYiIsInRvcGljIjoiL3N1YnNjcmlwdGlvbnMvOTQ5ZjRmOTAtZGE2NS00N2MzLTg2OTQtOTJiZGEwMjk0MjU5L3Jlc291cmNlR3JvdXBzL2V2b2xlZW4tZGV2LXJlc291cmNlLWdyb3VwL3Byb3ZpZGVycy9NaWNyb3NvZnQuSGVhbHRoY2FyZUFwaXMvd29ya3NwYWNlcy9ldm9sZWVud29ya3NwYWNlIiwic3ViamVjdCI6ImV2b2xlZW53b3Jrc3BhY2UtZXZvbGVlbi1kYXRhLmZoaXIuYXp1cmVoZWFsdGhjYXJlYXBpcy5jb20vUGF0aWVudC82MGUyN2ZhMy1lNzQwLTRhNTYtYjIwZS1iNmNkN2YzYzM2OWIiLCJkYXRhIjp7InJlc291cmNlVHlwZSI6IlBhdGllbnQiLCJyZXNvdXJjZUZoaXJBY2NvdW50IjoiZXZvbGVlbndvcmtzcGFjZS1ldm9sZWVuLWRhdGEuZmhpci5henVyZWhlYWx0aGNhcmVhcGlzLmNvbSIsInJlc291cmNlRmhpcklkIjoiNjBlMjdmYTMtZTc0MC00YTU2LWIyMGUtYjZjZDdmM2MzNjliIiwicmVzb3VyY2VWZXJzaW9uSWQiOjJ9LCJldmVudFR5cGUiOiJNaWNyb3NvZnQuSGVhbHRoY2FyZUFwaXMuRmhpclJlc291cmNlRGVsZXRlZCIsImRhdGFWZXJzaW9uIjoiMiIsIm1ldGFkYXRhVmVyc2lvbiI6IjEiLCJldmVudFRpbWUiOiIyMDI0LTAyLTE5VDEzOjA4OjQxLjI3OTgxNjFaIn0=</MessageText>
  </QueueMessage>''';

@GenerateMocks([AzureStorage])
void main() {
  late AzureMessageClient azureMessageClient;
  late FhirMessage fhirMessage;
  late MockAzureStorage mockAzureStorage;

  group('Test Azure message client', () {
    setUpAll(() {
      mockAzureStorage = MockAzureStorage();

      azureMessageClient = AzureMessageClient(
        connectionString: "connect-1",
        queueName: 'test-queue',
        azureStorage: mockAzureStorage,
      );
    });
    test('it can consume messages and parse', () async {
      when(mockAzureStorage.getQmessages(
        qName: "test-queue",
        numOfmessages: 1,
        visibilitytimeout: 30,
      )).thenAnswer((realInvocation) async {
        List<AzureQMessage> list = [];
        list.add(AzureQMessage.fromXML(xmlMessageStr));

        return list;
      });

      List<FhirMessage> list = await azureMessageClient.consumeMessages(messagesCount: 1);
      fhirMessage = list.first;
      expect(fhirMessage.id, "ddd-8438ecb7-06a2-4f04-b8b2-211b6f236003");
      expect(fhirMessage.fhirEvent, isA<FhirEvent>());
      expect(fhirMessage.fhirEvent.body.resourceFhirId, "60e27fa3-e740-4a56-b20e-b6cd7f3c369b");
    });

    test('it can check queue is empty or not', () async {
      when(mockAzureStorage.peekQmessages(
        qName: "test-queue",
        numofmessages: 10,
      )).thenAnswer((realInvocation) async {
        List<AzureQMessage> list = [];
        list.add(AzureQMessage.fromXML(xmlMessageStr));

        return list;
      });

      final bool isNotEmpty = await azureMessageClient.queueIsNotEmpty();
      expect(isNotEmpty, true);

      reset(mockAzureStorage);
      when(mockAzureStorage.peekQmessages(
        qName: "test-queue",
        numofmessages: 10,
      )).thenAnswer((realInvocation) async {
        return List.empty();
      });

      final bool isNotEmpty1 = await azureMessageClient.queueIsNotEmpty();
      expect(isNotEmpty1, false);
    });
  });
}
