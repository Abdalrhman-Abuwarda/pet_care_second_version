import 'package:flutter/material.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';
import '../../../locator.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/size_config.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../routing/routing_module.dart';
import '../core/on_boarding_provider.dart';
import '../model/onBoardingModel.dart';
import 'onboarding_widgets/descriptionOnboading.dart';
import 'onboarding_widgets/sliderIndicator.dart';
import 'onboarding_widgets/titlOnBoarding.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List<OnBoardingModel> list = OnBoardingModel.data;
  SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<OnBoardingProvider>(context, listen: false)
        .initStateOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig.init(context);
    return Scaffold(
      body: Consumer<OnBoardingProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Container(
                width: double.infinity,
                height: sizeConfig.getScreenHeight(440),
                alignment: Alignment.center,
                child: PageView.builder(
                    onPageChanged: (value) => provider.onoPageChange(value),
                    itemCount: list.length,
                    controller: provider.controller,
                    itemBuilder: (context, index) {
                      var scale = provider.activeIndex == index ? 1.0 : 0.8;
                      return TweenAnimationBuilder(
                          tween: Tween(begin: scale, end: scale),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 500),
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: list[provider.activeIndex].screen,
                            );
                          });
                    })),
            AppSize.s18.verticalSpace,
            TitleOnBoarding(list: list, activeIndex: provider.activeIndex),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s5)),
            DescriptionOnBoarding(
                list: list, activeIndex: provider.activeIndex),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  list.length,
                  (index) => SliderIndicator(
                        activeIndex: index,
                        currantPage: provider.currantPage,
                      )),
            ),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s30)),
            if (provider.activeIndex + 1 != list.length)
              ElevatedButton(
                onPressed: () {
                  provider.controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
                child: const Text(AppStrings.next),
              ),
            if (provider.activeIndex + 1 >= list.length)
              ElevatedButton(
                onPressed: () {
                  RouteService.serviceNavi
                      .pushNamedReplacement(RouteNames.mainAuthScreen);
                },
                child: const Text(AppStrings.getStarted),
              ),
            addVerticalSpace(sizeConfig.getScreenHeight(17)),
            if (provider.activeIndex + 1 != list.length)
              TextButton(
                  onPressed: () {
                    RouteService.serviceNavi
                        .pushNamedReplacement(RouteNames.mainAuthScreen);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: bodyRegular(color: ColorManager.secondary),
                  )),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s33))
          ],
        ),
      ),
    );
  }
}
