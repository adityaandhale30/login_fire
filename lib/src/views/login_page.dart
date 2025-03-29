import 'package:flutter/material.dart';
import '../models/login_fire_config.dart';
import '../utils/theme_util.dart';

class LoginPage extends StatelessWidget {
  final LoginFireConfig config;

  const LoginPage({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeUtil.getThemeConfig(context, config);

    return Scaffold(
      backgroundColor:
          theme.backgroundGradient == null ? theme.backgroundColor : null,
      body: Container(
        decoration:
            theme.backgroundGradient != null
                ? BoxDecoration(gradient: theme.backgroundGradient)
                : null,
        child: Stack(
          children: [
            if (theme.backgroundImage != null)
              Positioned.fill(
                child: Image.asset(theme.backgroundImage!, fit: BoxFit.cover),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (theme.headerImage != null)
                    Image.asset(theme.headerImage!, height: 150),
                  const SizedBox(height: 20),
                  Text(config.appName, style: theme.titleTextStyle),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          theme.buttonDecoration?.color ?? Colors.blue,
                      shape:
                          theme.buttonDecoration?.borderRadius != null
                              ? RoundedRectangleBorder(
                                borderRadius:
                                    theme.buttonDecoration!.borderRadius!,
                              )
                              : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                    ),
                    onPressed: () {
                      if (config.onSuccess != null) {
                        config.onSuccess!();
                      }
                    },
                    child: Text(
                      config.customMessages?['loginButton'] ?? 'Login',
                      style: theme.buttonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
