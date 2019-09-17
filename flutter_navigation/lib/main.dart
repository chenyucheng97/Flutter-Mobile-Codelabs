import 'package:flutter/material.dart';
import 'package:flutter_navigation/router.dart' as router;
import 'package:flutter_navigation/routing_constants.dart';
import 'package:flutter_navigation/service_locator.dart';
import 'package:flutter_navigation/view/HomeView.dart';

import 'NavigateService.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: router.generateRoute,
      initialRoute: HomeViewRoute,
      navigatorKey: locator<NavigateService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
