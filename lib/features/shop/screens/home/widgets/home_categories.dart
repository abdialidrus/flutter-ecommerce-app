import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter_ecommerce_app/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Categories
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TVerticalImageText(
                image: TImages.shoeIcon,
                title: 'Shoes',
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
          ),
        )
      ],
    );
  }
}
