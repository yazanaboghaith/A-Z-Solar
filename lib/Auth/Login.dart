import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:az_solar/Auth/Signup.dart';
import 'package:az_solar/Const/Color.dart';
import 'package:az_solar/Const/textinputall.dart';
import 'package:az_solar/Widget/Forgetpassword.dart';
import 'package:az_solar/Widget/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final emailloginController = TextEditingController();
final passwordloginController = TextEditingController();
final _key = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  void dispose() {
    emailloginController.dispose();
    passwordloginController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Stack(
                children: [
                  SafeArea(
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SizedBox(
                        width: width,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('image/image.png'),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: kprimareyWidgetcolor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: SizedBox(
                        height: height * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 35,
                            right: 35,
                            top: 25,
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _key,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                      AutoSizeText(
                                        "Login",
                                        minFontSize: 30,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Kprimareytextcolor),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    //لاعطاء مساحة
                                    color: Colors.transparent,
                                  ),
                                  TextInpuAll(
                                    //   controller: emailloginController,
                                    label: "Email address",
                                    isPassword: false,
                                  ),
                                  TextInpuAll(
                                    //controller: passwordloginController,
                                    label: "Password",
                                    isPassword: true,
                                  ),
                                  Divider(
                                    color: Colors.transparent,
                                  ),
                                  ProgressButton.icon(
                                      //يتيح انشاء نص وايقونة مرتبطة به
                                      padding: EdgeInsets.all(8),
                                      maxWidth: width * 0.4,
                                      progressIndicatorAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      iconedButtons: {
                                        ButtonState.idle: IconedButton(
                                          text: "Login",
                                          icon: Icon(
                                            Icons.login,
                                            color: Colors.white,
                                          ),
                                          color: Colors.black,
                                        ),
                                        ButtonState.loading: IconedButton(
                                          text: 'Loading',
                                          color: Color(0xff4067b1),
                                        ),
                                        ButtonState.fail: IconedButton(
                                          text: 'Failed',
                                          icon: Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                          ),
                                          color: Colors.red.shade300,
                                        ),
                                        ButtonState.success: IconedButton(
                                          text: 'Success',
                                          icon: Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          ),
                                          color: Colors.green.shade400,
                                        ),
                                      },
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Homepage()));
                                      }
                                      // async {
                                      //   if (_key.currentState!.validate()) {
                                      //     setState(() {
                                      //       stateTextWithIcon =
                                      //           ButtonState.loading;
                                      //     });
                                      //     // Add your login logic here
                                      //     // For example, call an API to validate the credentials

                                      //     // Simulating API call
                                      //     await Future.delayed(
                                      //         Duration(seconds: 2));

                                      //     // Check if login is successful
                                      //     bool isLoggedIn = true;

                                      //     if (isLoggedIn) {
                                      //       setState(() {
                                      //         stateTextWithIcon =
                                      //             ButtonState.success;
                                      //       });
                                      //       Future.delayed(
                                      //         Duration(seconds: 1),
                                      //       ).then((value) {
                                      //         Navigator.pushReplacement(
                                      //           context,
                                      //           PageTransition(
                                      //             child: Login(),
                                      //             type: PageTransitionType.fade,
                                      //           ),
                                      //   );
                                      // });
                                      //} else {
                                      // AwesomeDialog(
                                      // context: context,
                                      //dialogType: DialogType.error,
                                      //animType: AnimType.scale,
                                      //title: "Login failed",
                                      //desc:
                                      //   "Please verify your email and password",
                                      //btnOkOnPress: () {},
                                      //btnOkText: "done",
                                      //).show();
                                      //setState(() {
                                      // stateTextWithIcon =
                                      //   ButtonState.fail;
                                      //}
                                      //);
                                      // }
                                      //}
                                      //},
                                      // state: stateTextWithIcon,
                                      ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        "Don't have an account?",
                                        minFontSize: 10,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Kthurdeytextcolor,
                                        ),
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                            Kprimareytextcolor,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                              child: Signup(),
                                              type: PageTransitionType.fade,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Signup",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Forgetpassword()));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color:
                                                Colors.black, // لون الخط الأسود
                                            width: 1.0, // سمك الخط
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Forget Password ?",
                                        style: TextStyle(
                                            color: Kprimareytextcolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
