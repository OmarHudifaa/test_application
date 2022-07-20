import 'package:asset_people_application/classes/User.dart';
import 'package:flutter/material.dart';
import 'package:asset_people_application/widgets/welcome_screen_widgets/input_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Future<Member> fetchLogin;

  @override
  void initState(){
    super.initState();
    //fetchLogin=login();
  }

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xfffafafa),
            width: width,
            height: height*0.3,
            padding: const EdgeInsets.only(top: 150,right: 20,left: 20,bottom: 50) ,
            child: Image.asset("assets/images/logo.png"),
          ),
          Container(
            width: width,
            height: height-(height*0.3),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            decoration:
            BoxDecoration(
                borderRadius: BorderRadius.circular(30),color:Theme.of(context).primaryColor),
            child: Column(
              children: [
                const Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold,letterSpacing: 1,shadows: [Shadow(offset: Offset(10,10),blurRadius: 25,color: Colors.black)]),),
                SizedBox(height: height*0.03),
                const Text("Please sign in to your account",style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 1,shadows: [Shadow(offset: Offset(10,10),blurRadius: 25,color: Colors.black)]),),
                 SizedBox(height: height*0.1,),
                InputField(height: height, width: width, fieldeController: usernameController,hintTextField:"User Name",obsecureText: false,),
                SizedBox(height: height*0.03,),
                InputField(height: height, width: width, fieldeController: passwordController,hintTextField:"Password",obsecureText: true,),
                InkWell(
                  onTap: (){
                   login();
                   //Navigator.pushNamed(context, "HomeScreen");
                    },
                  child: Container(
                    width: width*0.5,
                      height: height*0.06,
                      margin: EdgeInsets.only(top: height*0.1,bottom: height*0.01),
                      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color:Colors.white,boxShadow: const [ BoxShadow(offset:Offset(10, 10),blurRadius: 25)]),
                      child: Text("Log In",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 0.8,color: Theme.of(context).primaryColor)),)),

              ],),
          )
        ],
      ),
    );
  }
  Future<void> login() async{
    if(usernameController.text.isNotEmpty&&passwordController.text.isNotEmpty){
      String credentials="${usernameController.text}:${passwordController.text}";
      Codec<String,String> stringToBase64=utf8.fuse(base64);
      String encoded=stringToBase64.encode(credentials);

     var response=await http.get(Uri.parse("https://ap-acc.maximo.nl/maximo/api/os/MXAPIAPIKEY?lean=1&mxlaction=query&oslc.select=userid,apikey"),
          headers:({"MAXAUTH":encoded}));
      var jsonData=json.decode(response.body);

       /* List member=[];
      jsonData.forEach((k, v) =>member.add(jsonData));
      this is working...............................
      */

      //jsonData.entries.forEach((e) => member.add(jsonData));
      if(response.statusCode==200){
       /* setState((){
         member=jsonData.entries.forEach((e) => Member.fromJson(jsonData));
        });*/
      //return Member.fromJson(jsonData);
         //jsonData.forEach((k, v) =>members=Member.fromJson(jsonData));

        ///todo store the userid and apikey in the class and send it to the home screen for the restapi to get the workorders and use the name on top of the screen

        Navigator.pushNamed(context, "HomeScreen");

      }else
        {
           throw ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Credentials!")));

      }
    }else{
      throw ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill in all the fields!")));
    }
  }
}



