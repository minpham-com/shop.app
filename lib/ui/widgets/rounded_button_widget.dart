import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedButtonWidget({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    this.textColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: buttonColor,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style:
            Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor),
      ),
    );
  }
}
