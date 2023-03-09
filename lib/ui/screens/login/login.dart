import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/business/bloc/form/login/login_bloc.dart';
import 'package:store/business/bloc/form/login/login_state.dart';
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/env/assets.dart';
import 'package:store/services/constants/preferences.dart';
import 'package:store/ui/routes/routes.dart';
import 'package:store/ui/widgets/app_icon_widget.dart';
import 'package:store/ui/widgets/empty_app_bar_widget.dart';
import 'package:store/ui/widgets/rounded_button_widget.dart';
import 'package:store/ui/widgets/textfield_widget.dart';
import 'package:store/utils/device/device_utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: EmptyAppBar(),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody(BuildContext context, LoginState state) {
    return Material(
      child: Stack(
        children: <Widget>[
          if (MediaQuery.of(context).orientation == Orientation.landscape)
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildLeftSide(context, state),
                ),
                Expanded(
                  child: _buildRightSide(context, state),
                ),
              ],
            )
          else
            Center(child: _buildRightSide(context, state)),
        ],
      ),
    );
  }

  Widget _buildLeftSide(BuildContext context, LoginState state) {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide(BuildContext context, LoginState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            const SizedBox(height: 24.0),
            _buildUserIdField(context, state),
            _buildPasswordField(context, state),
            _buildForgotPasswordButton(context, state),
            _buildSignInButton(context, state)
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField(BuildContext context, LoginState state) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();
        return TextFieldWidget(
          hint: AppLocalizations.of(context)!.login_et_user_email,
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: context.read<ThemeBloc>().darkMode
              ? Colors.white70
              : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          onChanged: (dynamic value) {
            bloc.setEmail(_userEmailController.text);
          },
          onFieldSubmitted: (dynamic value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: AppLocalizations.of(context)!.email_invalid,
        );
      },
    );
  }

  Widget _buildPasswordField(BuildContext context, LoginState state) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<LoginBloc>(context);
        final theme = BlocProvider.of<ThemeBloc>(context);
        return TextFieldWidget(
          hint: AppLocalizations.of(context)!.login_et_user_password,
          isObscure: true,
          padding: const EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: theme.darkMode ? Colors.white70 : Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: AppLocalizations.of(context)!.password_invalid,
          onChanged: (dynamic value) {
            bloc.setPassword(_passwordController.text);
          },
        );
      },
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context, LoginState state) {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          // ignore: use_named_constants
          padding: const EdgeInsets.all(0),
        ),
        child: Text(
          AppLocalizations.of(context)!.login_btn_forgot_password,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.orangeAccent),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context, LoginState state) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      final bloc = BlocProvider.of<LoginBloc>(context);
      return RoundedButtonWidget(
        buttonText: AppLocalizations.of(context)!.login_btn_sign_in,
        buttonColor: Colors.orangeAccent,
        onPressed: () async {
          if (bloc.canLogin) {
            DeviceUtils.hideKeyboard(context);
            bloc.login();
          } else {
            _showErrorMessage(context, state,
                AppLocalizations.of(context)!.please_fill_all_fields);
          }
        },
      );
    });
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    // ignore: use_named_constants
    Future.delayed(const Duration(), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  SizedBox _showErrorMessage(
      BuildContext context, LoginState state, String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context)!.home_tv_error,
          ).show(context);
        }
      });
    }

    return const SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
