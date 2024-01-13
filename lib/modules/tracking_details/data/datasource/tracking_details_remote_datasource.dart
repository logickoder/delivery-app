import 'dart:math';

import '../tracking_detail_model.dart';
import 'tracking_details_datasource.dart';

/// A datasource for tracking details that simulates a remote API
class TrackingDetailsRemoteDatasource implements TrackingDetailsDatasource {
  @override
  Future<TrackingDetailModel> getDetail(String receiptNumber) async {
    await Future.delayed(const Duration(seconds: 2));
    final random = Random();

    return TrackingDetailModel(
      receiptNumber: receiptNumber,
      status: random.nextBool() ? 'In delivery' : 'In the process',
      senderLocation: 'Sukabumi, Indonesia',
      receiverLocation: 'Bali, Indonesia',
      transitLocation: 'Jakarta, Indonesia',
      postalFee: random.nextInt(1000),
      weight: random.nextInt(100),
      arrivalTime: DateTime.now().add(
        Duration(hours: random.nextInt(24), minutes: random.nextInt(60)),
      ),
      route: [
        [6.510278, 3.386493],
        [6.511021, 3.388323],
        [6.510342, 3.388682],
        [6.510346582229474, 3.388677216748317],
        [6.510446775377155, 3.3889403935637574],
        [6.510270826421616, 3.389174055222327],
        [6.5098211788106894, 3.3894273936521437],
        [6.509755197872993, 3.3896315401824237],
        [6.50985294739993, 3.3901087019183],
        [6.509987352969487, 3.3904382878367025],
        [6.510085102452022, 3.3906006211994977],
      ],
    );
  }
}
