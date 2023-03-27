import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:store/ui/screens/base_page.dart';
import 'package:store/ui/screens/base_state.dart';

mixin WidgetMixin<Page extends BasePage> on BaseState<Page> {
  SizedBox showSuccessMessage(
      BuildContext context, String title, String message) {
    Future.delayed(Duration.zero, () {
      if (message.isNotEmpty) {
        FlushbarHelper.createSuccess(
          message: message,
          title: title,
        ).show(context);
      }
    });

    return const SizedBox.shrink();
  }

  SizedBox showErrorMessage(
      BuildContext context, String title, String message) {
    Future.delayed(Duration.zero, () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: title,
        ).show(context);
      }
    });

    return const SizedBox.shrink();
  }

  Widget handleErrorMessage(BuildContext context) {
    return const SizedBox.shrink();
  }

  Future<void> navigateTo(BuildContext context, String routeName) async {
    Navigator.of(context).pushReplacementNamed(routeName);
  }
}
