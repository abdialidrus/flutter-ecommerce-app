import 'package:flutter_ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/settings/settings.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/cart/cart.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/home/home.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/order/order.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/store/store.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter_ecommerce_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderListScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
