import 'package:ariana/main.dart';
import 'package:flutter/material.dart';

enum AppTabs { home, tv, settings }

extension AppLangExtension on AppTabs {
  Widget get screen {
    switch (this) {
      case AppTabs.home:
        return const MyHomePage();
      case AppTabs.tv:
        return const MyHomePage();
      case AppTabs.settings:
        return const MyHomePage();
      default:
        return const MyHomePage();
    }
  }
}
