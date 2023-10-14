import 'package:flutter/material.dart';

/// Размеры для приложения
class AppSizes {
  // Отступы
  static const double paddingCommon = 16;
  static const double paddingContent = paddingCommon / 2;

  // Размеры радиуса
  static const double borderRadiusCommon = 16;
  static const double avatarRadius = 55;

  // Радиусы
  static const Radius radiusCommon = Radius.circular(borderRadiusCommon);

  // Размеры иконок
  static const Size sizeIcon = Size.square(30);

  AppSizes._();
}
