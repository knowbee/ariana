import 'package:ariana/model/category.dart';

class CategoryState {
  final List<Category> categories;
  final bool isLoading;
  final bool isError;

  CategoryState({
    required this.categories,
    required this.isLoading,
    required this.isError,
  });

  factory CategoryState.initial() {
    return CategoryState(
      categories: [],
      isLoading: false,
      isError: false,
    );
  }

  CategoryState copyWith({
    List<Category>? categories,
    bool? isLoading,
    bool? isError,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
