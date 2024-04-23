import 'package:cresce_cuts/core/page_state.dart';
import 'package:cresce_cuts/features/home/domain/use_case/products_use_case.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/product_entity.dart';

class HomeController extends ChangeNotifier {
  final ProductsUseCase usecase;

  HomeController({required this.usecase});

  final state = ValueNotifier<PageState<List<ProductEntity>>>(InitialState());

  final switchValue = ValueNotifier<List<bool>>(
    [],
  );

  void populateSwitchValue(List<ProductEntity> products) {
    for (int i = 0; i < products.length; i++) {
      switchValue.value.add(products[i].isActive);
    }
  }

  void tapSwitch(bool value, int index) {
    switchValue.value[index] = value;
    notifyListeners();
  }

  Future<void> callData() async {
    state.value = LoadingState();

    final result = await usecase.call();

    result.either(
      (left) => state.value = ErrorState(error: left),
      (right) {
        populateSwitchValue(right);
        state.value = SuccessState(data: right);
      },
    );
  }
}
