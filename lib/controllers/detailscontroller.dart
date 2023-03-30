import 'dart:developer';

import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxInt currentIndex = 0.obs;

  void nextImage() {
    if (currentIndex < 1) {
      currentIndex.value = currentIndex.value + 1;
      log(currentIndex.toString());
    }
  }

  void previousImage() {
    if (currentIndex > 0) {
      currentIndex.value = currentIndex.value - 1;
      log(currentIndex.toString());
    }
  }
}
