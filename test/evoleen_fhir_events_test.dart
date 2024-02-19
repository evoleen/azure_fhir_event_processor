import 'package:evoleen_fhir_events/evoleen_fhir_events.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'mockes/mock_azure_storage.dart';

void main() {
  late AzureMessageClient azureMessageClient;
  late FhirMessage fhirMessage;
  late MockAzureStorage mockAzureStorage;

  group('Test message client', () {
    setUp(() {
      mockAzureStorage = MockAzureStorage();
      azureMessageClient = AzureMessageClient(
        connectionString: "aa",
        queueName: "ddd",
        azureStorage: mockAzureStorage,
      );
    });

    test('it can consume messages', () async {
      List<FhirMessage> list = await azureMessageClient.consumeMessages(messagesCount: 1);
      fhirMessage = list.first;
      expect(fhirMessage.id, "ddd-8438ecb7-06a2-4f04-b8b2-211b6f236003");
    });

    test('it can check queue is not empy', () async {
      final bool isNotEmpty = await azureMessageClient.queueIsNotEmpty();

      expect(isNotEmpty, true);
    });
  });
}
