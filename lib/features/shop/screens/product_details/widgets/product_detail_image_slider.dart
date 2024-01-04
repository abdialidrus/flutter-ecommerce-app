import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter_ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return TCurvedEdgeWidget(
      child: Container(
        color: isDarkMode ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 3),
                child: Center(
                    child: Image(image: AssetImage(TImages.productImage1))),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              left: TSizes.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: isDarkMode ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.productImage6,
                  ),
                ),
              ),
            ),

            /// Appbar Icon
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
