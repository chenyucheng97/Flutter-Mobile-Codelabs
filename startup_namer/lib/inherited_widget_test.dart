import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to InheritedWidget',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
        primaryColor: Colors.white,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyWidget> {
  int tmpData = 0;

  @override
  Widget build(BuildContext context) {
    print('MyWidget build');
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to InheritedWidget')),

//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      body: MyInherited(
        data: tmpData,
        child: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              WidgetA(),
              WidgetB(),
              FlatButton(
                child: Text("Click me"),
                onPressed: () {
                  setState(() {
                    print('onPressed');
                    tmpData += 1;
                  });
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class MyInherited extends InheritedWidget {
  final int data;

  MyInherited({this.data, Widget child}) : super(child: child) {
    print('MyInherited construct');
  }

  @override
  bool updateShouldNotify(MyInherited oldWidget) {
    bool result = oldWidget.data != this.data;
    print('MyInherited updateShouldNotify result = $result');
    return result;
  }

  static MyInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyInherited);
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetA build');
    int data = MyInherited.of(context).data;
    return Text('WidgetA data = $data');
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetB build');
    return Text('WidgetB');
  }
}
