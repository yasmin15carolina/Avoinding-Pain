import 'package:avoiding_pain/pages/SliderExample.dart';
import 'package:avoiding_pain/painIntensity.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Instrução",
              style: TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "O modelo medo e evitação da dor foi identificado como um importante fenômeno para detectar risco de cronificação em pacientes com dor persistente musculoesquelética.\n\n"+

              "Essa avaliação pode ajudar no planejamento do seu tratamento.\n\n"

              "Desse modo, responda a seguinte pergunta para cada atividade que será apresentada:\n"+

              " • O quanto você evitaria essa atividade mostrada na figura devido a sua dor no ombro, se tivesse que realizá-la agora?\n\n"

              "As respostas variam de 0 a 10, sendo 0 não evitaria e realizaria a atividade sem hesitação e 10 evitaria ao máximo e não realizaria a atividade devido ao problema no ombro.\n",

              style: TextStyle(
                fontSize:15,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: Text("Continuar"),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => SliderExample(),// PainPage(),
                  ),
                );
              }
            ),
          )
        ]
      )
    );
  }
}