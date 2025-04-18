part of profile_module;

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);

  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
      ),
      body: Column(
        children: [
          AppSize.s32.verticalSpace,
          Expanded(
            child: Container(
              padding: AppPadding.p32.paddingVertical,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: AppSize.s30.circularRadius,
                  boxShadow: [customShadow()]),
              child: Padding(
                padding: AppPadding.p24.paddingHorizontal,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AddressCard(
                        deleteFunction: deleteFunction,
                        title: "Home",
                        iconPath: IconAssets.homeAddress,
                        addressDetails:
                            "5616 Artesian Dr Derwood, Maryland(MD), 20855",
                        color: ColorManager.secondaryLight,
                      ),
                      AddressCard(
                        deleteFunction: deleteFunction,
                        title: "Work",
                        iconPath: IconAssets.workAddress,
                        addressDetails:
                            "StreamSea DK 8206, Frederick(MD), 21701",
                        color: ColorManager.greenLight,
                      ),
                      AddressCard(
                        deleteFunction: deleteFunction,
                        title: "Other",
                        iconPath: IconAssets.location,
                        addressDetails:
                            "2023 Newspaper Street, Maryland(MD), 42300",
                        color: ColorManager.quaternary,
                      ),
                      // const Spacer(),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("+ Add new address")),
                      // AppSize.s20.addVerticalSpace
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
