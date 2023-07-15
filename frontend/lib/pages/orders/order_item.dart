import 'package:fixfinder/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  final void Function(String?) onStateChanged;
  final void Function() onDelete;
  const OrderItem(
      {super.key,
      required this.order,
      required this.onStateChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Text('Amount', style: Theme.of(context).textTheme.bodySmall),
            Text(order.amount.toString(),
                style: Theme.of(context).textTheme.headlineSmall),
            Text(DateFormat.yMMMMd().format(DateTime.parse(order.createdAt!)),
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        DropdownButton(
            value: order.state,
            items: const [
              DropdownMenuItem(value: 'pending', child: Text('Pending')),
              DropdownMenuItem(value: 'accepted', child: Text('Accepted')),
              DropdownMenuItem(value: 'rejected', child: Text('Rejected')),
              DropdownMenuItem(value: 'completed', child: Text('Completed')),
            ],
            onChanged: onStateChanged),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_forever),
          color: Theme.of(context).colorScheme.error,
        )
      ]),
    );
  }
}
