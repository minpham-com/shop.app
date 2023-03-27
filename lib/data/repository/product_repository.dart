import 'package:store/data/entities/product.dart';
import 'package:store/data/repository/app_repository.dart';

class ProductRepository extends AppRepository<Product> {
  ProductRepository() : super("products");

  static final ProductRepository _instance = ProductRepository();

  static ProductRepository getInstance() {
    return _instance;
  }
}
