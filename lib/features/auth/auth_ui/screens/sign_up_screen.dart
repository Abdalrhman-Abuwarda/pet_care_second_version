part of auth_module;

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.soft,
        body: Consumer<AuthProvider>(
          builder: (context, auth, child) => Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                  child: Form(
                    key: formKye,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSize.s100.verticalSpace,
                        Text(
                          "Welcome aboard!",
                          style: h2Regular(color: ColorManager.primary),
                        ),
                        Text(
                          "Please sign up to continue ",
                          style: bodyRegular(color: ColorManager.primary),
                        ),
                        AppSize.s40.verticalSpace,
                        CustomTextFormField(
                          hintText: AppStrings.name,
                          controller: nameController,
                          validator: (String? value) =>
                              value!.validateUserName(),
                          keyBoardType: TextInputType.name,
                        ),
                        AppSize.s20.verticalSpace,
                        CustomTextFormField(
                            keyBoardType: TextInputType.emailAddress,
                            hintText: AppStrings.eMail,
                            controller: emailController,
                            validator: (String? value) =>
                                value!.validateEmail()),
                        AppSize.s20.verticalSpace,
                        CustomTextFormField(
                            keyBoardType: TextInputType.phone,
                            hintText: AppStrings.phoneNumber,
                            controller: phoneController,
                            validator: (String? value) =>
                                value!.validatePhoneNumber()),
                        AppSize.s20.verticalSpace,
                        CustomTextFormField(
                          hintText: AppStrings.password,
                          controller: passwordController,
                          validator: (String? value) =>
                              value!.validatePassword(),
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                        const RVerticalSpace(height: AppSize.s80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: AppSize.s56.height,
                              width: AppSize.s56.width,
                              child: CircleAvatar(
                                backgroundColor: ColorManager.secondaryLight,
                                child: SvgPicture.asset(IconAssets.appleIcon),
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s56.height,
                              width: AppSize.s56.width,
                              child: CircleAvatar(
                                backgroundColor: ColorManager.secondaryLight,
                                child: SvgPicture.asset(IconAssets.googleIcon),
                              ),
                            ),
                            SizedBox(
                                width: 183.width,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (formKye.currentState!.validate()) {
                                        debugPrint("This is ok");
                                        auth.signup(
                                            email: emailController.text,
                                            name: nameController.text,
                                            password: passwordController.text,
                                            phoneNumber: phoneController.text);
                                      }
                                    },
                                    child: const Text(AppStrings.signUp, style: bodyBoldWhite,)))
                          ],
                        ),
                        const RVerticalSpace(height: AppSize.s40),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: auth.isLoading,
                child: Container(
                  height: ResponsiveUtil.screenHeight,
                  width: ResponsiveUtil.screenWidth,
                  color: ColorManager.primaryWithTransparent10,
                  child: const LoadingStatusWidget(
                    loadingStatus: LoadingStatusOption.loading,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
