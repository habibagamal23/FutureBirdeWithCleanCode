//3 class abstract in view model input & output & onboardingviewmode

import 'dart:async';

import 'package:future_bride/Presention/base/baseViewModel.dart';

import '../../../domain/models.dart';
import '../../resource/Assets.dart';
import '../../resource/String.dart';
import 'OnBoardinViewModelInPut.dart';
import 'OnBoardinViewModelOut.dart';

class OnBoardinViewModel extends BaseViewModel
    with OnBoardinViewModelInPut, OnBoardinViewModelOut {
  late final List _sliderList;
  int currentIndex = 0;
  final StreamController streamCon = StreamController();

  @override
  void dispose() {
    streamCon.close();
  }

  @override
  void start() {
    _sliderList = _gettsilder();
    postDataToView();
  }

  @override
  int getNextIndex() {
    int nIndex = ++currentIndex;
    if (nIndex == _sliderList.length) {
      nIndex = 0;
    }
    return nIndex;
  }

  @override
  int getpreviseIndex() {
    int pIndex = --currentIndex;
    if (pIndex == -1) {
      pIndex = _sliderList.length - 1;
    }
    return pIndex;
  }

  @override
  void onPageChanged(index) {
    currentIndex = index;
    postDataToView();
  }

  @override
  Sink get inputSliderViewObject => streamCon.sink;

  @override
  // data send to view how look it
  Stream<SliderViewObject> get outPutSliderViewObject =>
      streamCon.stream.map((sliderViewObject) => sliderViewObject);
// list of data slider
  List<Slider> _gettsilder() => [
        Slider(AppStrings.onBoardingTitle1, AppStrings.onBoardingsubTitle1,
            AssetsName.onB1),
        Slider(AppStrings.onBoardingTitle2, AppStrings.onBoardingsubTitle2,
            AssetsName.onB2),
        Slider(AppStrings.onBoardingTitle3, AppStrings.onBoardingsubTitle3,
            AssetsName.onB3),
      ];
// fun to send data and updata index
  void postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        _sliderList[currentIndex], _sliderList.length, currentIndex));
  }
}
