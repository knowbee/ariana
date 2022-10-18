import 'package:ariana/widgets/news_list_item.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 100,
      padding: const EdgeInsets.all(16),
      children: const [
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
        NewsListItem(),
      ],
    );
  }
}
