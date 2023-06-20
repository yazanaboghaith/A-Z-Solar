import 'dart:async';
import 'package:az_solar/Auth/Login.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  bool? isLogged = true;

  Splash({this.isLogged});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: Login(),
          type: PageTransitionType.fade,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    didChangeDependencies();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoadingAnimationWidget.waveDots(
                        color: Color(0xffc1c0c0),
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
