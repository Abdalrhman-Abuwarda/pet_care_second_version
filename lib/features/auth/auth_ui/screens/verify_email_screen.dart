part of auth_module;
class VerifyEmailScreen extends StatelessWidget {
   VerifyEmailScreen({Key? key}) : super(key: key);
  final TextEditingController optController = TextEditingController();
  final GlobalKey<FormState> formKye = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text(AppStrings.verify),
        leading: IconButton(
          onPressed: () {
            RouteService.serviceNavi.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.width),
        child: Form(
          key: formKye,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RVerticalSpace(height: AppSize.s45),
              const Text("Enter the code we just sent" , style: supTitleRegular),
              const RVerticalSpace(height: AppSize.s28),
              Pinput(
                autofocus: true,
                // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                validator: (String? value) => value!.validateCode(),
                controller: optController,
                obscureText: false,
                length: 5,
                focusedPinTheme: PinTheme(
                    width: AppSize.s56.width,
                    height: AppSize.s56.height,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorManager.secondary, width: 2),
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.gray.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),// changes position of shadow
                        ),
                      ],
                    )),
                defaultPinTheme: PinTheme(
                    // margin: EdgeInsetsDirectional.only(end: AppMargin.m12.w),
                    width: AppSize.s56.width,
                    height: AppSize.s56.height,
                    textStyle: bodyBoldPrimary,
                    // margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.gray.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),

                      ],
                    )),
              ),
              const RVerticalSpace(height: AppSize.s28),
              Text("00:59" , style: bodyRegular(color: ColorManager.secondary),),
              const RVerticalSpace(height: AppSize.s8),
              TextButton(onPressed: (){}, child: Text('Resend code', style:  bodyRegular(color: ColorManager.gray),)),
              const Spacer(),
              ElevatedButton(onPressed: (){
                if(formKye.currentState!.validate()){
                  debugPrint("This is ok");
                  RouteService.serviceNavi.pushNamedWidget(RouteNames.resetPasswordScreen);
                }
              }, child: const Text(AppStrings.next)),
              const Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
