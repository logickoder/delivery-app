import '../../../../core/domain/base_usecase.dart';
import '../entity/tracking_detail.dart';
import '../tracking_details_repository.dart';

/// A use case for retrieving tracking details based on a receipt number.
///
class GetTrackingDetailUsecase
    implements BaseUseCase<TrackingDetailEntity, String> {
  const GetTrackingDetailUsecase(this._repository);

  final TrackingDetailsRepository _repository;

  /// Retrieves tracking details for the given [receiptNumber].
  ///
  /// Throws [ArgumentError] if [receiptNumber] is null.
  ///
  /// Returns a [Future] that completes with a [TrackingDetailEntity] containing
  /// details such as receipt number, status, postal fee, weight, arrival time,
  /// sender location, receiver location, and transit location.
  @override
  Future<TrackingDetailEntity> call([String? receiptNumber]) async {
    if (receiptNumber == null) {
      throw ArgumentError.notNull('receiptNumber');
    }

    final detail = await _repository.getDetail(receiptNumber);
    return TrackingDetailEntity(
      receiptNumber: detail.receiptNumber,
      status: detail.status,
      postalFee: detail.postalFee,
      weight: detail.weight,
      arrivalTime: detail.arrivalTime,
      senderLocation: detail.senderLocation,
      receiverLocation: detail.receiverLocation,
      transitLocation: detail.transitLocation,
    );
  }
}
