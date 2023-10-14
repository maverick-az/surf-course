import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/key_value_data.dart';
import 'package:surf_flutter_courses_template/presets/styles/app_sizes.dart';
import 'package:surf_flutter_courses_template/widgets/icons/icon_svg.dart';

/// Простой кард
class SimpleCard extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String? text;
  final List<KeyValueData<double>>? list;

  const SimpleCard({
    required this.iconAsset,
    required this.title,
    this.text,
    this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.paddingCommon),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.all(AppSizes.radiusCommon),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgIcon(iconAsset),
              const SizedBox(width: AppSizes.paddingContent),
              Text(
                title,
                style: theme.textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.paddingCommon),
          if (text != null) Text(text!),
          if (list != null)
            ...list!
                .map((data) => ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -4),
                      title: Text(
                        data.key,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontFamily: 'Creepster',
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      subtitle: LinearProgressIndicator(
                        value: data.value > 1 ? data.value / 100 : data.value,
                      ),
                    ))
                .toList(),
        ],
      ),
    );
  }
}
