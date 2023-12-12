import 'package:app_store/3-provider/cart.dart';
import 'package:app_store/3-provider/state/provider_badge.dart';
import 'package:app_store/3-provider/state/provider_cart.dart';
import 'package:app_store/3-provider/store.dart';
import 'package:app_store/common/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderCart(), // 부모 위젯
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderBadge(
            providerCart: context.read(),
          ), // 부모 위젯
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            /// Store
            Store(),

            /// Cart
            Cart(),
          ],
        ),
        bottomNavigationBar: Selector<ProviderBadge, int>(
          selector: (context, providerBadge) => providerBadge.counter,
          builder: (context, counter, child) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: "$counter",
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
