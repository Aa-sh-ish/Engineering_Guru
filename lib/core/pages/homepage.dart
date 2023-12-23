import 'package:engineering_guru/common/utils/constants.dart';
import 'package:engineering_guru/common/widgets/appstyle.dart';
import 'package:engineering_guru/common/widgets/heightspacer.dart';
import 'package:engineering_guru/common/widgets/reusabletext.dart';
import 'package:engineering_guru/core/pages/mcqchoosefield.dart';
import 'package:engineering_guru/core/pages/modelQuestionfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          title: const Text(
            "Santosh Mishra",
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context, "/home");
                  Fluttertoast.showToast(msg: "Successfully signed out");
                },
                icon: const Icon(Icons.logout))
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
                              30,
                              AppConst.kBkDark,
                              FontWeight.w600,
                            )),
                        ReusableText(
                            text: "0",
                            textstyle: appstyle(
                                30, AppConst.kBkDark, FontWeight.w600)),
                      ],
                    ),
                    Column(
                      children: [
                        ReusableText(
                            text: "Score",
                            textstyle: appstyle(
                                30, AppConst.kBkDark, FontWeight.w600)),
                        const Divider(
                          color: AppConst.kBkDark,
                          height: 10,
                        ),
                        ReusableText(
                            text: "0",
                            textstyle: appstyle(
                                30, AppConst.kBkDark, FontWeight.w600)),
                      ],
                    ),
                    CircleAvatar(
                        backgroundColor: AppConst.kwhite,
                        radius: 45.h,
                        child:
                            const Image(image: AssetImage("assets/logo.png")))
                  ],
                ),
              ),
            ),
            const HeightSpace(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: const [
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Syllabus",
                              style: appstyle(15, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          radius: 50,
                          child: Image.asset("assets/Syllabus.png"),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ModelQuestionChoseField()));
                  },
                  child: Container(
                    width: 150,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: const [
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Model Question",
                              style: appstyle(15, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          radius: 50,
                          child: Image.asset("assets/model questio .png"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const HeightSpace(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MCQChooseField()));
                  },
                  child: Container(
                    width: 150,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: const [
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("MCQs",
                              style: appstyle(15, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          radius: 50,
                          child: Image.asset("assets/MCQ.png"),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: AppConst.kLight,
                      boxShadow: const [
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Subscription",
                              style: appstyle(15, AppConst.knavypurpledark,
                                  FontWeight.bold)),
                        ),
                        CircleAvatar(
                          radius: 50,
                          child: Image.asset("assets/subscription.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const HeightSpace(height: 30),
            ReusableText(
                text: "Notices:",
                textstyle: appstyle(
                  20,
                  AppConst.kBkDark,
                  FontWeight.w600,
                )),
            const HeightSpace(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppConst.knavypurplelight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReusableText(
                      text:
                          "The Engineering liscense exam will be held on ashad 15",
                      textstyle: appstyle(
                        20,
                        AppConst.kBkDark,
                        FontWeight.w600,
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
