import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/remoteService.dart';

class CountryController extends GetxController {
  TextEditingController searchController = TextEditingController();
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
        countries.sort((a, b) => a.name.official.compareTo(b.name.official));
        countries.forEach((element) {
          if (element.capital!.isNotEmpty) {
            print(element.capital!.first);
          }
        });

        countryList.value = countries;
      } else {
        log('country list is null');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
