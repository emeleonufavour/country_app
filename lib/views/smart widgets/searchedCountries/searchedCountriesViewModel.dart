import 'package:country_app/app/appSetup.locator.dart';
import 'package:country_app/services/countryService.dart';
import 'package:stacked/stacked.dart';

class SearchCountriesViewModel extends ReactiveViewModel {
  final _countryService = locator<CountryService>();
  List get searchList => _countryService.searchList;

  void showAllCountries() {
    _countryService.showAllCountries();
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_countryService];
}
