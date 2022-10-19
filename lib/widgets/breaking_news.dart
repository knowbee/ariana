import 'package:ariana/model/news.dart';
import 'package:ariana/providers/news_provider.dart';
import 'package:ariana/widgets/breaking_news_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BreakingNews extends ConsumerWidget {
  const BreakingNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController(viewportFraction: 0.9);
    final Future<List<News>> breakingNews =
        ref.read(breakingNewsProvider.future);
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<News>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "Loading breaking news...",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade100),
                ),
              ));
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return PageView.builder(
          controller: controller,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return BreakingNewsItem(newsItem: snapshot.data![index]);
          },
        );
      },
      future: breakingNews,
    );
  }
}
