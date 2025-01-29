part of auth_module;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode emailFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("LoginScreen build method called");
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: AppPadding.p24.paddingHorizontal,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSize.s115.verticalSpace,
                  Text(
                    "Welcome back",
                    style: h2Regular(color: ColorManager.primary),
                  ),
                  const Text(
                    "pet lover...",
                    style: h2Bold,
                  ),
                  AppSize.s35.verticalSpace,
                  CustomTextFormField(
                    hintText: AppStrings.eMail,
                    controller: emailController,
                    validator: (String? value) => value!.validateEmail(),
                    keyBoardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: emailFocus,
                    focus: (_) =>
                        FocusScope.of(context).requestFocus(passwordFocus),
                  ),
                  AppSize.s20.verticalSpace,
                  Consumer<BaseProvider>(
                    builder: (_, base, __) => CustomTextFormField(
                      hintText: AppStrings.password,
                      controller: passwordController,
                      validator: (String? value) => value!.validatePassword(),
                      keyBoardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      focusNode: passwordFocus,
                      focus: (_) => _attemptLogin(auth),
                      suffixIcon: base.isHiddenLoginPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      obscureText: base.isHiddenLoginPassword,
                      suffixPressed: () {
                        base.visibilityLoginPassword();
                      },
                    ),
                  ),
                  AppSize.s10.verticalSpace,
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            RouteService.serviceNavi.pushNamedWidget(
                                RouteNames.forgetPasswordScreen);
                          },
                          child: Text(
                            AppStrings.forgotPassword,
                            style: bodyRegular(color: ColorManager.secondary),
                          ))),
                  const Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLoginButton(
                        icon: IconAssets.appleIcon,
                        onPressed: () {
                          // Handle Apple login
                        },
                      ),
                      SocialLoginButton(
                        icon: IconAssets.googleIcon,
                        onPressed: () {
                          // Handle Google login
                        },
                      ),
                      SizedBox(
                          width: 183.width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  auth.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: const Text(
                                AppStrings.signIn,
                                style: bodyBoldWhite,
                              )))
                    ],
                  ),
                  AppSize.s40.verticalSpace,
                ],
              ),
            ),
          ),
          Consumer<AuthProvider>(
            builder: (_, authState, __) => Visibility(
              visible: authState.isLoading,
              child: Container(
                height: ResponsiveUtil.screenHeight,
                width: ResponsiveUtil.screenWidth,
                color: ColorManager.primaryWithTransparent10,
                child: const LoadingStatusWidget(
                  loadingStatus: LoadingStatusOption.loading,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _attemptLogin(AuthProvider auth) {
    if (formKey.currentState!.validate()) {
      auth.login(
          email: emailController.text, password: passwordController.text);
    }
  }
}

class SocialLoginButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s56.height,
      width: AppSize.s56.width,
      child: CircleAvatar(
        backgroundColor: ColorManager.secondaryLight,
        child: IconButton(
          icon: SvgPicture.asset(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
