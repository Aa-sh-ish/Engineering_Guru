
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_guru/auth/auth.dart';
import 'package:engineering_guru/common/utils/constants.dart';
import 'package:engineering_guru/common/widgets/appstyle.dart';
import 'package:engineering_guru/common/widgets/form_container_widget.dart';
import 'package:engineering_guru/common/widgets/heightspacer.dart';
import 'package:engineering_guru/common/widgets/reusabletext.dart';
import 'package:engineering_guru/pages/homepage.dart';
import 'package:engineering_guru/pages/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';







class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  User? user;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    backgroundColor: AppConst.kwhite,
      body: SingleChildScrollView(
        child: Center(
          
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 50),
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        
        
                Image(image: AssetImage("assets/logo.png"),),
        
        
            ReusableText(text: "Login", textstyle: appstyle(50, AppConst.knavypurpledark, FontWeight.bold)),
        
                HeightSpace(height: 30),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                 HeightSpace(height: 10),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                 HeightSpace(height: 30),
                GestureDetector(
                  onTap: () {
                    _signIn();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isSigning ? CircularProgressIndicator(
                        color: Colors.white,) : Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10,),
                // GestureDetector(
                //   onTap: () {
                //    _signUp();
        
                //   },
                //   child: GestureDetector(
                //     onTap: (){
        
        
                //     },
                //     child: Container(
                //       width: double.infinity,
                //       height: 45,
                //       decoration: BoxDecoration(
                //         color: Colors.red,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(FontAwesomeIcons.google, color: Colors.white,),
                //             SizedBox(width: 5,),
                //             Text(
                //               "Sign in with Google",
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
        
        
                 HeightSpace(height: 30),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                              (route) => false,
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      Fluttertoast.showToast(msg: "User is successfully logged in");
     
      // Within the `FirstRoute` widget
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const  HomePage()),
  );
    } else {
      Fluttertoast.showToast(msg: "some error occured");
    }
  }


 void _signUp() async {


    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);


    if (user != null) {
      Fluttertoast.showToast(msg: "User is successfully loggedin");
      Navigator.pushNamed(context, "/home");
    } else {
      Fluttertoast.showToast(msg: "Some error happend");
    }
  }
}