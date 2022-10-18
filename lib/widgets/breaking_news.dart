import 'package:ariana/widgets/breaking_news_item.dart';
import 'package:flutter/material.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.9);
    return PageView(
      controller: controller,
      children: const [
        BreakingNewsItem(),
        BreakingNewsItem(),
        BreakingNewsItem(),
        BreakingNewsItem(),
      ],
    );
  }
}
