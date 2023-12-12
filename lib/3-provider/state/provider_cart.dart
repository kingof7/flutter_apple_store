import 'package:app_store/common/product.dart';
import 'package:flutter/material.dart';

class ProviderCart with ChangeNotifier {
  /// 카트에 담긴 상품 목록
  List<Product> cartProductList = [];

  /// 상품 클릭
  void onProductPressed(Product product) {
    if (cartProductList.contains(product)) {
      // cartProductList.remove(product);
      cartProductList = cartProductList.where((cartProduct) {
        return cartProduct != product; // true를 반환하는 것만 cartProductList에 남는다.
      }).toList();
    } else {
      // cartProductList.add(product);
      cartProductList = [...cartProductList, product];
    }
    notifyListeners();
  }
}
