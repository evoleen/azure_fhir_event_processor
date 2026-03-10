import 'package:freezed_annotation/freezed_annotation.dart';

part 'ahds_event_data.freezed.dart';
part 'ahds_event_data.g.dart';

/// Payload shape of the "data" field in AHDS (Azure Health Data Services)
/// Event Grid CloudEvents. Used when the queue receives messages from
/// Azure Healthcare APIs via Event Grid → Azure Storage Queue.
@freezed
abstract class AhdsEventData with _$AhdsEventData {
  const factory AhdsEventData({
    required String resourceFhirId,
    required String resourceType,
    required String resourceFhirAccount,
    required int resourceVersionId,
  }) = _AhdsEventData;

  factory AhdsEventData.fromJson(Map<String, Object?> json) =>
      _$AhdsEventDataFromJson(json);
}
