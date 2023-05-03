import 'dart:developer';

import 'package:country_app/models/country.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/value/value.dart';

import 'remoteService.dart';

class CountryService with ListenableServiceMixin {
  TextEditingController searchController = TextEditingController();
  final _countryList = RxValue<List<Country>>([]);
  final _searchList = RxValue<List<Country>>([]);
  final _searched = RxValue<bool>(false);
  final _currentIndex = RxValue<int>(0);

  get countryList => _countryList.value;
  get searchList => _searchList.value;
  get searched => _searched.value;
  get currentIndex => _currentIndex.value;

  CountryService() {
    listenToReactiveValues([
      _countryList,
      _searchList,
      _searched,
      _currentIndex,
      searchController
    ]);
  }

  Future<void> initialize() async {
    await fetchCountries();
    _searched.value = false;
    notifyListeners();
  }

  Future<void> fetchCountries() async {
    try {
      final countries = await RemoteService.fetchCountries();

      if (countries != null) {
        countries.sort((a, b) => a.name.common.compareTo(b.name.common));

        _countryList.value = countries;
        notifyListeners();
      } else {
        log('country list is null');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void onSearch({required String query}) {
    _searchList.value = _countryList.value
        .where((country) => country.name.common.contains(query))
        .toList();
    _searched.value = true;
    searchController.clear();
    notifyListeners();
  }

  void showAllCountries() {
    _searched.value = false;
    searchController.clear();
    notifyListeners();
  }

  void nextImage() {
    if (_currentIndex.value < 1) {
      _currentIndex.value = _currentIndex.value + 1;
      notifyListeners();
      log(_currentIndex.toString());
    }
  }

  void previousImage() {
    if (_currentIndex.value > 0) {
      _currentIndex.value = _currentIndex.value - 1;
      notifyListeners();
      log(_currentIndex.toString());
    }
  }
}
