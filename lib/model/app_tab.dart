import 'package:ariana/screens/home.dart';
import 'package:ariana/screens/live_streaming.dart';
import 'package:flutter/material.dart';

enum AppTabs { home, tv, settings }

extension AppLangExtension on AppTabs {
  Widget get screen {
    switch (this) {
      case AppTabs.home:
        return const Home();
      case AppTabs.tv:
        return const VideoLiveStreaming();
      case AppTabs.settings:
        return const Home();
      default:
        return const Home();
    }
  }
}
