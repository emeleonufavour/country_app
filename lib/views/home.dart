import 'package:country_app/controllers/countrycontroller.dart';
import 'package:country_app/views/cdetails.dart';
import 'package:country_app/views/utilities.dart';
import 'package:country_app/views/widgets/countryTile.dart';
import 'package:country_app/views/widgets/searchedCountries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  CountryController ctr = Get.put(CountryController());
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15).copyWith(bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: Utils.header,
                  ),
                  const Icon(Icons.line_style)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
              ),
              Expanded(
                child: Obx(() {
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
                                    builder: (context) => CountryDetails(
                                        country: ctr.countryList[index])));
                              },
                              child: CountryTile(
                                country: ctr.countryList[index],
                              ),
                            ));
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
