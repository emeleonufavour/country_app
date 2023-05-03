import 'dart:developer';

import 'package:country_app/app/appSetup.locator.dart';
import 'package:country_app/services/countryService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/appSetup.router.dart';
import '../../../models/country.dart';

class CountryListViewModel extends ReactiveViewModel {
  final _countryService = locator<CountryService>();
  final _navigationService = locator<NavigationService>();

  List get countryList => _countryService.countryList;
  get searched => _countryService.searched;

  initialize() async {
    await _countryService.initialize();
    log(countryList.isEmpty.toString());
  }

  void navigateToCountryDetails(Country country) {
    _navigationService.navigateTo(Routes.countryDetails,
        arguments: CountryDetailsArguments(country: country));
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_countryService];
}
