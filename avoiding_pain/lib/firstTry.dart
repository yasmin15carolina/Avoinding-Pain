import 'package:flutter/material.dart';

class PainPage extends StatefulWidget {
  // String activity = "Levantar objetos";
  // String imgPath = "assets/LevantarObjetos.png";
 
  // PainPage({
  //   this.activity,
  //   this.imgPath
  // });

  @override
  _PainPageState createState() => _PainPageState();
}

class _PainPageState extends State<PainPage> {
  int index =0;
  double rating =0;
  List<String> activityList = ["Levantar objetos","Carregar nas mãos","Carregar nos braços"];
  List<String> imgList = ["assets/LevantarObjetos.png","assets/CarregarNasMaos.png","assets/CarregarNosBracos.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              activityList[index],
              style: TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(imgList[index],height: 200,)
          ),
           Padding(
            padding: EdgeInsets.all(10),
            child: Slider(
              value: rating, 
              onChanged: (newRating){
                setState(() => rating = newRating);
              },
              min:0.0,
              max: 10.0,
              divisions: 10,
              label: "$rating",
            )
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: Text("Continuar"),
              onPressed: (){
                setState(() {
                  if(index<activityList.length-1){
                    rating=0;
                    index ++;
                  }
                });
               
              }
            ),
          )
        ]
      )
    );
  }
}