import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Color buttonDisableColor;
  final Color textDisableColor;
  final VoidCallback onPressed;
  final bool disabled;
  final bool loading;

  const RoundedButtonWidget(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      this.buttonDisableColor = Colors.grey,
      this.textDisableColor = Colors.white,
      this.textColor = Colors.white,
      required this.onPressed,
      this.disabled = false,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: disabled
          ? TextButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: buttonDisableColor,
              padding: EdgeInsets.zero,
            )
          : TextButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: buttonColor,
              padding: EdgeInsets.zero,
            ),
      onPressed: onPressed,
      child: loading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.5,
              ))
          : Text(
              buttonText,
              style: disabled
                  ? Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: textDisableColor)
                  : Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: textColor),
            ),
    );
  }
}
