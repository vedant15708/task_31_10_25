import 'package:flutter/material.dart';

/// Global Notifier for the shopping cart state (ProductID -> Quantity).
final cartNotifier = ValueNotifier<Map<String, int>>({});

/// Adds one item of [productId] to the cart.
void addItemToCart(String productId) {
  final newCart = Map<String, int>.from(cartNotifier.value);
  newCart[productId] = (newCart[productId] ?? 0) + 1;
  cartNotifier.value = newCart;
}

/// Removes one item of [productId] from the cart.
void removeItemFromCart(String productId) {
  final newCart = Map<String, int>.from(cartNotifier.value);
  int currentQuantity = newCart[productId] ?? 0;

  if (currentQuantity > 1) {
    newCart[productId] = currentQuantity - 1;
  } else {
    newCart.remove(productId);
  }

  cartNotifier.value = newCart;
}

/// Gets the total number of items in the cart.
int getCartTotalItemCount(Map<String, int> cart) {
  return cart.values.fold(0, (sum, count) => sum + count);
}