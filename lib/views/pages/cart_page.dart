import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/add_to_cart_model.dart';
import 'package:untitled1/views/widgets/cart_list_item.dart';

import '../../controllers/database_controller.dart';
import '../../utilities/routes.dart';
import '../widgets/main_buttom.dart';
import '../widgets/order_summary_component.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalAmount = 0;


  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

 final myProducts = await Provider.of<Database>(context, listen: false)
        .myProductsCart()
        .first;
    myProducts.forEach((element) {
      setState(() {
        totalAmount += element.price;
      });
    });
    }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return SafeArea(
      child: StreamBuilder<List<AddToCartModel>>(
          stream: database.myProductsCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final cartItems = snapshot.data;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'My Cart',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 16.0),
                      if (cartItems == null || cartItems.isEmpty)
                        Center(
                          child: Text(
                            'No Data Available!',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      if (cartItems != null && cartItems.isNotEmpty)
                        ListView.builder(
                          itemCount: cartItems.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int i) {
                            final cartItem = cartItems[i];
                            return CartListItem(
                              cartItem: cartItem,
                            );
                          },
                        ),
                      const SizedBox(height: 24.0),
                      
                       OrderSummaryComponent(
                        title: 'Total Amount',
                        value: totalAmount.toString(),
                       ),
                      const SizedBox(height: 32.0),
                      MainButton(
                        text: 'Checkout',
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(
                          AppRoutes.checkoutPageRoute,
                          arguments: database,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
