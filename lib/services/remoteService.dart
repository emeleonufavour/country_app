import 'dart:developer';

import 'package:country_app/models/country.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<List<Country>?> fetchCountries() async {
    try {
      final response =
          await client.get(Uri.parse('https://restcountries.com/v3.1/all'));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final jsonString = response.body;

        return countryFromJson(jsonString);
      }
    } catch (e) {
      log('Error ' + e.toString());
      return null;
    }
  }
}
