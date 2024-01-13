import '../../../core/domain/base_usecase.dart';
import 'tracking_details_entity.dart';
import 'tracking_details_repository.dart';

class GetProductPositions
    implements BaseUseCase<TrackingDetailsEntity, String> {
  const GetProductPositions(this._repository);

  final TrackingDetailsRepository _repository;

  @override
  Future<TrackingDetailsEntity> call([String? receiptNumber]) {
    if (receiptNumber == null) {
      throw ArgumentError.notNull('receiptNumber');
    }
    return _repository.getDetail(receiptNumber);
  }
}
