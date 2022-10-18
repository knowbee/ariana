import 'package:ariana/repositories/news_repository.dart';
import 'package:ariana/state/category_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  CategoryNotifier(CategoryState state) : super(state) {
    fetchCategories();
  }

  void fetchCategories() async {
    state = state.copyWith(isLoading: true);
    final categories = await NewsRepository.fetchCategories();
    state = state.copyWith(categories: categories, isLoading: false);
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier(CategoryState.initial());
});
