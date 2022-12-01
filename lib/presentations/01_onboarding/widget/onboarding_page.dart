import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/values_manager.dart';
import '../../../domain/model/onboarding_model.dart';

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: AppSize.s40,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              _sliderObject.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              _sliderObject.suTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(
            height: AppSize.s60,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            child: SvgPicture.asset(
              _sliderObject.image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
