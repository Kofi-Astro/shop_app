import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItemBuilder extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItemBuilder(
      {this.id, this.productId, this.price, this.title, this.quantity});

  @override
  build(BuildContext context) {
    return Dismissible(
        key: ValueKey(id),
        onDismissed: (direction) {
          Provider.of<Cart>(context, listen: false).deleteItem(productId);
        },
        direction: DismissDirection.endToStart,
        background: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: Icon(
              Icons.delete,
              size: 40,
              color: Colors.white,
            ),
            padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4)),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(child: Text('\$${price.toStringAsFixed(2)}')),
              ),
              title: Text(title),
              subtitle: Text('\$${(price * quantity)}'),
              trailing: Text('$quantity x'),
            ),
          ),
        ));
  }
}
