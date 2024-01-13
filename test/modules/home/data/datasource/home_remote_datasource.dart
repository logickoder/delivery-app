import 'package:delivery_app/modules/home/data/datasource/home_remote_datasource.dart';
import 'package:delivery_app/modules/home/data/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeRemoteDatasource', () {
    test(
      'getProducts should return a list of ProductModel after a delay',
      () async {
        final datasource = HomeRemoteDatasource();

        // Act
        final result = await datasource.getProducts();

        // Assert
        expect(result, isA<List<ProductModel>>());
        expect(
          result.length,
          equals(6),
        ); // Assuming there are 6 hardcoded URLs.
      },
    );
  });
}
