import 'package:ariana/model/app_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appTabProvider = StateNotifierProvider<AppTabNotifier, AppTabs>((ref) {
  return AppTabNotifier(AppTabs.home);
});

class AppTabNotifier extends StateNotifier<AppTabs> {
  AppTabNotifier(AppTabs currentTab) : super(currentTab);

  void changeTab(int tabIndex) {
    state = AppTabs.values[tabIndex];
  }
}
