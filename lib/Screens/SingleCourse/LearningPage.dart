import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
class LearningPage extends StatefulWidget {
  final String titleText;
  LearningPage({Key key,this.titleText}) : super(key: key);

  @override
  _LearningPageState createState() => _LearningPageState();
}
class _LearningPageState extends State<LearningPage> {
  bool isSpeaking = false;
  final TextEditingController _controller = TextEditingController();
  final _flutterTts = FlutterTts();

  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeTts();
  }

  void speak() async {
    if (courseDesc[0].isNotEmpty) {
      await _flutterTts.speak(demoText);
    }
  }

  void stop() async {
    await _flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      body: Padding(
        padding: EdgeInsets.only(top: 0.05*height,left: 0.07*width,right: 0.07*width),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Lesson 1",style: paraText.copyWith(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                          Text(widget.titleText,style: paraText.copyWith(color: Color(0xff979797),fontSize: 10,fontWeight: FontWeight.w700),),
                        ],
                      ),
                      SizedBox(
                        width: 0.42*width,
                      ),
                      IconButton(
                        icon: Icon(isSpeaking?Icons.volume_off:Icons.volume_up,size: 35,),color: Colors.black,onPressed: ()async{
                          await isSpeaking ? stop() : speak();
                      },),
                      IconButton(icon: Icon(Icons.close,size: 35,),color: Colors.black,onPressed: (){Navigator.pop(context);},)
                    ],
                  ),
                  SizedBox(
                    height: 0.04*height,
                  ),
                  Container(
                    width: 0.95*width,
                    height: 0.2*height,
                    decoration: BoxDecoration(
                        color: Color(0xfff2ebe8),
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image:  AssetImage(
                              "assets/learning.png"
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 0.04*height,
                  ),
                  Text(widget.titleText,style: paraText.copyWith(color: Color(0xff1c2031),fontSize: 28,fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: 0.01*height,
                  ),
                  Text("Making smart shopping decisions",style: paraText.copyWith(color: Color(0xff1c2031),fontSize: 18,fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 0.01*height,
                  ),
                  Text(demoText,style: paraText.copyWith(color: Color(0xff9c9c9c),fontSize: 15)),
                  SizedBox(
                    height: 0.02*height,
                  ),
                  Text("Finding what’s best for you",style: paraText.copyWith(color: Color(0xff1c2031),fontSize: 18,fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 0.01*height,
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ipsum phasellus diam eu mi, elementum. Pellentesque dapibus nisi auctor vitae ut congue facilisis metus. Praesent libero facilisi eleifend justo, tortor suscipit. Fringilla pharetra nibh tortor nunc nisl dictum suscipit convallis donec. Penatibus ut lacus nullam orci ut sit.",style: paraText.copyWith(color: Color(0xff9c9c9c),fontSize: 15)),
                ],
              ),
            ),
            Positioned(
              bottom: height*0.01,
              left: 0.02*width,
              child: GestureDetector(
onTap: (){
  Navigator.pop(context);
},
                child: Container(
                  height: 0.08*height,
                  width: 0.75*width,
                  margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xff22319e),
                  ),
                  child: Center(child: Text("Mark Lesson as Complete",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
