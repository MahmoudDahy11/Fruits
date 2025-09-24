import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/cart_entity.dart';
import '../cubits/cart/cart_cubit.dart';
import '../cubits/cart/cart_state.dart';
import 'widgets/cart_item_details.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/number_of_product.dart';
import '../../../../core/widgets/custom_botton.dart';

/*
 * CartView class
 * StatefulWidget that represents the shopping cart screen
 * Uses BlocBuilder to manage and display the state of the cart
 * Displays a list of cart items, total price, and a checkout button
 * Handles loading and error states for the cart
 */

class CartView extends StatefulWidget {
  const CartView({super.key});
  static const String id = 'Cart_view';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            const SizedBox(height: 20),

            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return NumberOfProduct(count: state.items.length);
                }
                return const NumberOfProduct(count: 0);
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CartLoaded) {
                    if (state.items.isEmpty) {
                      return const Center(
                        child: Text(
                          "السلة فارغة",
                          style: TextStyle(fontFamily: "Cairo", fontSize: 24),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return BlocBuilder<CartCubit, CartState>(
                          key: ValueKey(item.product.id),
                          buildWhen: (prev, curr) {
                            if (prev is CartLoaded && curr is CartLoaded) {
                              final prevItem = prev.items.firstWhere(
                                    (e) => e.product.id == item.product.id,
                                orElse: () => CartItemEntity(product: item.product, quantity: 0),
                              );
                              final currItem = curr.items.firstWhere(
                                    (e) => e.product.id == item.product.id,
                                orElse: () => CartItemEntity(product: item.product, quantity: 0),
                              );
                              return prevItem.quantity != currItem.quantity;
                            }
                            return true;
                          },
                          builder: (context, _) {
                            return CartItemDetails(item: item);
                          },
                        );
                      },
                    );
                  } else if (state is CartError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16),
              child: BlocBuilder<CartCubit, CartState>(
                buildWhen: (prev, curr) {
                  if (prev is CartLoaded && curr is CartLoaded) {
                    final prevTotal = prev.items.fold(0.0, (sum, i) => sum + i.totalPrice);
                    final currTotal = curr.items.fold(0.0, (sum, i) => sum + i.totalPrice);
                    return prevTotal != currTotal;
                  }
                  return true;
                },
                builder: (context, state) {
                  if (state is CartLoaded && state.items.isNotEmpty) {
                    final total = state.items.fold(
                      0.0,
                          (sum, item) => sum + item.product.price * item.quantity,
                    );
                    return CustomButton(
                      text: 'الدفع ${total.toStringAsFixed(2)} جنيه',
                      onTap: () {},
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
