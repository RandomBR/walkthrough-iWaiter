import 'dart:io';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart'; //BIBLIOTECA QUE VAI GUARDAR A INFORMAÇÃO
import 'package:flutter/material.dart';
import 'package:iwaiter/data/data.dart';
import 'package:iwaiter/pages/home.page.dart';


//slider


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  }
  
  class _HomeState extends State<Home>{

//METODO PARA SALVAR SE O USUÁRIO JA VISUALIZOU A INTRO SCREEN
        Future checkFirstSeen() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool _seen = (prefs.getBool('seen') ?? false);

        if (_seen) {
        Navigator.of(context).pushReplacement(
         new MaterialPageRoute(builder: (context) => new Home()));
        } else {
        await prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
         new MaterialPageRoute(builder: (context) => new HomePage()));
        }
    }

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      checkFirstSeen();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          height: isCurrentPage ? 10.0 : 6.0,
          width: isCurrentPage ? 10.0 : 6.0,
          decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index){
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
              
            );
          }),
        bottomSheet: currentIndex != slides.length - 1 ? Container(
         height: Platform.isIOS ? 70 : 60,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  pageController.animateToPage(slides.length - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text("PULAR", style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600)
              )
              ),
                  Row(
                    children: <Widget>[
                      for(int i = 0; i < slides.length; i++) currentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)
                    ],
                    ),
                GestureDetector(
                  onTap: (){
                    pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                  },
                child: Text("PRÓXIMO", style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600)
            ),
                )
            ],
          ),
        ) : Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: Platform.isIOS ? 70 : 60,
          color: Colors.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
            
                onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => HomePage(),
                    ),
                  );
                },
                  child: Text("Ir para o iWaiter", textAlign: TextAlign.right),
              ),
              ]
              ),
            
          //child: Text("Ir para o iWaiter", style: TextStyle(
            //color: Colors.white70,
            //fontWeight: FontWeight.w600
          ),
          );
    }
}

class SliderTile extends StatelessWidget {

  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric (horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath),
          SizedBox(height: 10),
          Text(title, style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600
          )
          ),
          SizedBox(height: 12),
          Text(desc, textAlign: TextAlign.center, style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16
          ),)
        ]
      )
    );
  }
} 
