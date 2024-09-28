import 'package:flutter/material.dart';
import 'package:pet_care_second_version/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care_second_version/locator.dart';
import 'package:pet_care_second_version/resources/size_config.dart';
import 'package:pet_care_second_version/resources/styles_manager.dart';
import 'package:pet_care_second_version/resources/values_manager.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';

class DescriptionOnBoarding extends StatelessWidget {
  DescriptionOnBoarding({
    Key? key,
    required this.list,
    required int activeIndex,
  }) : _activeIndex = activeIndex, super(key: key);

  final List<OnBoardingModel> list;
  final int _activeIndex;
  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  AppPadding.p32.paddingHorizontal,
      child: SizedBox(
        height: 72.height,
        child: Text(
          list[_activeIndex].desc,
          style: supTitleMedium,
          textAlign: TextAlign.center,
        ),
        // textAlign: TextAlign.center,
      ),
    );
  }
}
