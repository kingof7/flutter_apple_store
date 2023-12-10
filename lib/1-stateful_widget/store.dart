import 'package:app_store/common/product.dart';
import 'package:app_store/common/product_tile.dart';
import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
    required this.cartProductList, // 부모(HomePage)로 부터 전달 받음
    required this.onPressed, // 부모(HomePage)로 부터 전달 받음
  });

  /// 카트에 담긴 상품 목록
  final List<Product> cartProductList;

  /// 클릭 이벤트 함수 정의
  final void Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: cartProductList.contains(product), // true or false
            onPressed: onPressed, // 함수
          );
        },
      ),
    );
  }
}
