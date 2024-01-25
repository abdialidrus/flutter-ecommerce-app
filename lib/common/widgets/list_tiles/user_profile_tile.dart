import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_ecommerce_app/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
        leading: TCircularImage(
          image: controller.user.value.profilePicture.isNotEmpty ? controller.user.value.profilePicture : TImages.user,
          width: 50,
          height: 50,
          padding: 0,
          isNetworkImage: controller.user.value.profilePicture.isNotEmpty,
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit), color: TColors.white));
  }
}
