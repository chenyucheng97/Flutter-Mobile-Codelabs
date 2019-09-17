import 'package:flutter/material.dart';

class NavigateService {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'navigate_key');

  NavigatorState get navigator => navigatorKey.currentState;

  get pushNamed => navigator.pushNamed;

/*  Future<dynamic> navigateTo<T extends Object>(String routeName, {T arguments}) {
    return navigatorKey.currentState.pushNamed<Object>(routeName, arguments: arguments);
  }*/

  get push => navigator.push;

  get goBack => navigator.pop();
}
