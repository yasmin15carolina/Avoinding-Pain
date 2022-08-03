import 'package:avoiding_pain/pages/homepage.dart';
import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

void main() {
  runApp(App());
}

mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}

/// Forces portrait-only mode on a specific screen
/// Use this Mixin in the specific screen you want to
/// block to portrait only mode.
///
/// Call `super.build(context)` in the State's build() method
/// and `super.dispose();` in the State's dispose() method
mixin PortraitStatefulModeMixin<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }

  @override
  void dispose() {
    _enableRotation();
  }
}

/// blocks rotation; sets orientation to: portrait
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class App extends StatelessWidget {
  const App();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Slider(
        value: rating,
        onChanged: (newRating) {
          setState(() => rating = newRating);
        },
        min: 0,
        max: 123,
        divisions: 123,
        label: "$rating",
      ),
    ));
  }
}
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blueGrey,
//         body: Center(
//           child: Container(
//             child: SingleCircularSlider(
//             100, 0,shouldCountLaps: true,showHandlerOutter: true,)
//           ),
//         ));
//   }
// }