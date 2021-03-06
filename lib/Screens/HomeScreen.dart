import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Models/AllTransactionModel.dart';
import 'package:resolvers/Models/NewsModel.dart';
import 'package:resolvers/Routes.dart';
import 'package:resolvers/Screens/BudgetDiary/AddRecord.dart';
import 'package:resolvers/Screens/SingleCourse/PreCourse.dart';
import 'package:resolvers/Screens/StoryScreens/StoryPage.dart';
import 'package:resolvers/Services/FlutterTextToSpeech.dart';
import 'package:resolvers/Services/GetServices.dart';
import 'package:resolvers/Services/PostServices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsClass> data;

  GetServices getServices = GetServices();
  Future<List<NewsClass>> getNewsItems()async{
    List<NewsClass> data = await getServices.getNews();
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getTransactionDetails();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        backgroundColor: Color(0xffe5e5e5),
        body: Padding(
          padding: EdgeInsets.only(
              left: 0.03 * width, right: 0.04 * width, top: 0.04 * height),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.04 * width),
                    child: Text(
                      "Home",
                      style: paraText.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 34,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 0.03 * height,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.04 * width),
                    child: Text(
                      "Financial Shots",
                      style: paraText.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff6e7597)),
                    ),
                  ),
                  SizedBox(
                    height: 0.03 * height,
                  ),
                  FutureBuilder<List<NewsClass>>(
                    future: getNewsItems(),
                    builder: (context, snapshot) {
                      return Padding(
                        padding: EdgeInsets.only(left: 0.04*width),
                        child: Container(
                          height: 0.09*height,
                          width: width,
                          child: ListView.builder(
                            itemBuilder: (context,index){
                              return  Row(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      width: 0.2*width,
                                      height: 0.1*height,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xff22319e),width: 0.004*width),
                                          borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image(
                                          fit: BoxFit.contain,
                                          image: AssetImage("assets/cnn.png",),
                                        ),
                                      ),
                                    ),
                                    onTap: ()async{
                                      await TextToSpeech().getData();
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryPage(
                                          news: snapshot.data[index],
                                          idx: index,
                                        )));
                                    },
                                  ),
                                  SizedBox(width: 0.02*width,)
                                ],
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                          ),
                        ),
                      );
                    }
                  ),
                  SizedBox(
                    height: 0.03 * height,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.04 * width),
                    child: Text(
                      "Pick a Learning Track",
                      style: paraText.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff6e7597)),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PreCourse(
                                titleText: courseTitle[index],
                              )));
                            },
                          child: Column(
                            children: [
                              Container(
                                width: width * 0.9,
                                height: height * 0.20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: courseColor[index],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        courseTitle[index],
                                        style: paraText.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      SizedBox(
                                        height: 0.01 * height,
                                      ),
                                      Text(courseDesc[index],
                                          style: paraText.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                      SizedBox(
                                        height: 0.04 * height,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.book_rounded,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 0.02 * width,
                                          ),
                                          Icon(
                                            Icons.play_circle_fill,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 0.4 * width,
                                          ),
                                          Text(
                                            "Begin Track",
                                            style: paraText.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            width: 0.02 * width,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.02*height,)
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          currentIndex: currIndex,
          elevation: 20,
          onTap: (val) {
            setState(() {
              if (val != currIndex) {
                currIndex = val;
                if (val == 0) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/HomePage', (Route<dynamic> route) => false);
                } /*else if (val == 1) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/BudgetHomePage', (Route<dynamic> route) => false);
                } */else if (val == 1) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/MyProfilePage', (Route<dynamic> route) => false);
                }
              }
            });
          },
          selectedIconTheme: IconThemeData(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
         /*   BottomNavigationBarItem(
                label: "Budget",
                icon: Icon(Icons.account_balance_wallet_outlined)),*/
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
        ));
  }
}
