import 'package:app_store/3-provider/state/provider_cart.dart';
import 'package:flutter/material.dart';

class ProviderBadge with ChangeNotifier {
  ProviderBadge({
    required this.providerCart,
  }) {
    providerCart.addListener(providerCartListener);
  }

  int counter = 0;
  final ProviderCart providerCart;

  void providerCartListener() {
    counter = providerCart.cartProductList.length;
    notifyListeners();
  }

  // 메모리 누수 방지
  @override
  void dispose() {
    providerCart.removeListener(providerCartListener);
    super.dispose();
  }
}
