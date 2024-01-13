import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/domain/base_usecase.dart';
import '../entity/tracking_detail_route.dart';
import '../tracking_details_repository.dart';

class GetParcelRouteUsecase
    implements BaseUseCase<TrackingDetailRouteEntity, String> {
  const GetParcelRouteUsecase(this._repository);

  final TrackingDetailsRepository _repository;

  @override
  Future<TrackingDetailRouteEntity> call([String? receiptNumber]) async {
    if (receiptNumber == null) {
      throw ArgumentError.notNull('receiptNumber');
    }
    final detail = await _repository.getDetail(receiptNumber);
    return TrackingDetailRouteEntity(
      route: detail.route.map((e) => LatLng(e.first, e.last)).toList(),
    );
  }
}
