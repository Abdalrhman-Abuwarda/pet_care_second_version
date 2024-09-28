import 'package:flutter/material.dart';
import 'package:pet_care_second_version/features/onboarding/ui/onboarding_widgets/descriptionOnboading.dart';
import 'package:pet_care_second_version/resources/values_manager.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';

import '../../../../resources/colors_manager.dart';
class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
    Key? key,
    required this.activeIndex,
    required this.currantPage,
  }) :  super(key: key);

  final int activeIndex;
  final int currantPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.only(right: 5),
      height: AppSize.s9.height,
      width: currantPage == activeIndex ? AppSize.s35.width : AppSize.s9.width,
      decoration: BoxDecoration(
        color: currantPage == activeIndex ? ColorManager.secondaryLight : ColorManager.gray,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
    );

  }
}