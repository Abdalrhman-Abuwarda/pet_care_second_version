part of profile_module;

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();
  final profileData = sl<StorageService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text(AppStrings.profile),
        actions: [
          CustomIconButton(
            onTap: () {
              RouteService.serviceNavi
                  .pushNamedWidget(RouteNames.editProfileScreen);
            },
            iconPath: IconAssets.edit,
          ),
          const RHorizontalSpace(width: AppSize.s20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getScreenWidth(AppSize.s20)),
          child: Column(
            children: [
              const RVerticalSpace(height: AppSize.s30),
              Container(
                width: double.infinity,
                padding: AppSize.s24.paddingAll,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: AppSize.s16.circularRadius,
                    boxShadow: [customShadow()]),
                child: Column(
                  children: [
                    ProfileTile(
                      onTap: () {},
                      iconPath: IconAssets.unSelectedProfile,
                      title: profileData.getUser().name.toCapitalized(),
                      iconColor: ColorManager.primaryWithTransparent10,
                    ),
                    Row(
                      children: [
                        AppSize.s20.horizontalSpace,
                        SvgPicture.asset(IconAssets.email),
                        AppSize.s24.horizontalSpace,
                        Text(
                          profileData.getUser().email,
                          style: bodyRegular(color: ColorManager.primary),
                        )
                      ],
                    ),
                    AppSize.s16.verticalSpace,
                    Row(
                      children: [
                        AppSize.s20.horizontalSpace,
                        SvgPicture.asset(IconAssets.mobile),
                        AppSize.s24.horizontalSpace,
                        Text(
                          profileData.getUser().phoneNumber,
                          style: bodyRegular(color: ColorManager.primary),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              AppSize.s24.verticalSpace,
              Container(
                padding: AppSize.s24.paddingAll,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: AppSize.s16.circularRadius,
                    boxShadow: [customShadow()]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileTile(
                      onTap: () {
                        RouteService.serviceNavi.pushNamedWidget(
                            RouteNames.paymentMethodScreen);
                      },
                      iconPath: IconAssets.payment,
                      title: AppStrings.paymentMethod,
                      iconColor: ColorManager.secondaryLight,
                    ),
                    ProfileTile(
                      onTap: () {
                        RouteService.serviceNavi
                            .pushNamedWidget(RouteNames.addressScreen);
                      },
                      iconPath: IconAssets.unSelectedHome,
                      title: AppStrings.addresses,
                      iconColor: ColorManager.tertiary,
                    ),
                    ProfileTile(
                      onTap: () {
                        RouteService.serviceNavi
                            .pushNamedWidget(RouteNames.ordersScreen);
                      },
                      iconPath: IconAssets.unSelectedCart,
                      title: AppStrings.orders,
                      iconColor: ColorManager.quaternary,
                    ),
                    ProfileTile(
                      onTap: () {
                        RouteService.serviceNavi
                            .pushNamedWidget(RouteNames.appointmentsScreen);
                      },
                      iconPath: IconAssets.calendar,
                      title: AppStrings.apointments,
                      iconColor: ColorManager.greenLight,
                    ),
                    AppSize.s16.verticalSpace,
                    TextButton(
                        onPressed: () {
                          RouteService.serviceNavi.pushNamedAndRemoveUtils(
                              RouteNames.mainAuthScreen);
                          sl<StorageService>().removeUser();
                        },
                        child: Text(
                          AppStrings.logOut,
                          style: bodyRegular(color: ColorManager.error),
                        ))
                  ],
                ),
              ),
              AppSize.s16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
