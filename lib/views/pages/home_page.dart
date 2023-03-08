import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/controllers/database_controller.dart';
import 'package:untitled1/models/product.dart';
import 'package:untitled1/views/widgets/list_item_home.dart';

import '../widgets/header_of_list.dart';

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
    final database = Provider.of<Database>(context);

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w900),
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
                HeaderOfList(
                  onTap: () {},
                  title: 'Sale',
                  description: 'Super Summer Sale!!',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 330,
                  child: StreamBuilder<List<Product>>(
                      stream: database.salesProductsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text('No Data Available!'),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (_, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: products[index]                            ,    isNew: true,
                  ),
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                const SizedBox(height: 8.0,)
                ,
                HeaderOfList(
                  onTap: () {},
                  title: 'New',
                  description: 'Super New Products!!',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 330,
                  child: StreamBuilder<List<Product>>(
                      stream: database.newProductsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text('No Data Available!'),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (_, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: products[index], isNew: true),
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
