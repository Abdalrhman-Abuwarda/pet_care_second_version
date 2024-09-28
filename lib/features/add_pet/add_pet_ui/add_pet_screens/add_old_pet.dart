part of add_pet_module;

class AppOldPetScreen extends StatelessWidget implements PageWidget{
  AppOldPetScreen({Key? key}) : super(key: key);

  final AddPetController addPetController = Get.find();

  @override
  void onPressedFunction() {
    debugPrint('Page AppOldPetScreen action');
    addPetController.goNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add old");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("How old is your pet?" ,style: h3Bold,),
          AppSize.s25.verticalSpace,
          const GradientCircleLine(),
          AppSize.s16.verticalSpace,
          SizedBox(
            height: AppSize.s48.height,
            child: WheelChooser.integer(
              onValueChanged: (s) {

              },
              maxValue: 99,
              minValue: 1,
              initValue: 2,
              horizontal: true,
              itemSize: 70,
              selectTextStyle: h3Bold,
              unSelectTextStyle: h3BoldWithOpacity
            ),
          ),
          AppSize.s5.verticalSpace,
          Text("years",style: bodyRegular(color: ColorManager.primary)),
          AppSize.s16.verticalSpace,
          const GradientCircleLine(),
          AppSize.s16.verticalSpace,
          SizedBox(
            height: AppSize.s48.height,
            child: WheelChooser.integer(
              onValueChanged: (s) {},
              maxValue: 12,
              minValue: 1,
              initValue: 8,
              horizontal: true,
              itemSize: 70,
                selectTextStyle: h3Bold,
                unSelectTextStyle:h3BoldWithOpacity,
            ),
          ),
          AppSize.s5.verticalSpace,
          const Text("months",style: TextStyle(fontSize: 15),),
          AppSize.s16.verticalSpace,
          const GradientCircleLine(),
        ],
      ),
    );
  }
}
