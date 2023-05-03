import 'package:country_app/app/appSetup.locator.dart';
import 'package:country_app/views/cdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/appSetup.router.dart';
import 'views/home/home.dart';
import 'views/utilities.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

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
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      //home: MyHomePage(),
    );
  }
}
