import 'package:uiandtimbuapiimpl/Model/model.dart';

class CartFunction {
  CartFunction._sharedInstance();
  static final CartFunction _shared = CartFunction._sharedInstance();
  factory CartFunction() => _shared;

  final List<ProductModelClass> products = [];

  int get productLength => products.length;

  ProductModelClass? product({required int index}) =>
      products.length > index ? products[index] : null;

  void addToCart({required ProductModelClass product}) {
    products.add(product);
  }

  void deleteFromCart({required ProductModelClass product}) {
    products.remove(product);
  }

  void totalPrice({required ProductModelClass product}) {
    product.currentPrice[8] = [];
  }
}
