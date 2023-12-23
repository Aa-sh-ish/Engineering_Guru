import 'package:engineering_guru/common/utils/constants.dart';
import 'package:engineering_guru/common/widgets/appstyle.dart';
import 'package:engineering_guru/common/widgets/heightspacer.dart';
import 'package:engineering_guru/common/widgets/reusabletext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseField extends StatefulWidget {
  const ChooseField({super.key});

  @override
  State<ChooseField> createState() => _ChooseFieldState();
}

class _ChooseFieldState extends State<ChooseField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:ReusableText(text: "Choose Your Faculty ",textstyle: appstyle(50.h, AppConst.kBkDark, FontWeight.bold)),
      elevation: 10.0,
      centerTitle: true),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
          InkWell(
            onTap: (){},
            child: Container(
               height: 50.h,
               width:200.h,
               
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
                    child: ReusableText(
                                text: "Civil",
                                textstyle: appstyle(
                                  40,
                                  AppConst.kBkDark,
                                  FontWeight.w600,
                                )),
                                alignment: Alignment.center,
            ),
          ),
           HeightSpace(height: 70),
            InkWell(
              onTap: (){},
              child: Container(
               height: 50.h,
               width:200.h,
               
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
                    child: ReusableText(
                                text: "Computer",
                                textstyle: appstyle(
                                  40,
                                  AppConst.kBkDark,
                                  FontWeight.w600,
                                )),
                                alignment: Alignment.center,
                        ),
            ),
           HeightSpace(height: 70),
            InkWell(
              onTap: (){},
              child: Container(
               height: 50.h,
               width:200.h,
               
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
                    child: ReusableText(
                                text: "Electronics",
                                textstyle: appstyle(
                                  40,
                                  AppConst.kBkDark,
                                  FontWeight.w600,
                                )),
                                alignment: Alignment.center,
                        ),
            ),
           HeightSpace(height: 70),
             InkWell(
              onTap: (){},
               child: Container(
               height: 50.h,
               width:200.h,
               
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
                    child: ReusableText(
                                text: "Architecture",
                                textstyle: appstyle(
                                  40,
                                  AppConst.kBkDark,
                                  FontWeight.w600,
                                )),
                                alignment: Alignment.center,
                         ),
             ),
           HeightSpace(height: 70),
            InkWell(
              onTap: (){}, 
              child: Container(
               height: 50.h,
               width:200.h,
               
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
                    child: ReusableText(
                                text: "Mechanical",
                                textstyle: appstyle(
                                  40,
                                  AppConst.kBkDark,
                                  FontWeight.w600,
                                )),
                                alignment: Alignment.center,
                        ),
            ),
        ]),
      )
    );
  }
}