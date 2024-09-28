import 'package:flutter/material.dart';


import 'package:pet_care_second_version/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';

import '../../../../resources/styles_manager.dart';

class TitleOnBoarding extends StatelessWidget {
  const TitleOnBoarding({
    Key? key,
    required this.list,
    required int activeIndex,
  }) :
        _activeIndex = activeIndex,
        super(key: key);

  final List<OnBoardingModel> list;
  final int _activeIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.height,
      width: 288.width,
      child: Text(
        list[_activeIndex].title,
        style: h3Bold,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
