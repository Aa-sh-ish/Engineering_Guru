import 'package:engineering_guru/common/utils/constants.dart';
import 'package:engineering_guru/common/widgets/appstyle.dart';
import 'package:engineering_guru/common/widgets/outlinebutton.dart';
import 'package:engineering_guru/common/widgets/reusabletext.dart';
import 'package:engineering_guru/common/widgets/shimmerror.dart';
import 'package:engineering_guru/core/pages/checkPage.dart';
import 'package:engineering_guru/core/provider/computer_mcq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComputerMCQ extends ConsumerStatefulWidget {
  const ComputerMCQ({Key? key}) : super(key: key);

  @override
  ConsumerState<ComputerMCQ> createState() => _ComputerMCQState();
}

class _ComputerMCQState extends ConsumerState<ComputerMCQ> {
  String values = "";
  String selectedOption = '';
  final PageController _pageController = PageController();

  int rightnumber = 0;
  int wrongnumber = 0;

  @override
  Widget build(BuildContext context) {
    final mcq = ref.watch(mcqdataProvider);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  color: AppConst.kwhite,
                  height: 600,
                  child: mcq.when(data: (mcq) {
                    return PageView.builder(
                      reverse: false,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      controller: _pageController,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: ReusableText(
                                  text: "${index + 1}. ${mcq[index].question}",
                                  textstyle: appstyle(
                                    20,
                                    AppConst.knavypurpledark,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              RadioListTile(
                                title: MCQTile(text: mcq[index].option1),
                                value: mcq[index].option1,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                              RadioListTile(
                                selectedTileColor: AppConst.kGreen,
                                title: MCQTile(text: mcq[index].option2),
                                value: mcq[index].option2,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: MCQTile(text: mcq[index].option3),
                                value: mcq[index].option3,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: MCQTile(text: mcq[index].option4),
                                value: mcq[index].option4,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                              CustomOutlineButton(
                                  ontap: () {
                                    if (selectedOption ==
                                        mcq[index].rightanswer) {
                                      rightnumber++;
                                    } else {
                                      wrongnumber++;
                                    }
                                    (index == 9)
                                        ? Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CheckPage(rightnumber,
                                                            wrongnumber)),
                                                (route) => false)
                                        : _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.decelerate);
                                  },
                                  width: 200,
                                  height: 30,
                                  borradius: 15,
                                  borcolor: Colors.black,
                                  text: (index == 9) ? "Submit" : "Next",
                                  textstyle: appstyle(
                                      21, Colors.green, FontWeight.bold))
                            ],
                          ),
                        );
                      },
                    );
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
                                  height: 80,
                                  width: 350,
                                  color: AppConst.kGreyDK,
                                )),
                          );
                        },
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MCQTile extends StatelessWidget {
  const MCQTile({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        color: AppConst.kLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReusableText(
          text: text,
          textstyle: appstyle(15, AppConst.knavypurple4, FontWeight.w600),
        ),
      ),
    );
  }
}
