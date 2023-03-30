import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/remoteService.dart';

class CountryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList countryList = [].obs;
  RxList searchList = [].obs;
  RxBool searched = false.obs;

  @override
  void onInit() {
    fetchCountries();
    searched.value = false;
    // TODO: implement onInit
    super.onInit();
  }

  void fetchCountries() async {
    try {
      final countries = await RemoteService.fetchCountries();

      if (countries != null) {
        countries.sort((a, b) => a.name.common.compareTo(b.name.common));

        countryList.value = countries;
      } else {
        log('country list is null');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void onSearch({required String query}) {
    searchList.value = countryList
        .where((country) => country.name.common.contains(query))
        .toList();
    searched.value = true;
    searchController.clear();
  }

  void showAllCountries() {
    searched.value = false;
    searchController.clear();
  }
}
