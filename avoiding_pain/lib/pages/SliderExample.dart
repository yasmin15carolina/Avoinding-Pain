import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

import '../painIntensity.dart';

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        // margin: EdgeInsets.symmetric(
        //   vertical: (MediaQuery.of(context).size.height-250)/2,
        // ),
        alignment: Alignment.center,
        height: 250,
        // color: Colors.amber,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "O quanto você evitaria essa atividade mostrada na figura devido a sua dor no ombro, se tivesse que realizá-la agora?",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Sem evitação"),
                    Text("Máxima evitação"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
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
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                    child: Text("Continuar"),
                    onPressed: () {
                      print(MediaQuery.of(context).size.height);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PainPage(),
                          ));
                    }),
              ),
            ]),
      ),
    ));
  }
}
