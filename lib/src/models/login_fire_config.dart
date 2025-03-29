import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Configuration for the UI appearance of the login screen
class LoginFireThemeConfig extends Equatable {
  final Color backgroundColor;
  final Gradient? backgroundGradient;
  final String? backgroundImage;
  final String? headerImage;

  final TextStyle titleTextStyle;
  final TextStyle buttonTextStyle;
  final TextStyle inputTextStyle;
  final TextStyle hintTextStyle;
  final TextStyle errorMessageStyle;
  final TextStyle successMessageStyle;
  final TextStyle forgotPasswordTextStyle;

  final BoxDecoration? buttonDecoration;
  final BoxDecoration? socialLoginButtonDecoration;

  const LoginFireThemeConfig({
    required this.backgroundColor,
    this.backgroundGradient,
    this.backgroundImage,
    this.headerImage,
    required this.titleTextStyle,
    required this.buttonTextStyle,
    required this.inputTextStyle,
    required this.hintTextStyle,
    required this.errorMessageStyle,
    required this.successMessageStyle,
    required this.forgotPasswordTextStyle,
    this.buttonDecoration,
    this.socialLoginButtonDecoration,
  });

  /// ✅ Creates a copy with updated properties
  LoginFireThemeConfig copyWith({
    Color? backgroundColor,
    Gradient? backgroundGradient,
    String? backgroundImage,
    String? headerImage,
    TextStyle? titleTextStyle,
    TextStyle? buttonTextStyle,
    TextStyle? inputTextStyle,
    TextStyle? hintTextStyle,
    TextStyle? errorMessageStyle,
    TextStyle? successMessageStyle,
    TextStyle? forgotPasswordTextStyle,
    BoxDecoration? buttonDecoration,
    BoxDecoration? socialLoginButtonDecoration,
  }) {
    return LoginFireThemeConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      headerImage: headerImage ?? this.headerImage,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      buttonTextStyle: buttonTextStyle ?? this.buttonTextStyle,
      inputTextStyle: inputTextStyle ?? this.inputTextStyle,
      hintTextStyle: hintTextStyle ?? this.hintTextStyle,
      errorMessageStyle: errorMessageStyle ?? this.errorMessageStyle,
      successMessageStyle: successMessageStyle ?? this.successMessageStyle,
      forgotPasswordTextStyle:
          forgotPasswordTextStyle ?? this.forgotPasswordTextStyle,
      buttonDecoration: buttonDecoration ?? this.buttonDecoration,
      socialLoginButtonDecoration:
          socialLoginButtonDecoration ?? this.socialLoginButtonDecoration,
    );
  }

  @override
  List<Object?> get props => [
    backgroundColor,
    backgroundGradient,
    backgroundImage,
    headerImage,
    titleTextStyle,
    buttonTextStyle,
    inputTextStyle,
    hintTextStyle,
    errorMessageStyle,
    successMessageStyle,
    forgotPasswordTextStyle,
    buttonDecoration,
    socialLoginButtonDecoration,
  ];
}

/// Configuration for the overall behavior of the login screen
class LoginFireConfig extends Equatable {
  final String appName;
  final double logoSize;
  final String? firebaseConfigPath;
  final Map<String, String>? customMessages;
  final bool showSocialLoginButtons;
  final Function()? onSuccess;
  final Function(String)? onError;
  final LoginFireThemeConfig lightTheme;
  final LoginFireThemeConfig darkTheme;

  const LoginFireConfig({
    required this.appName,
    this.logoSize = 120.0,
    this.firebaseConfigPath,
    this.customMessages,
    this.showSocialLoginButtons = true,
    this.onSuccess,
    this.onError,
    required this.lightTheme,
    required this.darkTheme,
  });

  /// ✅ Creates a copy with updated properties
  LoginFireConfig copyWith({
    String? appName,
    double? logoSize,
    String? firebaseConfigPath,
    Map<String, String>? customMessages,
    bool? showSocialLoginButtons,
    Function()? onSuccess,
    Function(String)? onError,
    LoginFireThemeConfig? lightTheme,
    LoginFireThemeConfig? darkTheme,
  }) {
    return LoginFireConfig(
      appName: appName ?? this.appName,
      logoSize: logoSize ?? this.logoSize,
      firebaseConfigPath: firebaseConfigPath ?? this.firebaseConfigPath,
      customMessages: customMessages ?? this.customMessages,
      showSocialLoginButtons:
          showSocialLoginButtons ?? this.showSocialLoginButtons,
      onSuccess: onSuccess ?? this.onSuccess,
      onError: onError ?? this.onError,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  @override
  List<Object?> get props => [
    appName,
    logoSize,
    firebaseConfigPath,
    customMessages,
    showSocialLoginButtons,
    onSuccess,
    onError,
    lightTheme,
    darkTheme,
  ];
}
