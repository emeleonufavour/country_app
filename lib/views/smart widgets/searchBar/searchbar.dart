import 'package:country_app/views/smart%20widgets/searchBar/searchBarViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../utilities.dart';

class SearchBar extends StatelessWidget {
  //CountryController ctr = Get.find();
  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchBarViewModel>.reactive(
        viewModelBuilder: () => SearchBarViewModel(),
        builder: (context, model, _) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.grey[700]!.withBlue(150),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              style: TextStyle(color: Utils.textColor),
              controller: model.searchController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Utils.textColor,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search Country',
                  hintStyle: TextStyle(color: Utils.textColor)),
              onSubmitted: (value) {
                return model.onSearch(query: value);
              },
            ),
          );
        });
  }
}
