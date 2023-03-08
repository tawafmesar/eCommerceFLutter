import 'package:flutter/material.dart';
import 'package:untitled1/models/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:untitled1/utilities/routes.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  final bool isNew;
  final VoidCallback? addToFavorites;
  bool isFavorite;

  ListItemHome({
    Key? key,
    required this.product,
    required this.isNew,
    this.addToFavorites,
    this.isFavorite = false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetailsRoute,
        arguments: product,
      ),
      child: DecoratedBox(
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
                          color: isNew ? Colors.black : Colors.redAccent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            isNew
                                ? 'NEW'
                                : '${product.discountValue.toString()}%',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                          
                              .copyWith(color: Colors.white),
                        
                          ),
                        ),
                      ),
                    ),
                  ),
                ) , // discountValue
                              Positioned(
                left: size.width * 0.35,
                bottom: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25.0,
                    child: InkWell(
                      onTap: addToFavorites,
                      child: Icon(
                        Icons.favorite,
                        size: 25.0,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            RatingBarIndicator(
              itemSize: 25.0,
              rating:  product.rate?.toDouble() ?? 0.0,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              direction: Axis.horizontal,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),


            )
        
            ,const SizedBox(height: 8.0),

            Text(
              product.category,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            // Text.rich(TextSpan(
            //   children: [
            //     TextSpan(
            //       text: '${product.price}\$',
            //       style: Theme.of(context).textTheme.titleMedium!.copyWith(
            //           color: Colors.grey,
            //           decoration: TextDecoration.lineThrough),
            //     ),
            //     TextSpan(
            //         text: ' ' +
            //             '${product.price * (product.discountValue) / 100}\$',
            //         style: Theme.of(context).textTheme.titleMedium!)
            //   ],
            // )),
                      isNew
                ? Text(
                    '${product.price}\$',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.grey,
                        ),
                  )
                : Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${product.price}\$  ',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        ),
                        TextSpan(
                          text:
                              '  ${product.price * (product.discountValue!) / 100}\$',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
