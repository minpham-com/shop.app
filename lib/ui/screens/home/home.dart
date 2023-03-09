import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/business/bloc/product/product_state.dart';
import 'package:store/business/bloc/theme/theme_bloc.dart';
import 'package:store/business/bloc/theme/theme_state.dart';
import 'package:store/services/constants/preferences.dart';
import 'package:store/ui/routes/routes.dart';
import 'package:store/ui/widgets/progress_indicator_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(create: (_) => ProductBloc()),
        ],
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Scaffold(
              appBar: _buildAppBar(context),
              body: _buildBody(context),
            );
          },
        ));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.home_tv_posts),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildLanguageButton(context),
      _buildThemeButton(context),
      _buildLogoutButton(context),
    ];
  }

  Widget _buildThemeButton(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final ThemeBloc bloc = BlocProvider.of<ThemeBloc>(context);
        return IconButton(
          onPressed: () {
            bloc.changeBrightnessToDark(!bloc.darkMode);
          },
          icon: Icon(
            bloc.darkMode ? Icons.brightness_5 : Icons.brightness_3,
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        SharedPreferences.getInstance().then((preference) {
          preference.setBool(Preferences.is_logged_in, false);
          Navigator.of(context).pushReplacementNamed(Routes.login);
        });
      },
      icon: const Icon(
        Icons.power_settings_new,
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        _buildLanguageDialog(context);
      },
      icon: const Icon(
        Icons.language,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
        return bloc.loading
            ? const CustomProgressIndicatorWidget()
            : Material(child: _buildListView(context, bloc));
      },
    );
  }

  Widget _buildListView(BuildContext context, ProductBloc bloc) {
    return bloc.items != null
        ? ListView.separated(
            itemCount: bloc.items!.length,
            separatorBuilder: (context, position) {
              return const Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(context, position, bloc);
            },
          )
        : Center(
            child: Text(
              AppLocalizations.of(context)!.home_tv_no_post_found,
            ),
          );
  }

  Widget _buildListItem(BuildContext context, int position, ProductBloc bloc) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.cloud_circle),
      title: Text(
        '${bloc.items?[position].title}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        '${bloc.items?[position].body}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }

  Widget _handleErrorMessage() {
    return const SizedBox.shrink();
  }

  // ignore: unused_element
  SizedBox _showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration.zero, () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context)!.home_tv_error,
        ).show(context);
      }
    });

    return const SizedBox.shrink();
  }

  void _buildLanguageDialog(BuildContext context) {
    _showDialog<String>(
        context: context,
        child: Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What do you want to remember?'),
                  ),
                  SizedBox(
                    width: 320.0,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }
}
