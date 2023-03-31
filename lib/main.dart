import 'package:country_app/views/cdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/home.dart';
import 'views/utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
        scaffoldBackgroundColor: Utils.backgroundColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Utils.whiteSwatch)
            .copyWith(secondary: Colors.white),
      ),
      home: MyHomePage(),
    );
  }
}
