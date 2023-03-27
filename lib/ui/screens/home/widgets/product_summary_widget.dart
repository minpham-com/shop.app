import 'package:flutter/material.dart';
import 'package:store/business/bloc/product/product_bloc.dart';
import 'package:store/data/entities/product.dart';
import 'package:store/ui/routes/routes.dart';

class ProductSummaryWidget extends StatelessWidget {
  const ProductSummaryWidget(
      {super.key, required this.product, required this.bloc});

  final Product product;

  final ProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    //TODO
    //final num amount = product.variants?[0].prices?[0].amount ?? 0;
    final num amount = product.id.isNotEmpty ? 1 : 0;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    Routes.productDetail,
                    arguments: {product: product, bloc: bloc}),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.account_circle_outlined),
                      title: Text(product.title),
                      subtitle: Text(
                        product.subTitle ?? '',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        product.thumbnail ?? "https://via.placeholder.com/300",
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object obj,
                                StackTrace? stackTrace) =>
                            Image.network("https://via.placeholder.com/300",
                                fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            product.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            maxLines: 2,
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 1.0),
                          child: Text("Price: \$${amount / 100}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal,
                              ))),
                    ),
                  ],
                ))));
  }
}
