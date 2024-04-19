import 'package:cresce_cuts/core/client/client_http.dart';
import 'package:cresce_cuts/core/client/dio/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ClientHttp>(DioClient.new);
  }
}
