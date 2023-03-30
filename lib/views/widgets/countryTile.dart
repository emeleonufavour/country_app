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
      child: SizedBox(
        height: 100,
        width: double.maxFinite,
        child: Row(
          children: [
            Hero(
              tag: country.flags.png,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                          country.flags.png,
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Hero(
                    tag: country.name.common,
                    child: Text(
                      country.name.common,
                      style: Utils.countryText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  country.capital!.isNotEmpty
                      ? country.capital!.first
                      : 'No capital recorded',
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
