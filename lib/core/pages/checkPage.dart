import 'package:engineering_guru/common/utils/constants.dart';
import 'package:engineering_guru/common/widgets/appstyle.dart';
import 'package:engineering_guru/common/widgets/reusabletext.dart';
import 'package:engineering_guru/common/widgets/shimmerror.dart';
import 'package:engineering_guru/core/provider/computer_mcq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckPage extends ConsumerStatefulWidget {
  const CheckPage(this.right, this.wrong, {Key? key}) : super(key: key);
  final int right;
  final int wrong;

  @override
  ConsumerState<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends ConsumerState<CheckPage> {
  @override
  Widget build(BuildContext context) {
    final mcq = ref.watch(mcqdataProvider);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppConst.knavypurple2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ReusableText(
                            text: " Right Answer:",
                            textstyle: appstyle(
                                20, AppConst.knavypurpledark, FontWeight.w600),
                          ),
                          ReusableText(
                            text: widget.right.toString(),
                            textstyle:
                                appstyle(20, AppConst.kGreen, FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ReusableText(
                            text: " Wrong Answer:",
                            textstyle: appstyle(
                                20, AppConst.knavypurpledark, FontWeight.w600),
                          ),
                          ReusableText(
                            text: widget.wrong.toString(),
                            textstyle:
                                appstyle(20, Colors.red, FontWeight.w600),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ReusableText(
                              text: widget.right > 4 ? "Pass" : "fail",
                              textstyle: appstyle(
                                  24,
                                  widget.right > 4
                                      ? AppConst.kGreen
                                      : Colors.red,
                                  FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              mcq.when(data: (mcq) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: AppConst.kLight,
                            border: Border.all(color: AppConst.knavypurple3),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                  text:
                                      "Q.no.${index + 1}. \n${mcq[index].question}",
                                  textstyle: appstyle(
                                      20,
                                      AppConst.knavypurpledark,
                                      FontWeight.w400)),
                              ReusableText(
                                text: mcq[index].rightanswer,
                                textstyle: appstyle(
                                    20, AppConst.kGreen, FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ));
              }, error: (error, stack) {
                return const Center(child: Text("error"));
              }, loading: () {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 15,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: ShimmerError(
                            basecolor: AppConst.kGreyDK,
                            highlightcolor: AppConst.kLight,
                            respose: Container(
                              height: 50,
                              width: 350,
                              color: AppConst.kGreyDK,
                            )),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
