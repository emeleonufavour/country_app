import 'package:country_app/services/countryService.dart';
import 'package:country_app/views/cdetails.dart';
import 'package:country_app/views/home/home.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: MyHomePage, initial: true),
  MaterialRoute(page: CountryDetails)
], dependencies: [
  LazySingleton(classType: CountryService),
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
