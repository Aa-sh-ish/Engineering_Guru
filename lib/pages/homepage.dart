import 'package:engineering_guru/common/utils/constants.dart';
import 'package:engineering_guru/common/widgets/appstyle.dart';
import 'package:engineering_guru/common/widgets/heightspacer.dart';
import 'package:engineering_guru/common/widgets/outlinebutton.dart';
import 'package:engineering_guru/common/widgets/reusabletext.dart';
import 'package:engineering_guru/common/widgets/widthspacer.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Santosh Mishra",
          ),
          actions: <Widget>[
           IconButton(onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context, "/home");
               Fluttertoast.showToast(msg: "Successfully signed out");
              },icon: Icon(Icons.logout))
          ],
        ),
        backgroundColor: AppConst.kwhite,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Container(
                height: 100.h,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppConst.knavypurple2,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      AppConst.knavypurplelight,
                      AppConst.knavypurple3
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ReusableText(
                            text: "Rank",
                            textstyle: appstyle(
                              40,
                              AppConst.kBkDark,
                              FontWeight.w600,
                            )),
                        const Divider(
                          color: AppConst.kGreyLight,
                          height: 10,
                        ),
                        ReusableText(
                            text: "0",
                            textstyle: appstyle(
                                40, AppConst.kBkDark, FontWeight.w600)),
                      ],
                    ),
                    Column(
                      children: [
                        ReusableText(
                            text: "Score",
                            textstyle: appstyle(
                                40, AppConst.kBkDark, FontWeight.w600)),
                        Divider(
                          color: AppConst.kBkDark,
                          height: 10,
                        ),
                        ReusableText(
                            text: "0",
                            textstyle: appstyle(
                                40, AppConst.kBkDark, FontWeight.w600)),
                      ],
                    ),
                  CircleAvatar(
                    backgroundColor: AppConst.kwhite,
                    radius: 45.h,
                    child: Image(image:  AssetImage("assets/logo.png")))
                  ],
                ),
              ),
            ),

            HeightSpace(height: 70),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Syllabus",
                              style: appstyle(30, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          child: Image.asset("assets/Syllabus.png"),
                          radius: 50,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: [
                        BoxShadow(
                          color: AppConst.knavypurple2,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                          width: 2, color: AppConst.knavypurplelight),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Model Question",
                              style: appstyle(30, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          child: Image.asset("assets/model questio .png"),
                          radius: 50,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: [
                        BoxShadow(
                          color: AppConst.knavypurple2,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                          width: 2, color: AppConst.knavypurplelight),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpace(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("MCQs",
                              style: appstyle(30, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          child: Image.asset("assets/MCQ.png"),
                          radius: 50,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: [
                        BoxShadow(
                          color: AppConst.knavypurple2,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                          width: 2, color: AppConst.knavypurplelight),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Subscription",
                              style: appstyle(30, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          child: Image.asset("assets/subscription.png"),
                          radius: 50,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: [
                        BoxShadow(
                          color: AppConst.knavypurple2,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                          width: 2, color: AppConst.knavypurplelight),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpace(height: 30),
            ReusableText(
                text: "Notices:",
                textstyle: appstyle(
                  40,
                  AppConst.kBkDark,
                  FontWeight.w600,
                )),

            HeightSpace(height: 30),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(color: AppConst.knavypurplelight,  borderRadius: BorderRadius.circular(12),),
                
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableText(
                      text: "The Engineering liscense exam will be held on ashad 15",
                      textstyle: appstyle(
                        40,
                        AppConst.kBkDark,
                        FontWeight.w600,
                      )),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     FirebaseAuth.instance.signOut();
            //     Navigator.pop(context, "/home");
            //    Fluttertoast.showToast(msg: "Successfully signed out");
            //   },
            //   child: Container(
            //     height: 45,
            //     width: 100,
            //     decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Center(
            //       child: Text(
            //         "Sign out",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ));
  }
}
