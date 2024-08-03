import 'package:dailynotzz/constants/color.dart';
import 'package:dailynotzz/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int selectPage = 0;
  PageController controller = PageController();

  List pageApr = [
    {
      "tittle": "Add Your Notes",
      "subtitle": "Discover the best Vactions for Tourist...",
      "image": "assets/images/onboardingone.png"
    },
    {
      "tittle": "It will help to Remind ",
      "subtitle": "Fast food delivery to your home,office \n Wherever you are",
      "image": "assets/images/onboardingthree.png"
    },
    {
      "tittle": "Daily Tasks",
      "subtitle": "Discover the best foods...",
      "image": "assets/images/onboardingtwo.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: pageApr.length,
            itemBuilder: ((context, index) {
              var pObj = pageApr[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: media.width,
                    width: media.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pObj["image"].toString(),
                      width: media.width * 0.96,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: media.width * 0.1),
                  Text(
                    pObj["tittle"].toString(),
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                    fontFamily: "Mont"),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xff82CAFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                   const SizedBox(
                    height: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: pageApr.map((e) {
                          var index = pageApr.indexOf(e);
        
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                                color:
                                    index == selectPage ? Color(0xff3F37C9) : Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(4)),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (index)=>Homepage()));
                        },
                        child: Container(
                          height: 46,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: tdBlue),
                          child: Center(
                              child: Text(
                                "Lets Go..",
                                style: TextStyle(
                                  fontFamily: "assets/fonts/Montserrat-Light.ttf",
                                    fontSize: 18,
                                    color: Colors.white),
                              )),
                        ),
                      ),
        
                    ],
                  ),
        
                ],
              );
            }),
          ),
        ),
      ),




      // Text: 'Let\'s get Started',
      //   ),
      // ),
    );
  }
}
