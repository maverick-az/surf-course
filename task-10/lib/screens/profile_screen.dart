import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/key_value_data.dart';
import 'package:surf_flutter_courses_template/presets/assets/app_icons.dart';
import 'package:surf_flutter_courses_template/presets/strings/app_strings.dart';
import 'package:surf_flutter_courses_template/presets/styles/app_sizes.dart';
import 'package:surf_flutter_courses_template/screens/components/simple_card.dart';
import 'package:surf_flutter_courses_template/widgets/circle_avatar_asset.dart';

/// Экран профиля пользователя
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.srcTitleProfileScreen,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.paddingCommon),
            child: Column(
              children: [
                const SizedBox(height: AppSizes.paddingCommon),
                const _WidgetAvatar(
                  userName: 'Andy Z.',
                  avatar: 'assets/images/eye.gif',
                ),
                const SizedBox(height: AppSizes.paddingCommon),
                const SimpleCard(
                  iconAsset: AppIcons.pumpkin,
                  title: AppStrings.aboutMe,
                  text:
                      'Программист с опытом работы в разработке 1С, но моя страсть к программированию не ограничивается только этой областью.',
                ),
                const SizedBox(height: AppSizes.paddingCommon),
                const SimpleCard(
                  iconAsset: AppIcons.voodoo,
                  title: AppStrings.aboutHobbies,
                  text:
                      'Увлечен разработкой программ, созданием веб-приложений и исследованием новых технологий, связанных с программированием.',
                ),
                const SizedBox(height: AppSizes.paddingCommon),
                SimpleCard(
                  iconAsset: AppIcons.hatchet,
                  title: AppStrings.developmentExperience,
                  list: <KeyValueData<double>>[
                    KeyValueData('1C', 80),
                    KeyValueData('Flutter', 30),
                    KeyValueData('HTML', 60),
                    KeyValueData('CSS', 50),
                    KeyValueData('JavaScript', 30),
                    KeyValueData('SQL', 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WidgetAvatar extends StatelessWidget {
  final String userName;
  final String avatar;

  const _WidgetAvatar({
    required this.userName,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatarAsset(imagePath: avatar),
        const SizedBox(width: AppSizes.paddingCommon),
        Column(
          children: [
            Text(
              userName.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }
}
