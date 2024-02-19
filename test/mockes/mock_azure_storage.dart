import 'package:azstore/azstore.dart';
import 'package:mockito/mockito.dart';

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

class MockAzureStorage extends Fake implements AzureStorage {
  @override
  Future<List<AzureQMessage>> getQmessages({
    required String qName,
    int numOfmessages = 20,
    int? visibilitytimeout,
    int? timeout,
  }) {
    List<AzureQMessage> list = [];
    list.add(AzureQMessage.fromXML(xmlMessageStr));

    return Future.value(list);
  }

  @override
  Future<void> delQmessage({
    required String qName,
    required String messageId,
    required String popReceipt,
  }) async {}

  @override
  Future<List<AzureQMessage>> peekQmessages({
    required String qName,
    int numofmessages = 1,
  }) {
    List<AzureQMessage> list = [];
    list.add(AzureQMessage.fromXML(xmlMessageStr));

    return Future.value(list);
  }
}
