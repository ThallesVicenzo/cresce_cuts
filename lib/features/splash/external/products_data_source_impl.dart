import 'dart:convert';

import 'package:cresce_cuts/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:cresce_cuts/core/secure_storage/secure_storage.dart';
import 'package:cresce_cuts/features/splash/domain/entities/product_entity.dart';
import 'package:cresce_cuts/features/splash/infra/models/product_model.dart';

import '../infra/data_source/products_data_source.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final SecureStorage storage;

  ProductsDataSourceImpl({required this.storage});

  @override
  Future<List<ProductEntity>> call() async {
    final response = jsonDecode(
        await storage.read(key: SecureStorageKeys.discounts.name) ?? '[]');

    final productsList = response as List;

    return productsList.map((e) => ProductModel.fromJson(e)).toList();
  }
}
