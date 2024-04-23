import 'dart:convert';

import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:cresce_cuts/core/secure_storage/secure_storage.dart';
import 'package:cresce_cuts/features/input_discount/infra/data_source/send_product_data_source.dart';

class EditProductDataSourceImpl implements EditProductDataSource {
  final SecureStorage storage;

  EditProductDataSourceImpl({
    required this.storage,
  });

  @override
  Future<String?> call({
    required String discountTitle,
    required String description,
    required DiscountType discountType,
    required double initialPrice,
    required double finalPrice,
    required double? price,
    required DateTime activationDate,
    required DateTime inactivationDate,
    required String image,
    required int index,
  }) async {
    final newValue = {
      "title": discountTitle,
      "initialPrice": initialPrice,
      "finalPrice": finalPrice,
      "isActive": DateTime.now().compareTo(inactivationDate) < 0 &&
          DateTime.now().compareTo(activationDate) > 0,
      "price": price,
      "category": "Discount",
      "description": description,
      "image": image,
      "discount": discountType.name,
      "activationDate": activationDate.toString(),
      "inactivationDate": inactivationDate.toString()
    };

    List productsList = json.decode(
        await storage.read(key: SecureStorageKeys.discounts.key) ?? '[]');

    productsList[index] = newValue;

    final result = jsonEncode(productsList);

    await storage.write(key: SecureStorageKeys.discounts.key, value: result);

    return result;
  }
}
