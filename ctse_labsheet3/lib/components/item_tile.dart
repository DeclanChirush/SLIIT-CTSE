import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import '../providers/cart_provider.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool canAddToCart = !Provider.of<CartProvider>(context).isItemAdded(item);
    double price = item.price;

    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(child: Image.network(item.image)),
          Text(item.name, style: Theme.of(context).textTheme.headline6),
          Text(price.toStringAsFixed(2),
              style: Theme.of(context).textTheme.caption),
          IconButton(
            onPressed: canAddToCart
                ? () {
              Provider.of<CartProvider>(
                context,
                listen: false,
              ).addItem(item);
            }
                : null,
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
    );
  }
}
