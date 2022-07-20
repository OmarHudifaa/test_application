import 'package:flutter/material.dart';
//this is the starting screen  before leading to the login screen
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images=["image-slide1.jpeg","image-slide2.jpeg","image-slide3.jpeg"];

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
        return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage("assets/images/${images[index]}"),fit: BoxFit.cover)
              ),
              child:  Container(
                margin: const EdgeInsets.only(top: 150,left: 20,right: 20),
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("AssetPeople",
                      style: TextStyle(color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 30,
                          fontWeight:FontWeight.bold,
                          shadows: [Shadow(offset: Offset(10,10),blurRadius: 25,color: Colors.black)] ),),
                    Container(
                      width: width*0.8,
                      padding: EdgeInsets.only(top: height*0.01),
                      child: const Text("The future of asset management.",
                        style: TextStyle(color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 30,

                            shadows: [Shadow(offset: Offset(10,10),blurRadius: 25,color: Colors.black)] ),),
                    ),
                    const SizedBox(height: 60,),
                    InkWell(
                      onTap: (){Navigator.pushNamed(context, "LoginScreen");},
                      child: Container(
                        width: 150,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          boxShadow: const [BoxShadow(blurRadius: 25)],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white60,),
                            Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white70,),
                            Icon(Icons.arrow_forward_ios_outlined,size: 25,color: Colors.white,),
                            Icon(Icons.arrow_forward_ios,size: 30,color: Colors.white,),

                          ],
                        ),
                      ),
                    )
                  ],),
                  Column(children: List.generate(3, (indexDots) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      width: 8,
                      height: index==indexDots?40:10,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                          color: index==indexDots?Colors.white:Colors.white54),
                    );
                  }),

                  ),
                ],),

              ),

            );
      }),
    );
  }
}

