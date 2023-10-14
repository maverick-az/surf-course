import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/presets/styles/app_colors.dart';
import 'package:surf_flutter_courses_template/presets/styles/app_sizes.dart';

/// Svg иконка
class SvgIcon extends StatelessWidget {
  final String iconAsset;

  const SvgIcon(
    this.iconAsset, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: AppSizes.sizeIcon.width,
      height: AppSizes.sizeIcon.height,
      iconAsset,
      colorFilter: const ColorFilter.mode(
        AppColors.iconCommon,
        BlendMode.srcIn,
      ),
    );
  }
}
