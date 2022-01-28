import 'package:cart_app/data/product_data.dart';
import 'package:cart_app/frontend/providers/cart_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemScreen extends StatelessWidget {
  const CartItemScreen({Key? key, required this.cartItems, required this.onDelete}) : super(key: key);

  final List<int> cartItems;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: ListView.builder(
        itemCount: provider.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = provider.cartItems[index];
          final product = products.where((element) => element.id! == cartItem.productId).first;
          return ListTile(
            leading: Image.network(product.productImage!),
            title: Text(product.name!),
            subtitle: Text("${product.amount!}"),
            trailing: InkWell(
              onTap: () => provider.removeFromCart(product.id),
              child: const Icon(Icons.delete, color: Colors.red,)),
          );
        },
      ),
    );
  }
}
