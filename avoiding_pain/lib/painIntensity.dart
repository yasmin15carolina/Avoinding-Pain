import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  CarouselController _carouselController =CarouselController();
  CarouselSlider _carouselSlider;
  Color _color = Colors.white;

  int _current =0;
  double rating =0;
  List<String> activityList = ['Levantar objetos','Carregar nas mãos','Carregar nos braços','Carregar nos ombros, quadris e costas','Empurrar','Alcançar','Jogar','Dirigir transporte com tração humana','Lavar partes do corpo','Lavar todo o corpo','Secar-se','Cuidar dos dentes','Cuidar do cabelo e da barba','Vestir se','Despir-se','Comer','Beber','Lavar e secar roupa','Limpar a habitação'];
  List imgList = ['assets/LevantarObjetos.png','assets/CarregarNasMaos.png','assets/CarregarNosBracos.png','assets/CarregarNosOmbros.png','assets/Empurrar.png','assets/Alcancar.png','assets/Jogar.png','assets/DirigirComTracao.png','assets/LavarPartesDoCorpo.png','assets/LavarTodoOCorpo.png','assets/Secarse.png','assets/CuidarDosDentes.png','assets/CuidarDoCabelo.png','assets/Vestirse.png','assets/Despirse.png','assets/Comer.png','assets/Beber.png','assets/LavarESecarRoupas.png','assets/LimparAHabitacao.png'];
  List<double> painIndicatorList =[0,0,0,0,   0,0,0,0,  0,0,0,0, 0,0,0,0,  0,0,0,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             _carouselSlider = CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: MediaQuery.of(context).size.height/2,
                  //height: 400.0,
                  initialPage: 0,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  reverse: false,
                  enableInfiniteScroll: false,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  //pauseAutoPlayOnTouch: Duration(seconds: 10),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index,carouselPageChangedReason) {
                    setState(() {
                      _current = index;
                      rating=painIndicatorList[_current];
                      });
                  },
                ),
                    
                items: imgList.map((imgPath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: _color,
                            ),
                            child: Stack(
                              //alignment: Alignment.center,
                              children:
                              [
                                Center(
                                  child: Image.asset(
                                    imgPath,
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-20),
                                  alignment: Alignment.bottomRight,
                                  color: Colors.white,
                                  height: 20,
                                  child://Padding(
                                      
                                      //child:
                                       Text(
                                        activityList[_current],                                    
                                        style: TextStyle(
                                          fontSize:15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                   // ),
                                )
                                
                              ]
                            ),
                            
                          );
                        },
                      );
                    }).toList(),
                  ),
                  
                 Padding(
                  padding: EdgeInsets.all(10),
                  child: Slider(
                    value: rating, 
                    onChanged: (newRating){
                      //setState(() => rating = newRating);
                      setState(() {
                        rating = newRating;
                        painIndicatorList[_current]=rating;
                      });
                      
                    },
                    min:0.0,
                    max: 10.0,
                    divisions: 10,
                    label: "$rating",
                  )
                ),
                 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((imgPath) {
                    print("img= "+imgList.length.toString()+" act: "+activityList.length.toString()
                    +" n: "+painIndicatorList.length.toString()+"\n");
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == imgList.indexOf(imgPath) ? Colors.blueAccent : Colors.grey,
                      ),
                      child: 
                        GestureDetector(
                          onTap:(){
                            //_carouselController.jumpToPage(imgList.indexOf(imgPath));
                          }
                        ),
                    );
                  }).toList(),
                ),
               
          // Padding(
          //   padding: EdgeInsets.all(10),
          //   child: RaisedButton(
          //     child: Text("Continuar"),
          //     onPressed: (){
          //       setState(() {
          //           rating=0;
          //       });
               
          //       }
          //     ),
          //   )
          ]
        )
      )
    );
  }
}