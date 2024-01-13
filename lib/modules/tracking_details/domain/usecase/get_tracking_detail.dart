import '../../../../core/domain/base_usecase.dart';
import '../entity/tracking_detail.dart';
import '../tracking_details_repository.dart';

class GetTrackingDetailUsecase
    implements BaseUseCase<TrackingDetailEntity, String> {
  const GetTrackingDetailUsecase(this._repository);

  final TrackingDetailsRepository _repository;

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
