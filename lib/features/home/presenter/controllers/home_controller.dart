import 'package:cresce_cuts/core/page_state.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final state = ValueNotifier<PageState>(InitialState());

  final switchValue = ValueNotifier<bool>(true);

  void tapSwitch(bool value) {
    switchValue.value = value;
  }
}
