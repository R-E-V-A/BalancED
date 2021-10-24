import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Services/PostServices.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Routes.dart';
import 'Components/SignUpTextFIeldMobile.dart';
import 'Components/SignUpTextField.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  PostServices postServices=PostServices();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xffF0F0F0),
        child: Padding(
          padding: EdgeInsets.only(top: 0.08*height,left: 0.1*width,right: 0.1*width),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Image(
                      height: 130,
                      image: AssetImage(
                        "assets/callogo.png"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.03*height,
                  ),
                  Text("Create an Account",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 30,color: Color(0xff49494f)),textAlign: TextAlign.center,),
                  SizedBox(
                    height: 0.1*height,
                  ),
                  Text("Email",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff49494f)),),
                  SizedBox(height: 0.01*height,),
                  SignUpTextFieldMobile(width: width,height: height,controller: email,title: "rick@gmail.com",),
                  SizedBox(height: 0.02*height,),
                  Text("Username",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff49494f)),),
                  SizedBox(height: 0.01*height,),
                  SignUpTextFieldMobile(width: width,height: height,controller: username,title: "pickleRick007",),
                  SizedBox(height: 0.02*height,),
                  Text("Password",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff49494f)),),
                  SizedBox(height: 0.01*height,),
                  SignUpTextFieldMobile(width: width,height: height,controller: password,title: "Shh!",),
                  SizedBox(height: 0.09*height,),
                  GestureDetector(
                    onTap: ()async{
                      var x;
                      if(formKey.currentState.validate())
                        {
                          formKey.currentState.save();
                          x =  await postServices.createNewUser(username.text, email.text, password.text, "01/01/2000");
                        }
                    if(x!=null) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/HomePage', (Route<dynamic> route) => false);
                    }
                    },
                    child: Container(
                      height: 0.07*height,
                      width: width*0.8,
                      margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff22319e)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign Up",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),),
                          ],
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.02*height,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.LogInPage);
                    },
                    child: Container(
                      height: 0.07*height,
                      width: width*0.8,
                      margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff121032)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an Account?",style: paraText.copyWith(fontSize: 18,fontWeight: FontWeight.w500),),
                          ],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



