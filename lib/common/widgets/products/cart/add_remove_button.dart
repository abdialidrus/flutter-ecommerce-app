import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          widht: 32,
          height: 32,
          size: TSizes.md,
          color: isDarkMode ? TColors.white : TColors.black,
          backgroundColor: isDarkMode ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),
        const TCircularIcon(
          icon: Iconsax.add,
          widht: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
