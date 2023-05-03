import 'package:country_app/services/countryService.dart';
import 'package:stacked/stacked.dart';

import '../../app/appSetup.locator.dart';

class CountryDetailsViewModel extends ReactiveViewModel {
  final _countryService = locator<CountryService>();
  get currentIndex => _countryService.currentIndex;

  void previousImage() {
    _countryService.previousImage();
  }

  void nextImage() {
    _countryService.nextImage();
  }
}
