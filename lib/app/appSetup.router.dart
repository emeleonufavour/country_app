// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:country_app/models/country.dart' as _i5;
import 'package:country_app/views/cdetails.dart' as _i3;
import 'package:country_app/views/home/home.dart' as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const myHomePage = '/';

  static const countryDetails = '/country-details';

  static const all = <String>{
    myHomePage,
    countryDetails,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.myHomePage,
      page: _i2.MyHomePage,
    ),
    _i1.RouteDef(
      Routes.countryDetails,
      page: _i3.CountryDetails,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.MyHomePage: (data) {
      final args = data.getArgs<MyHomePageArguments>(
        orElse: () => const MyHomePageArguments(),
      );
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.MyHomePage(key: args.key),
        settings: data,
      );
    },
    _i3.CountryDetails: (data) {
      final args = data.getArgs<CountryDetailsArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.CountryDetails(country: args.country, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MyHomePageArguments {
  const MyHomePageArguments({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MyHomePageArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CountryDetailsArguments {
  const CountryDetailsArguments({
    required this.country,
    this.key,
  });

  final _i5.Country country;

  final _i4.Key? key;

  @override
  String toString() {
    return '{"country": "$country", "key": "$key"}';
  }

  @override
  bool operator ==(covariant CountryDetailsArguments other) {
    if (identical(this, other)) return true;
    return other.country == country && other.key == key;
  }

  @override
  int get hashCode {
    return country.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToMyHomePage({
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.myHomePage,
        arguments: MyHomePageArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCountryDetails({
    required _i5.Country country,
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.countryDetails,
        arguments: CountryDetailsArguments(country: country, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyHomePage({
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.myHomePage,
        arguments: MyHomePageArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCountryDetails({
    required _i5.Country country,
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.countryDetails,
        arguments: CountryDetailsArguments(country: country, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
