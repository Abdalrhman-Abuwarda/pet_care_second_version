part of common_widgets;

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.suffixPressed,
    this.onChange,
    this.focusNode,
    this.controller,
    required this.validator,
    this.inputFormatters,
    this.keyBoardType,
    this.focus,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final void Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? focus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          customShadow(),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        style: bodyRegular(color: ColorManager.primary),
        textInputAction: textInputAction,
        onFieldSubmitted: focus,
        focusNode: focusNode,
        onChanged: onChange,
        inputFormatters: inputFormatters,
        keyboardType: keyBoardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                  ),
                  onPressed: suffixPressed)
              : null,
        ),
      ),
    );
  }
}
