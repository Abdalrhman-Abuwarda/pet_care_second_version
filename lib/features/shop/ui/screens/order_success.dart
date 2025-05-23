part of shop_screens;

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);
//PR
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text("Keep browsing"),
        onPressed: () {
          RouteService.serviceNavi
              .pushNamedAndRemoveUtils(RouteNames.mainScreenApp);
        },
      ),
      body: Column(
        children: [
          174.verticalSpace,
          Padding(
            padding: 64.paddingHorizontal,
            child: Lottie.asset(AnimationsAssets.success,
                width: 243, height: 200, fit: BoxFit.fitWidth),
          ),
          34.verticalSpace,
          const Text(
            AppStrings.orderPlacedSuccessfully,
            style: h3Bold,
          ),
          10.verticalSpace,
          Padding(
            padding: 30.paddingHorizontal,
            child: const Text(
              AppStrings.orderPlacedSuccessfullySub,
              style: supTitleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
//
///TODO:
