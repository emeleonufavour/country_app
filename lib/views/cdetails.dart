import 'package:country_app/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../controllers/detailscontroller.dart';
import 'utilities.dart';

class CountryDetails extends StatelessWidget {
  final Country country;
  DetailsController ctr = Get.put(DetailsController());
  CountryDetails({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.indigo.withAlpha(50),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo.withAlpha(50),
        title: Text(
          country.name.common,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Obx(() {
                    if (ctr.currentIndex.value == 1) {
                      return Container(
                        width: double.maxFinite,
                        height: size.height * (1 / 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(country.coatOfArms.png ??
                                    'https://mainfacts.com/media/images/coats_of_arms/bb.png'),
                                fit: BoxFit.fill)),
                      );
                    }
                    return Hero(
                      tag: country.flags.png,
                      child: Container(
                        width: double.maxFinite,
                        height: size.height * (1 / 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(country.flags.png),
                                fit: BoxFit.fill)),
                      ),
                    );
                  }),
                  SizedBox(
                    width: double.maxFinite,
                    height: size.height * (1 / 3),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                ctr.previousImage();
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ctr.nextImage();
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              //Population, Region, Capital, motto
              Text(
                'Population: ${country.population} people',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Region: ${country.region.toString().split('.').last}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),

              Text(
                'Sub region: ${country.subregion.toString().split('.').last}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Capital: ${country.capital!.isNotEmpty ? country.capital!.first : 'No capital recorded'}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),

              //.....
              const SizedBox(
                height: 20,
              ),
              //Official language, ethnic group, religion and government
              Text(
                'Languages: ${country.languages.values.toString().replaceAll('(', '').replaceAll(')', '')}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Flag: ${country.flag}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Continent: ${country.continents.toString().split('.').last.replaceAll(']', '')}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Start of week: ${country.startOfWeek.toString().split('.').last}',
                style: Utils.mainText,
              ),
              //.....
              const SizedBox(
                height: 20,
              ),
              //Independence, area, currency, gdp
              Text(
                'Independent: ${country.independent.toString()}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Area: ${country.area}',
                style: Utils.mainText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Currency: ${country.currencies}',
                style: Utils.mainText,
              ),

              //.....
              const SizedBox(
                height: 20,
              ),
              //Time zone, date format, dialing code and driving side
              Text(
                'Time zone: ${country.timezones.toString().replaceAll('[', '').replaceAll(']', '')}',
                style: Utils.mainText,
              ),

              SizedBox(
                height: 5,
              ),
              Text(
                'Driving side: ${country.car.side.toString().split('.').last}',
                style: Utils.mainText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
