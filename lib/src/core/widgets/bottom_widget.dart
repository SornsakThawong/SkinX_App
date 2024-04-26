import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomWidget {
  static final instance = BottomWidget();

  show(Widget child) async {
    return await Get.bottomSheet(
      child,
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade900,
    );
  }
}
