part of pets_module;
class EditAgeSheet extends StatelessWidget {
  const EditAgeSheet({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      decoration: BoxDecoration(
          color: ColorManager.white, borderRadius: AppSize.s25.circularRadius),
      child: Column(
        children: [
          Container(
              height: AppSize.s60.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorManager.primaryWithTransparent10))),
              child: const Text(
                AppStrings.chooseYourPetAge,
                style: titleBold,
              )),
          AppSize.s30.verticalSpace,
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: AppSize.s160.height,
                  width: Get.width * 0.4,
                  child: Row(
                    children: [
                      SizedBox(
                        height: AppSize.s160.height,
                        width: 65.width,
                        child: WheelChooser.integer(
                            onValueChanged: (hour) {
                              debugPrint("minutes $hour");

                              // reminderController.selectHour(hour);
                            },
                            maxValue: 24,
                            minValue: 1,
                            // initValue: ReminderController.selectedHour,
                            selectTextStyle: h2Bold,
                            unSelectTextStyle: h2Bold.copyWith(
                                color: ColorManager.primaryWithTransparent30)),
                      ),
                      const VerticalDivider(
                        color: ColorManager.gray,
                      ),
                      SizedBox(
                        height: AppSize.s160.height,
                        width: 65.width,
                        child: WheelChooser.integer(
                            onValueChanged: (minute) {
                              // reminderController.selectMinute(minute);
                              debugPrint("minutes $minute");
                            },
                            maxValue: 60,
                            minValue: 1,
                            // initValue: ReminderController.selectedMinute,
                            // itemSize: 70,
                            selectTextStyle: h2Bold,
                            unSelectTextStyle: h3Medium2),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width * 1,
                height: Get.height * 0.09,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: const Alignment(0, 1),
                        end: const Alignment(0.00, -1.00),
                        colors: [
                          ColorManager.white.withOpacity(0),
                          ColorManager.white
                        ])),
              ),
            ],
          ),
          AppSize.s40.verticalSpace,
          ElevatedButton(
              onPressed: () {
                RouteService.serviceNavi.pop();
              },
              child: const Text("Done")),
        ],
      ),
    );
  }
}
