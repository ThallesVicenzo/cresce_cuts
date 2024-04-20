import 'package:cresce_cuts/core/main_routes.dart';
import 'package:cresce_cuts/core/page_state.dart';
import 'package:cresce_cuts/features/splash/domain/entities/product_entity.dart';
import 'package:cresce_cuts/features/splash/domain/use_case/products_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController extends ChangeNotifier {
  final ProductsUseCase useCase;

  SplashController({required this.useCase});

  final state = ValueNotifier<PageState<List<ProductEntity>>>(InitialState());

  final opacity = ValueNotifier<double>(1);

  void onAnimationEd(double value) {
    if (value == 0) {
      Modular.to.navigate(
        MainRoutes.home.route,
        arguments: state.value.asSuccess,
      );
    }
  }

  Future<void> getProducts() async {
    state.value = LoadingState();
    final result = await useCase.call();
    result.either(
      (left) => state.value = ErrorState(error: left),
      (right) {
        state.value = SuccessState(data: right);
        opacity.value = 0;
      },
    );
  }
}
