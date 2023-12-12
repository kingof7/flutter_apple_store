import 'package:app_store/3-provider/state/provider_cart.dart';
import 'package:app_store/common/product.dart';
import 'package:app_store/common/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Product> cartProductList = context.select<ProviderCart, List<Product>>(
      (providerCart) => providerCart.cartProductList, // 변경되었을 때만 아래 return
    );

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
                  isInCart: true,
                  onPressed: context.read<ProviderCart>().onProductPressed,
                );
              },
            ),
    );
  }
}