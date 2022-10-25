import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.validator,
    required this.name,
    required this.hintText,
    required this.textInputAction,
    this.maxLines = 1,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputFormatter,
    this.obscureText = false,
    this.focusNode,
    this.suffix,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.prefixIcon,
  }) : super(key: key);

  final int maxLines;
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? name;
  final bool autofocus;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? textInputFormatter;
  final String hintText;
  final bool obscureText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Function(String?)? onFieldSubmitted;
  final FocusNode? focusNode;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        maxLines: maxLines,
        autofocus: autofocus,
        textInputAction: TextInputAction.next,
        controller: name,
        textCapitalization: textCapitalization,
        validator: validator,
        inputFormatters: textInputFormatter,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),
          // label: Text(label, style: Theme.of(context).textTheme.titleMedium),
          label: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  child: Text(
                    "$label ",
                  ),
                ),
              ],
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
