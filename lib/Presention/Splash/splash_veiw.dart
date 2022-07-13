import 'dart:async';
import 'package:flutter/material.dart';
import 'package:future_bride/Presention/resource/Assets.dart';
import 'package:future_bride/Presention/resource/Color.dart';
import 'package:future_bride/Presention/resource/Routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(Routes.onboardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManger.white,
      body: Center(child: Image(image: AssetImage(AssetsName.splashname))),
    );
  }
}
