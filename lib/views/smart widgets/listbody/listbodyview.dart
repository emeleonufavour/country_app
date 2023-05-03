import 'package:country_app/views/smart%20widgets/listbody/listbodyViewModel.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import '../countryTile.dart';
import '../searchedCountries/searchedCountries.dart';

class CountryList extends StatelessWidget {
  CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CountryListViewModel>.reactive(
        viewModelBuilder: () => CountryListViewModel(),
        onViewModelReady: (viewModel) => viewModel.initialize(),
        builder: ((context, viewModel, child) {
          if (viewModel.countryList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.searched) {
            return SearchedCountries();
          }
          return ListView.builder(
              itemCount: viewModel.countryList.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () => viewModel.navigateToCountryDetails(
                          viewModel.countryList[index]),
                      child: CountryTile(
                        country: viewModel.countryList[index],
                      ),
                    ));
              });
        }));
  }
}
