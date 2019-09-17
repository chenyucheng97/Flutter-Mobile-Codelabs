import 'package:flutter/material.dart';
import 'package:flutter_navigation/routing_constants.dart';
import 'package:flutter_navigation/view/HomeView.dart';
import 'package:flutter_navigation/view/LoginView.dart';
import 'package:flutter_navigation/view/UndefineView.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case LoginViewRoute:
      var loginArgument = settings.arguments;
      return MaterialPageRoute(builder: (context) => LoginView(argument: loginArgument));
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}
