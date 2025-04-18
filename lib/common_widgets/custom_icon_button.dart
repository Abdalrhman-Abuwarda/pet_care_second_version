part of common_widgets;

class CustomIconButton extends StatelessWidget {
  final SizeConfig sizeConfig = sl<SizeConfig>();

  CustomIconButton({
    required this.onTap,
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  final String iconPath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorManager.primaryWithTransparent30)),
        height: AppSize.s44.height,
        width: sizeConfig.getScreenWidth(AppSize.s44),
        padding: const EdgeInsets.all(AppSize.s7),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}

class CustomIconButtonNoDecoration extends StatelessWidget {
  final SizeConfig sizeConfig = sl<SizeConfig>();

  CustomIconButtonNoDecoration({
    required this.onTap,
    required this.iconPath,
    this.svgColor,
    Key? key,
  }) : super(key: key);

  final String iconPath;
  final Color? svgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        color: svgColor,
      ),
    );
  }
}
