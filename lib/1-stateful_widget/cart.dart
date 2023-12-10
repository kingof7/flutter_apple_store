import 'package:app_store/common/product.dart';
import 'package:app_store/common/product_tile.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required this.cartProductList,
    required this.onPressed,
  });

  /// 카트에 담긴 상품 목록
  final List<Product> cartProductList;

  /// 클릭 이벤트
  final void Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cartProductList.isEmpty

          /// Empty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )

          /// Not Empty
          : ListView.builder(
              itemCount: cartProductList.length,
              itemBuilder: (context, index) {
                Product product = cartProductList[index];
                return ProductTile(
                  product: product,
                  isInCart: true, // 부모로부터 받은 카트프로덕트리스트를 그대로 보여주기 때문에 true
                  onPressed: onPressed, // 해당 상품을 눌렀을 때, 부모에게 전달
                );
              },
            ),
    );
  }
}
