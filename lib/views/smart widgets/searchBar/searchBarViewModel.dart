import 'package:country_app/services/countryService.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:stacked/stacked.dart';

import '../../../app/appSetup.locator.dart';

class SearchBarViewModel extends ReactiveViewModel {
  final _countryService = locator<CountryService>();
  get searchController => _countryService.searchController;

  void onSearch({required String query}) {
    _countryService.onSearch(query: query);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_countryService];
}
