import 'dart:developer';

import 'package:get/get.dart';

import '../services/remoteService.dart';

class CountryController extends GetxController {
  RxList countryList = [].obs;

  @override
  void onInit() {
    fetchCountries();
    // TODO: implement onInit
    super.onInit();
  }

  void fetchCountries() async {
    try {
      final countries = await RemoteService.fetchCountries();
      if (countries != null) {
        countryList.value = countries;
      } else {
        log('country list is null');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
