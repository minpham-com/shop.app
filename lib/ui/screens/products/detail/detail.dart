import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/data/entities/product.dart';
import 'package:store/ui/screens/base_page.dart';
import 'package:store/ui/screens/base_state.dart';
import 'package:store/ui/screens/mixin_widget.dart';
import 'package:store/ui/widgets/app_bar_widget.dart';
import 'package:store/ui/widgets/progress_indicator_widget.dart';

class ProductDetailScreen extends BasePage {
  const ProductDetailScreen({super.key});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends BaseState<ProductDetailScreen>
    with WidgetMixin<ProductDetailScreen> {
  late Product product;

  @override
  Widget build(BuildContext context) {
    final ProductBloc bloc = context.read<ProductBloc>();
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBarWidget(),
            body: _buildBody(context, bloc),
          );
        });
  }

  Widget _buildBody(BuildContext context, ProductBloc bloc) {
    return Stack(
      children: <Widget>[
        handleErrorMessage(context),
        _buildMainContent(context, bloc),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context, ProductBloc bloc) {
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
