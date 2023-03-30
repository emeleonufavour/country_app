import 'package:country_app/controllers/countrycontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  CountryController ctr = Get.find();
  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.grey[700]!.withBlue(150),
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: ctr.searchController,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: InputBorder.none,
            hintText: 'Search Country',
            hintStyle: TextStyle(color: Colors.white)),
        onSubmitted: (value) {
          return ctr.onSearch(query: value);
        },
      ),
    );
  }
}
