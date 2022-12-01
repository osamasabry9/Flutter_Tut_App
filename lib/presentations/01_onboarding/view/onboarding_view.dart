import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/constants_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../core/utils/values_manager.dart';
import '../../../domain/model/onboarding_model.dart';
import '../view_model/onboarding_view_model.dart';
import '../widget/onboarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoarding _viewModel = OnBoarding();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) => _getContentWidget(snapshot.data),
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),

              // Widgets indicator and arrows

              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject? sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //------------- left Arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goPrevious(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
              child: SizedBox(
                width: AppSize.s40,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
            ),
          ),
          //----------- Proper Circle
          Row(
            children: [
              for (int i = 0; i < sliderViewObject!.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                ),
            ],
          ),

          //---------right Arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goNext(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
              child: SizedBox(
                width: AppSize.s40,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.oSolidCircleIc);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
