import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Review and Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ratings and Reviews are verified and are from people who use the same type of device that you use.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Rating
              const TOverAllProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Review List
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
