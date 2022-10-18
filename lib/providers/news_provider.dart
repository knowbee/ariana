import 'package:ariana/repositories/news_repository.dart';
import 'package:ariana/state/news_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier(NewsState.initial());
});

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(NewsState state) : super(state) {
    fetchNews();
  }

  void fetchNews() async {
    state = state.copyWith(isLoading: true);
    state = await NewsRepository.fetch(state.page + 1);
  }
}
