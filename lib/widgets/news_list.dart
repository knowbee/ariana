import 'package:ariana/providers/news_provider.dart';
import 'package:ariana/widgets/news_list_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsList extends ConsumerWidget {
  const NewsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsProvider);

    if (newsState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemExtent: 100,
      itemCount: newsState.news.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) =>
          NewsListItem(newsItem: newsState.news[index]),
    );
  }
}
