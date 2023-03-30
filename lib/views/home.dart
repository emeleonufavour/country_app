import 'package:country_app/controllers/countrycontroller.dart';
import 'package:country_app/views/utilities.dart';
import 'package:country_app/views/widgets/countryTile.dart';
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: ctr.searchController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search Country',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (ctr.countryList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: ctr.countryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8),
                            child: CountryTile(
                              country: ctr.countryList[index],
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
