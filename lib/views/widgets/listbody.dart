import 'package:country_app/controllers/countrycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cdetails.dart';
import 'countryTile.dart';
import 'searchedCountries.dart';

class CountryList extends StatelessWidget {
  CountryController ctr = Get.find();
  CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctr.countryList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      if (ctr.searched.value) {
        return SearchedCountries();
      }
      return ListView.builder(
          itemCount: ctr.countryList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CountryDetails(country: ctr.countryList[index])));
                  },
                  child: CountryTile(
                    country: ctr.countryList[index],
                  ),
                ));
          });
    });
  }
}
