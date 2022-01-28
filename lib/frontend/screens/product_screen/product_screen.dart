import 'package:cart_app/backend/models/cart_item_model.dart';
import 'package:cart_app/data/product_data.dart';
import 'package:cart_app/frontend/providers/cart_item_provider.dart';
import 'package:cart_app/frontend/screens/cart_item_screen/cart_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  List<int> cartItems = [];
  //
  // void deleteFromCart(int id) {
  //   cartItems.remove(id);
  //   setState(() {
  //     cartItems = cartItems;
  //   });
  // }
  //
  // void addToCart(int id) {
  //   cartItems.add(id);
  //   setState(() {
  //     cartItems = cartItems;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartItemProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartItemScreen(
                    cartItems: cartItems,
                    onDelete: () => cartProvider.removeFromCart(cartItems),
                  ),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Consumer<CartItemProvider>(
                  builder: (context, value, child) {
                    return Text("Cart Items: ${value.cartItems.length}", style: TextStyle(
                      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold
                    ),);
                  },
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.productImage!, height: 50, fit: BoxFit.cover,),
                const SizedBox(height: 10,),
                Text(product.name!),
                const SizedBox(height: 5,),
                Text("#${product.amount!}"),
                const SizedBox(height: 5,),

                Consumer<CartItemProvider>(
                  builder: (context, value, child) {
                    return TextButton(
                      child: Text(value.isInCart(product.id!) ? 'Remove From Cart' : 'Add To Cart', style: TextStyle(
                          color: value.isInCart(product.id!) ? Colors.red : Colors.blue
                      ),),
                      onPressed: () {
                        // deleteFromCart(product.id!);
                        if (value.isInCart(product.id!)) {
                          value.removeFromCart(product.id);
                        } else {
                          value.addToCart(CartItemModel(
                            id: 1, productId: product.id!, qunatity: 1
                          ));
                        }
                      },
                    );
                  },
                ),

                // check if this item is in the cart
                // if ((product.id!))
                //   ...[
                //
                //   ],
                // if (!cartItems.contains(product.id!))
                //   ...[
                //     TextButton(
                //       child: Text('Add To Cart'),
                //       onPressed: () {
                //         // addToCart(product.id!);
                //       },
                //     )
                //   ],
              ],
            );
          },
        ),
      ),
    );
  }
}
