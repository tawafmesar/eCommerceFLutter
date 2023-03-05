import 'package:flutter/material.dart';
import 'package:untitled1/models/product.dart';

class ListItemHome extends StatelessWidget {
  final Product product;

  const ListItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  product.imgUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.redAccent),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '${product.discountValue.toString()}%',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ) // discountValue
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            product.category,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 4.0,),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: '${product.price}\$',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey, decoration: TextDecoration.lineThrough),
              ),

              TextSpan(
                  text: ' '+'${product.price * (product.discountValue) / 100}\$'
                  ,style: Theme.of(context).textTheme.titleMedium!
              )
            ],
          )
          ),
        ],
      ),
    );
  }
}