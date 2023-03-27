import 'package:flutter/material.dart';
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/data/entities/product.dart';
import 'package:store/ui/screens/base_page.dart';
import 'package:store/ui/screens/base_state.dart';
import 'package:store/ui/screens/mixin_widget.dart';
import 'package:store/ui/widgets/app_bar_widget.dart';
import 'package:store/ui/widgets/progress_indicator_widget.dart';

class ProductListScreen extends BasePage {
  const ProductListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends BaseState<ProductListScreen>
    with WidgetMixin<ProductListScreen> {
  late Product product;
  late ProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: _buildBody(context),
    );
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
    return bloc.loading
        ? const CustomProgressIndicatorWidget()
        : Material(child: _buildListView(context, bloc));
  }

  Widget _buildListView(BuildContext context, ProductBloc bloc) {
    return SizedBox(child: _buildItem(context));
  }

  Widget _buildItem(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [Text(product.title)],
        ),
        Column(
          children: [Text(product.description ?? "")],
        )
      ],
    );
  }
}
