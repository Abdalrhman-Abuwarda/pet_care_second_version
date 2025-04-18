part of pets_module;

class EditSpeciesPetSheet extends StatelessWidget {
  const EditSpeciesPetSheet({
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
                AppStrings.chooseYourPetSpecies,
                style: titleBold,
              )),
          AppSize.s30.verticalSpace,
         Row(
           children: [
             SelectionTypeCard(type: "Dog", iconPath: IconAssets.dogType, backgroundColor: ColorManager.secondaryLight, isSelected: false, onTap: () {},),
           ],
         ),
          AppSize.s70.verticalSpace,
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
