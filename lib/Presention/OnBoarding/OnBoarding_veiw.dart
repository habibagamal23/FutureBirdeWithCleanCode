import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_bride/Presention/resource/Color.dart';
import 'package:future_bride/Presention/resource/Values.dart';
import 'package:future_bride/domain/models/models.dart';
import '../resource/Routes.dart';
import '../resource/String.dart';
import 'OnBoardingViewModel/Onboardung_ViewModel.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  OnBoardinViewModel onBViewModel = OnBoardinViewModel();

// fun to  start viewmodel

  blind() {
    onBViewModel.start();
  }

  @override
  void initState() {
    blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: onBViewModel.outPutSliderViewObject,
      builder: (context, snapshot) {
        return getBodyContentWidget(snapshot.data);
      },
    );
  }

  Widget getBodyContentWidget(SliderViewObject? sliderviewobject) {
    if (sliderviewobject == null) {
      return Container();
    } else {
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
            itemCount: sliderviewobject.numOfSlider,
            onPageChanged: (index) {
              onBViewModel.onPageChanged(index);
            },
            itemBuilder: (constext, index) {
              return OnBoardingPage(sliderviewobject.sliderObject);
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
              getsheetWidght(sliderviewobject),
            ],
          ),
        ),
      );
    }
  }

  Widget getCirclerWidight(int index, int curentidenx) {
    if (index == curentidenx) {
      return const Icon(
        Icons.circle_outlined,
        color: ColorManger.basiccolor,
        size: 20,
      );
    } else {
      return const Icon(Icons.circle_rounded,
          color: ColorManger.basiccolor, size: 15);
    }
  }

  Widget getsheetWidght(SliderViewObject sliderViewObject) {
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
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: ColorManger.basiccolor),
              ),
              onTap: () {
                _controller.animateToPage(onBViewModel.getpreviseIndex(),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceOut);
              },
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlider; i++)
                Padding(
                  padding: const EdgeInsets.all(AppSize.s8),
                  child: getCirclerWidight(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: GestureDetector(
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.arrow_forward_ios_outlined,
                    color: ColorManger.basiccolor),
              ),
              onTap: () {
                _controller.animateToPage(onBViewModel.getNextIndex(),
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

class OnBoardingPage extends StatelessWidget {
  SliderObject sliderObject;
  OnBoardingPage(this.sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(sliderObject.image),
          width: 200,
          height: 300,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          sliderObject.subTitle,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
