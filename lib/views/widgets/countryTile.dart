import 'package:country_app/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities.dart';

class CountryTile extends StatelessWidget {
  final Country country;
  const CountryTile({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: double.maxFinite,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 200,
                  child: Text(
                    country.name.official,
                    style: Utils.countryText,
                  ),
                ),
                Text(
                  country.capital!.isNotEmpty
                      ? country.capital!.first
                      : 'No capital',
                  style: Utils.capitalText,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
