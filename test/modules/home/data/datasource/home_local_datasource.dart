import 'package:delivery_app/modules/home/data/datasource/home_local_datasource.dart';
import 'package:delivery_app/modules/home/data/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests for the [HomeLocalDatasource] class.
void main() {
  test('getProducts should return the stored data', () async {
    final datasource = HomeLocalDatasource();
    const testData = [ProductModel(image: '1')];

    datasource.save(testData);

    final result = await datasource.getProducts();

    expect(result, equals(testData));
  });

  test('save should replace existing data with new data', () {
    final datasource = HomeLocalDatasource();
    const initialData = [ProductModel(image: '1')];
    const newData = [ProductModel(image: '2')];

    datasource.save(initialData);
    datasource.save(newData);

    expect(datasource.getProducts(), equals(newData));
  });
}
