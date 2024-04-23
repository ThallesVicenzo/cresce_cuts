import 'package:cresce_cuts/features/home/infra/models/product_model.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('product model ...', () {
    final newValue = {
      "title": faker.food.dish(),
      "initialPrice": faker.randomGenerator.decimal(),
      "finalPrice": faker.randomGenerator.decimal(),
      "isActive": false,
      "price": faker.randomGenerator.decimal(),
      "category": faker.randomGenerator.string(1),
      "description": faker.randomGenerator.string(1),
      "image": faker.randomGenerator.string(1),
      "discount": faker.randomGenerator.string(1),
      "activationDate": faker.date.dateTime().toString(),
      "inactivationDate": faker.date.dateTime().toString(),
    };

    final parseModel = ProductModel.fromJson(newValue);

    expect(parseModel, isA<ProductModel>());
  });
}
