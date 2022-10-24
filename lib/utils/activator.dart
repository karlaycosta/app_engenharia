import 'package:flutter/material.dart';

import '../widgets/input_numbers.dart';

class Activator extends ValueNotifier<bool> {
  final List<InputNumbersController> list;
  Activator({this.list = const []}) : super(false) {
    for (var controller in list) {
      controller.addListener(_check);
    }
  }

  void _check() {
    var res = true;
    for (var controller in list) {
      if (!controller.value) {
        res = false;
        break;
      }
    }
    value = res;
  }
}
