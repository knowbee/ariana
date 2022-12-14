import 'package:ariana/providers/category_provider.dart';
import 'package:ariana/providers/news_provider.dart';
import 'package:ariana/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Categories extends HookConsumerWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final categoryState = ref.watch(categoryProvider);

    if (categoryState.categories.isEmpty) {
      return const Center(
        child: LinearProgressIndicator(),
      );
    }
    final TabController tabController =
        useTabController(initialLength: categoryState.categories.length);

    tabController.addListener(() {
      final categoryId = categoryState.categories[tabController.index].id;
      ref.read(newsProvider.notifier).fetchNews(page: 1, category: categoryId);
    });
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 2),
              ),
            ),
            child: TabBar(
                controller: tabController,
                labelColor: Colors.blue.shade800,
                unselectedLabelColor: Colors.grey.shade600,
                indicatorColor: Colors.blue.shade800,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                indicatorWeight: 2,
                tabs: categoryState.categories.map((category) {
                  return Tab(
                    text: category.name,
                  );
                }).toList()),
          ),
        ),
        SizedBox(
          key: key,
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).size.height / 3 -
              kTextTabBarHeight -
              kToolbarHeight -
              36,
          child: TabBarView(
            controller: tabController,
            children: categoryState.categories
                .map((category) => NewsList(
                      categoryId: category.id,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
