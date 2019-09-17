import 'package:flutter/material.dart';
import 'package:flutter_navigation/routing_constants.dart';

import '../NavigateService.dart';
import '../service_locator.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

//          var result = await Navigator.pushNamed(context, LoginViewRoute);
        //使用service locator来获取Navigator的NavigatorState，然后
          var result = await locator<NavigateService>().pushNamed(LoginViewRoute,arguments:"Flutter");



// If the result matches show a dialog
          if (result == 'fromLogin') {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('From Login'),
                ));
          }

         /* Navigator.pushNamed(
              context, LoginViewRoute, arguments: "Data passed in");*/
        },
        child: Icon(Icons.router),
      ),
    );
  }
}