part of profile_module;

class PaymentMethodsScreen extends StatelessWidget {
  PaymentMethodsScreen({Key? key}) : super(key: key);
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      iconPath: IconAssets.mastercard,
      supTitle: "**** 1994",
      title: "Ace Mastercard",
    ),
    PaymentMethod(
      iconPath: IconAssets.visa,
      supTitle: "**** 1994",
      title: "My Visa Card",
    ),
    PaymentMethod(
      iconPath: IconAssets.paypal,
      supTitle: "acevent@mail.com",
      title: "My lovely Paypal",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          onPressed: () {
            RouteService.serviceNavi.pushNamedWidget(RouteNames.addNewPaymentMethodScreen);
          },
          child: const Text("+ Add new method")),
      appBar: AppBar(
        title: const Text("Payment methods"),

      ),
      body: Column(
        children: [
          AppSize.s32.verticalSpace,
          Expanded(
            child: Container(
              padding: AppPadding.p24.paddingAll,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: AppSize.s30.circularRadius,
                boxShadow: [customShadow()],
              ),
              child: ListView.builder(
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    return index < paymentMethods.length
                        ? PaymentCard(
                            iconPath: paymentMethods[index].iconPath,
                            supTitle: paymentMethods[index].supTitle,
                            title: paymentMethods[index].title,
                          )
                        : Column(
                            children: [
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("+ Add new method"),
                              ),
                              AppSize.s35.verticalSpace,
                            ],
                          );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentMethod {
  PaymentMethod({
    required this.iconPath,
    required this.supTitle,
    required this.title,
  });

  final String iconPath;
  final String supTitle;
  final String title;
}
