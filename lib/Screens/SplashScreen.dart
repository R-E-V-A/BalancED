import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4e5ed2),
              Color(0xff060f4e),
            ],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft
          )
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset("assets/Group 33519.svg"),
              Text("By Reva",style: reva.copyWith(fontWeight: FontWeight.w700,fontSize: 18),),
              SizedBox(height: 0.01*height,),
              Text("Your financial freedom",style: reva.copyWith(fontWeight: FontWeight.w500,fontSize: 15,)),
              Text("starts today!",style: reva.copyWith(fontWeight: FontWeight.w500,fontSize: 15,)),
              SizedBox(height: 0.35*height,),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(40),
                  color: Colors.white
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/OnboardingTwo', (Route<dynamic> route) => false);
                  },
                  child: Icon(
                    Icons.chevron_right_sharp,
                    size: 50,
                    color: Color(0xff230b34),
                  ),
                ),
              )
            ],
          ),
        ))
      ),
    );
  }
}
