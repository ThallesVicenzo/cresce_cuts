import 'package:cresce_cuts/core/page_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/product_entity.dart';

class HomeController extends ChangeNotifier {
  final state = ValueNotifier<PageState>(InitialState());

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
}
