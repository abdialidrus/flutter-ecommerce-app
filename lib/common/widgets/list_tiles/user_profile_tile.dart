import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_ecommerce_app/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Abdi Alidrus',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitle: Text(
        'muhammadabdi25@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.edit),
          color: TColors.white),
    );
  }
}
