import 'dart:async';
import 'package:complete_advanced_flutter/domain/model.dart';
import 'package:complete_advanced_flutter/presentation/base/baseViewModel.dart';
import 'package:complete_advanced_flutter/presentation/onboarding/onboarding.dart';
import 'package:complete_advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:complete_advanced_flutter/presentation/resources/strings_manager.dart';

class OnbOardingViewModel extends BaseViewModel
    with OnBoardingViewModelInouts, OnBoardingViewModelOutPuts {
  //stram controller
  final StreamController streamController =
      StreamController<SliderViewObjects>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  @override
  void dispose() {
    streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    _list = _getSliderData();
    _postDataView();
  }

  @override
  int GoNext() {
    int nextIndex = _currentIndex++; // +1
    if (nextIndex >= _list.length) {
      _currentIndex = 0; // infinite loop to go to first item inside the slider
    }
    return _currentIndex;
  }

  @override
  int GoPrevious() {
    int previousIndex = _currentIndex--; // -1
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1; // infinite loop to go to the length of slider list
    }

    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
    _currentIndex = index;
    _postDataView();
  }

  //input
  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => streamController.sink;
  //output
  @override
  // TODO: implement OutPutOfSliderViewObjetcs
  Stream<SliderViewObjects> get OutPutOfSliderViewObjetcs =>
      streamController.stream.map((slideViewObject) => slideViewObject);

  //
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingSubTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingSubTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingSubTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingSubTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4)
      ];
  _postDataView() {
    inputSliderViewObject.add(
        SliderViewObjects(_list[_currentIndex], _list.length, _currentIndex));
  }
}

abstract class OnBoardingViewModelInouts {
  void GoNext();
  void GoPrevious();
  void onPageChanged(int index);

  //this is the way to add data to stream
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutPuts {
  Stream<SliderViewObjects> get OutPutOfSliderViewObjetcs;
}

class SliderViewObjects {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObjects(this.sliderObject, this.numOfSlides, this.currentIndex);
}
