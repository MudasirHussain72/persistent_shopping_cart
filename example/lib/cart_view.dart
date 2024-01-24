import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:persistent_shopping_cart_example/res/components/cart_tile_widget.dart';
import 'package:persistent_shopping_cart_example/empty_cart_msg_widget.dart';
import 'package:persistent_shopping_cart_example/res/components/checkout_button_widget.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Stack(
        children: [
          PersistentShoppingCart().showCartItems(
            cartTileWidget: ({required data}) => CartTileWidget(data: data),
            showEmptyCartMsgWidget: const EmptyCartMsgWidget(),
          ),
          Positioned(
            bottom: 0,
            child: PersistentShoppingCart().showTotalAmountWidget(
              cartTotalAmountWidgetBuilder: (totalAmount) =>
                  CheckoutButton(onPress: () {}, totalAmount: totalAmount),
            ),
          ),
        ],
      ),
    );
  }
}