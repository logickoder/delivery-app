import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/domain/base_usecase.dart';
import '../entity/tracking_detail_route.dart';
import '../tracking_details_repository.dart';

/// A use case class for retrieving parcel route information.
class GetParcelRouteUsecase
    implements BaseUseCase<TrackingDetailRouteEntity, String> {
  const GetParcelRouteUsecase(this._repository);

  /// The repository responsible for retrieving tracking details.
  final TrackingDetailsRepository _repository;

  /// Retrieves the parcel route details based on the provided [receiptNumber].
  ///
  /// Throws [ArgumentError] if [receiptNumber] is null.
  /// Returns a [Future] containing the [TrackingDetailRouteEntity].
  @override
  Future<TrackingDetailRouteEntity> call([String? receiptNumber]) async {
    if (receiptNumber == null) {
      throw ArgumentError.notNull('receiptNumber');
    }

    // Fetch tracking details from the repository using the provided receipt number.
    final detail = await _repository.getDetail(receiptNumber);

    return TrackingDetailRouteEntity(
      route: detail.route.map((e) => LatLng(e.first, e.last)).toList(),
    );
  }
}
