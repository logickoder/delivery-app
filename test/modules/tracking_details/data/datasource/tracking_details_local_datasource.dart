import 'package:delivery_app/modules/tracking_details/data/datasource/tracking_details_local_datasource.dart';
import 'package:delivery_app/modules/tracking_details/data/tracking_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TrackingDetailsLocalDatasource', () {
    final datasource = TrackingDetailsLocalDatasource();
    final mockDetail = TrackingDetailModel(
      receiptNumber: '123',
      status: 'In delivery',
      postalFee: 1,
      weight: 1,
      arrivalTime: DateTime.now(),
      receiverLocation: 'Location',
      senderLocation: 'Location',
      transitLocation: 'Location',
      route: [],
    );

    test('getDetail returns null for non-existent receipt number', () async {
      final result = await datasource.getDetail('456');
      expect(result, isNull);
    });

    test('getDetail returns correct tracking detail', () async {
      datasource.addDetail(mockDetail);
      final result = await datasource.getDetail('123');
      expect(result, equals(mockDetail));
    });

    test('addDetail stores tracking detail correctly', () {
      datasource.addDetail(mockDetail);
      expect(datasource.getDetail('123'), equals(mockDetail));
    });
  });
}
