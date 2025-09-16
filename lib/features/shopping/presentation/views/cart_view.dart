import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_botton.dart';
import '../cubits/cart/cart_cubit.dart';
import 'widgets/cart_item_details.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/number_of_product.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static const String id = 'Cart_view';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    context.read<CartCubit>().loadCart();

    super.initState();
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
                return NumberOfProduct(count: state.items.length);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state.items.isEmpty) {
                    return const Center(child: Text("السلة فارغة"));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return CartItemDetails(item: item);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28.0,
                vertical: 16,
              ),
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state.items.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return CustomBotton(
                    text: 'الدفع ${state.total.toStringAsFixed(2)} جنيه',
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
