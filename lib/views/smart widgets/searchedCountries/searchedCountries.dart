import 'package:country_app/views/smart%20widgets/searchedCountries/searchedCountriesViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../cdetails.dart';
import '../countryTile.dart';

class SearchedCountries extends StatelessWidget {
  //CountryController ctr = Get.find();
  SearchedCountries({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchCountriesViewModel>.reactive(
        viewModelBuilder: () => SearchCountriesViewModel(),
        builder: (context, model, _) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: model.searchList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CountryDetails(
                                        country: model.searchList[index])));
                              },
                              child: CountryTile(
                                country: model.searchList[index],
                              ),
                            ));
                      })),
              GestureDetector(
                onTap: () {
                  return model.showAllCountries();
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
        });
  }
}
