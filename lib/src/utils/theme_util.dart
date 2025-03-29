import 'package:flutter/material.dart';
import '../models/login_fire_config.dart';

class ThemeUtil {
  static LoginFireThemeConfig getThemeConfig(
    BuildContext context,
    LoginFireConfig config,
  ) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark ? config.darkTheme : config.lightTheme;
  }
}
