import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_bride/Presention/resource/Color.dart';
import 'package:future_bride/Presention/resource/Values.dart';

import '../resource/Assets.dart';
import '../resource/Routes.dart';
import '../resource/String.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  late final List _sliderList = _gettsilder();
  int currentIndex = 0;

  List<Slider> _gettsilder() => [
        Slider(AppStrings.onBoardingTitle1, AppStrings.onBoardingsubTitle1,
            AssetsName.onB1),
        Slider(AppStrings.onBoardingTitle2, AppStrings.onBoardingsubTitle2,
            AssetsName.onB2),
        Slider(AppStrings.onBoardingTitle3, AppStrings.onBoardingsubTitle3,
            AssetsName.onB3),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.white,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManger.white,
            statusBarBrightness: Brightness.dark),
      ),
      backgroundColor: ColorManger.white,
      body: PageView.builder(
          controller: _controller,
          itemCount: _sliderList.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (constext, index) {
            return OnBoardingPage(_sliderList[index]);
          }),
      bottomSheet: Container(
        color: ColorManger.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginRoute);
                  }),
            ),
            getsheetWidght(),
          ],
        ),
      ),
    );
  }

  int getpreviseIndex() {
    int pIndex = --currentIndex;
    if (pIndex == -1) {
      pIndex = _sliderList.length - 1;
    }
    return pIndex;
  }

  int getNextIndex() {
    int nIndex = ++currentIndex;
    if (nIndex == _sliderList.length) {
      nIndex = 0;
    }
    return nIndex;
  }

  Widget getCirclerWidight(int index) {
    if (index == currentIndex) {
      return const Icon(Icons.circle_outlined);
    } else {
      return const Icon(Icons.circle_rounded);
    }
  }

  Widget getsheetWidght() {
    return Container(
      color: ColorManger.primry,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: GestureDetector(
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              onTap: () {
                _controller.animateToPage(getpreviseIndex(),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceOut);
              },
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < _sliderList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppSize.s8),
                  child: getCirclerWidight(i),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: GestureDetector(
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.arrow_forward_ios_outlined),
              ),
              onTap: () {
                _controller.animateToPage(getNextIndex(),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceOut);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Slider {
  final String title;
  final String subTitle;
  final String image;
  Slider(this.title, this.subTitle, this.image);
}

class OnBoardingPage extends StatelessWidget {
  final Slider sliderObj;
  const OnBoardingPage(this.sliderObj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s20),
        Image(image: AssetImage(sliderObj.image)),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Text(
            sliderObj.title,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Text(
            sliderObj.subTitle,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
