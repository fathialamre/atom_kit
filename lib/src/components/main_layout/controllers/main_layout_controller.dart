import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayoutController extends GetxController {
  static MainLayoutController get to => Get.find();

  final currentIndex = 0.obs;

  final pages = <Widget>[];

  Widget get currentPage => pages[currentIndex()];

  changePage(int index) {
    currentIndex.value = index;
  }
}
