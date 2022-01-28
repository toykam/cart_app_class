import 'package:cart_app/backend/models/cart_item_model.dart';
import 'package:flutter/cupertino.dart';

class CartItemProvider extends ChangeNotifier {

  List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;


  void addToCart(CartItemModel cart) {
    _cartItems.add(cart);
    notifyListeners();
  }

  void removeFromCart(id) {
    _cartItems = _cartItems.where((element) => element.productId != id).toList();
    notifyListeners();
  }

  bool isInCart(int productId) {
    return _cartItems.where((cartItem) => cartItem.productId == productId).isNotEmpty;
  }

}