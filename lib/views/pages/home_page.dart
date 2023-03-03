import 'package:flutter/material.dart';
import 'package:untitled1/models/product.dart';
import 'package:untitled1/utilities/assets.dart';
import 'package:untitled1/views/widgets/list_item_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  /// TODO: Temp
  ///
  Widget _buildHeaderOfList(BuildContext context,
      {required String title,
      VoidCallback? onTap,
      required String description}) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.w900, color: Colors.black),
            ),
            InkWell(
                onTap: onTap,
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.titleSmall,
                ))
          ],
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // Image.network(
              //   AppAssets.StringtopBannerHomePageAsset,
              //   width: double.infinity,
              //   height: size.height * 0.3,
              // ),
              Image(
                image: AssetImage("img/head.jpg"),
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.28,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                _buildHeaderOfList(context,
                    title: "Sale", description: "Super Summer Sale!!"),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: e),
                            ))
                        .toList(),
                  ),
                )
                ,
                _buildHeaderOfList(context,
                    title: "Sale", description: "Super Summer Sale!!"),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListItemHome(product: e),
                    ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
