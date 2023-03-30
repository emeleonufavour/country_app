import 'package:country_app/controllers/countrycontroller.dart';
import 'package:country_app/views/utilities.dart';
import 'package:country_app/views/widgets/listbody.dart';
import 'package:country_app/views/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
              SearchBar(),
              Expanded(child: CountryList()),
            ],
          ),
        ),
      ),
    );
  }
}
