import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/core/helper/awesome_dialog.dart';
import 'package:e_commerce_app/core/helper/show_snak_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_botton.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signout_cubit/signout_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/view/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


/*
 * AccountView class
 * StatelessWidget that represents the user account screen
 * Uses BlocConsumer to handle sign-out state changes
 * Displays user information and options like account info and wallet
 * Includes a sign-out button that triggers the sign-out process
 */

class AccountView extends StatelessWidget {
  const AccountView({super.key});
  static const String id = 'AccountView';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignoutCubit, SignoutState>(
      listener: (context, state) {
        if (state is SignOutLoading) {
        } else if (state is SignOutFailure) {
          showDialogMessage(context, desc: state.errMessage);
        } else if (state is SignOutSuccess) {
          showSnakBar(context, "sing out success");
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(LoginView.id, (route) => false);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignOutLoading,
          child: Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  children: [
                    const SizedBox(height: 90),
                    Image.asset(Assets.imagesAvatar, height: 100),
                    const Text(
                      'صباح الخير !..',
                      style: TextStyle(
                        fontFamily: fontFamily,
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "محمود ضاحي",
                      style: TextStyle(
                        fontFamily: fontFamily,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomAccountListTile(
                      leading: SvgPicture.asset(Assets.imagesUser, height: 30),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: 'معلومات الحساب',
                    ),

                    CustomAccountListTile(
                      leading: SvgPicture.asset(Assets.wallet, height: 30),
                      trailing: Icon(CupertinoIcons.right_chevron),
                      title: 'محفظة',
                    ),
                    Spacer(),
                    CustomButton(
                      text: 'تسجيل الخروج',
                      onTap: () {
                        BlocProvider.of<SignoutCubit>(context).signOut();
                      },
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomAccountListTile extends StatelessWidget {
  const CustomAccountListTile({
    super.key,
    required this.leading,
    required this.trailing,
    required this.title,
  });
  final Widget leading;
  final Widget trailing;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: fontFamily,
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: trailing,
    );
  }
}
