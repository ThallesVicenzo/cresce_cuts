import 'package:cresce_cuts/core/client/client_http.dart';
import 'package:cresce_cuts/features/splash/domain/entities/product_entity.dart';
import 'package:cresce_cuts/features/splash/infra/models/product_model.dart';

import '../infra/data_source/products_data_source.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final ClientHttp clientHttp;

  ProductsDataSourceImpl({required this.clientHttp});

  @override
  Future<List<ProductEntity>> call() async {
    final reponse = await clientHttp.get('https://fakestoreapi.com/products');

    final productsList = reponse.data as List;

    return productsList.map((e) => ProductModel.fromJson(e)).toList();
  }
}
