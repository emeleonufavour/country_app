import 'package:country_app/controllers/countrycontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../cdetails.dart';
import 'countryTile.dart';

class SearchedCountries extends StatelessWidget {
  CountryController ctr = Get.find();
  SearchedCountries({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Expanded(
              child: ListView.builder(
                  itemCount: ctr.searchList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CountryDetails(
                                    country: ctr.searchList[index])));
                          },
                          child: CountryTile(
                            country: ctr.searchList[index],
                          ),
                        ));
                  }));
        }),
        GestureDetector(
          onTap: () {
            return ctr.showAllCountries();
          },
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Show all countries',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
