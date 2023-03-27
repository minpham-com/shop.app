import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/business/bloc/product/product_state.dart';
import 'package:store/ui/screens/base_page.dart';
import 'package:store/ui/screens/base_state.dart';
import 'package:store/ui/screens/home/widgets/product_summary_widget.dart';
import 'package:store/ui/screens/mixin_widget.dart';
import 'package:store/ui/widgets/app_bar_widget.dart';
import 'package:store/ui/widgets/progress_indicator_widget.dart';

class HomeScreen extends BasePage {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen>
    with WidgetMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(create: (_) => ProductBloc()..getItems()),
        ],
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBarWidget(),
              body: _buildBody(context),
            );
          },
        ));
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        handleErrorMessage(context),
        _buildMainContent(context),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final bloc = context.watch<ProductBloc>();
    return bloc.loading
        ? const CustomProgressIndicatorWidget()
        : _buildListView(context, bloc);
  }

  Widget _buildListView(BuildContext context, ProductBloc bloc) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.8,
      children: bloc.items.isNotEmpty
          ? List.generate(bloc.items.length, (position) {
              return _buildListItem(context, position, bloc);
            })
          : [
              Center(
                child: Text(
                  AppLocalizations.of(context)!.home_tv_no_post_found,
                ),
              )
            ],
    );
  }

  Widget _buildListItem(BuildContext context, int position, ProductBloc bloc) {
    final product = bloc.items.elementAt(position);
    return product.id.isNotEmpty
        ? ProductSummaryWidget(product: product, bloc: bloc)
        : Container();
  }
}
