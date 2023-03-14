
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tawaf',
                style: Theme.of(context).textTheme.titleMedium,),
                InkWell(
                 onTap: (){},
                 child: Text('Change'
                         , style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.redAccent),)
                )
              ],
            ),
         const SizedBox(height: 8.0),
          Text(
            '13 Mossaddak Street',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Dokki, Giza, Egypt',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ]
          ),
      ) ,
    );
  }
}