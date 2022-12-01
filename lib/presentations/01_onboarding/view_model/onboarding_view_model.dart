import 'dart:async';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../domain/model/onboarding_model.dart';
import '../../000_base/base_view_model.dart';

class OnBoarding extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
// -------- stream controllers outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    if (_currentIndex < _list.length - 1) {
      return ++_currentIndex;
    }
    return _list.length - 1;
  }

  @override
  int goPrevious() {
    if (_currentIndex > 0) {
      return --_currentIndex;
    }
    return 0;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        sliderObject: _list[_currentIndex],
        numOfSlides: _list.length,
        currentIndex: _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onBoardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onBoardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onBoardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onBoardingLogo4,
        ),
      ];
}

// inputs mean that 'Orders ' that our view model will receive form view
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left
  int goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);
  // -------- stream controllers input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
