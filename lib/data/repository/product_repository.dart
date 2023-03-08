import 'package:store/data/models/product.dart';
import 'package:store/data/repository/app_repository.dart';

class ProductRepository extends AppRepository<Product> {
  ProductRepository() : super("products");
}
