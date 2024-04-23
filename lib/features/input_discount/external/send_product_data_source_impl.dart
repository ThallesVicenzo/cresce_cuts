import 'dart:convert';

import 'package:cresce_cuts/core/client/client_http.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:cresce_cuts/core/secure_storage/secure_storage.dart';
import 'package:cresce_cuts/features/input_discount/infra/data_source/send_product_data_source.dart';

class SendProductDataSourceImpl implements SendProductDataSource {
  final ClientHttp clientHttp;
  final SecureStorage storage;

  SendProductDataSourceImpl({
    required this.storage,
    required this.clientHttp,
  });

  @override
  Future<String?> call({
    required String discountTitle,
    required String description,
    required DiscountType discountType,
    required double initialPrice,
    required double finalPrice,
    required DateTime activationDate,
    required DateTime inactivationDate,
    required String image,
  }) async {
    await clientHttp.post('https://fakestoreapi.com/products', data: {
      'title': discountTitle,
      'price': initialPrice,
      'description': description,
      'image': image,
      'category': discountType.name
    });

    final newValue = [
      {
        "title": discountTitle,
        "initialPrice": initialPrice,
        "finalPrice": finalPrice,
        "isActive": true,
        "category": "Discount",
        "description": description,
        "image": image,
        "discount": discountType.name,
        "activationDate": activationDate.toString(),
        "inactivationDate": inactivationDate.toString()
      }
    ];

    final List? initialList = json.decode(
        await storage.read(key: SecureStorageKeys.discounts.key) ?? '[]');

    if (initialList!.isEmpty) {
      late final String newList;

      newList = jsonEncode(newValue);

      await storage.write(
        key: SecureStorageKeys.discounts.key,
        value: newList,
      );

      return newList;
    } else {
      initialList.add(newValue[0]);

      final String newList = jsonEncode(initialList);

      storage.write(
        key: SecureStorageKeys.discounts.key,
        value: newList,
      );

      return newList;
    }
  }
}
