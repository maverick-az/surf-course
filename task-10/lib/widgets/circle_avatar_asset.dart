import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presets/styles/app_sizes.dart';

/// Аватар с картинкой из ассета
class CircleAvatarAsset extends StatelessWidget {
  final String imagePath;

  const CircleAvatarAsset({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CircleAvatar(
      maxRadius: AppSizes.avatarRadius,
      backgroundColor: theme.primaryColor,
      child: CircleAvatar(
        maxRadius: AppSizes.avatarRadius - 10,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
