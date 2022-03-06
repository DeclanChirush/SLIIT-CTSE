import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import '../providers/cart_provider.dart';

class Shop extends StatelessWidget {

  static const String routeName = '/shop';

  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Item> items = Provider.of<CartProvider>(context).item;
    double totalPrice = Provider.of<CartProvider>(context).total;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Item item = items.elementAt(index);
                  double price = item.price;
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<CartProvider>(
                            context,
                            listen: false,
                          ).removeItem(item);
                        },
                      ),
                    ),
                  );
                }),
          ),
          Flexible(
            flex: 1,
            child: Text(
              totalPrice.toStringAsFixed(2),
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ),
        ],
      ),
    );
  }
}
