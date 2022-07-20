import 'package:flutter/material.dart';


class InputField extends StatelessWidget {

  const InputField({
    Key? key,
    required this.height,
    required this.width,
    required this.fieldeController,
    required this.hintTextField,
    required this.obsecureText


  }) : super(key: key);
  final double height;
  final double width;
  final TextEditingController fieldeController;
  final String hintTextField;
  final bool obsecureText;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.07,
      padding:  EdgeInsets.symmetric(horizontal: height*0.02,vertical: width*0.04),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [ BoxShadow(offset:Offset(10, 10),blurRadius: 25)]
      ),

      child: TextFormField(
        controller: fieldeController,
        obscureText: obsecureText,
        style: const TextStyle(fontSize: 20),
        decoration:InputDecoration.collapsed(hintText:hintTextField,),
      ),
    );
  }
}

