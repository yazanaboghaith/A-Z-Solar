import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:az_solar/Auth/Login.dart';
import 'package:az_solar/Const/Color.dart';
import 'package:az_solar/Const/textinputall.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

// final fullnamesignupController = TextEditingController();
// final phonesignupController = TextEditingController();
// final passwordsignupController = TextEditingController();
// final emailsignupController = TextEditingController();
final _key = GlobalKey<FormState>();

class _SignupState extends State<Signup> {
  @override
  // void dispose() {
  //   fullnamesignupController.clear();
  //   phonesignupController.clear();
  //   passwordsignupController.clear();
  //   emailsignupController.clear();
  //   super.dispose();
  // }

  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Image.asset('image/image.png'),
              SafeArea(
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: Login(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_forward_ios),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    color: Colors.transparent,
                                  ),
                                  AutoSizeText(
                                    "Signup",
                                    minFontSize: 30,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Kprimareytextcolor),
                                  ),
                                  AutoSizeText(
                                    "Don't have an account?",
                                    minFontSize: 16,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.transparent,
                              ),
                              TextInpuAll(
                                label: "Full Name",
                                //  controller: fullnamesignupController,
                                isPassword: false,
                              ),
                              TextInpuAll(
                                label: "Email address",
                                // controller: emailsignupController,
                                isPassword: false,
                              ),
                              TextInpuAll(
                                label: "Password",
                                //    controller: passwordsignupController,
                                isPassword: true,
                              ),
                              TextInpuAll(
                                label: "Phone",
                                //   controller: phonesignupController,
                                isPassword: false,
                              ),
                              Divider(
                                color: Colors.transparent,
                              ),
                              ProgressButton.icon(
                                padding: EdgeInsets.all(8),
                                maxWidth: width * 0.4,
                                progressIndicatorAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.white),
                                iconedButtons: {
                                  ButtonState.idle: IconedButton(
                                      text: "Signup",
                                      icon: Icon(Icons.how_to_reg,
                                          color: Colors.white),
                                      color:
                                          Kprimareytextcolor), //لون خلفية الزر
                                  ButtonState.loading: IconedButton(
                                      text: 'Loading',
                                      color: Color(0xff4067b1)),
                                  ButtonState.fail: IconedButton(
                                      text: 'Failed',
                                      icon: Icon(Icons.cancel,
                                          color: Colors.white),
                                      color: Colors.red.shade300),
                                  ButtonState.success: IconedButton(
                                      text: 'Success',
                                      icon: Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                      color: Colors.green.shade400)
                                },
                                state: stateTextWithIcon,
                                onPressed: () async {
                                  if (_key.currentState!.validate()) {
                                    setState(() {
                                      stateTextWithIcon = ButtonState.loading;
                                    });
                                    if (true) {
                                      setState(() {
                                        stateTextWithIcon = ButtonState.success;
                                      });
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.scale,
                                        title: "The account has been created",
                                        desc:
                                            "You can now log in to get all the features of the application",
                                        btnOkOnPress: () {
                                          Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                              child: Login(),
                                              type: PageTransitionType.fade,
                                            ),
                                          );
                                        },
                                        btnOkText: "Done",
                                      ).show();
                                      debugPrint("Login");
                                    } else {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.scale,
                                        title: "Account Creation Failed",
                                        desc:
                                            "The email you entered already exists, please try again with another email",
                                        btnOkOnPress: () {},
                                        btnOkText: "Done",
                                      ).show();
                                      setState(() {
                                        stateTextWithIcon = ButtonState.fail;
                                      });
                                    }
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "Already have an account?",
                                    minFontSize: 10,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Kthurdeytextcolor),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                        Color(0xff3abcb0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              child: Login(),
                                              type: PageTransitionType.fade));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Kprimareytextcolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
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
    );
  }
}
