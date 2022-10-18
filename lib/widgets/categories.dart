import 'package:ariana/widgets/news_list.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DefaultTabController(
        length: 12,
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 2),
                ),
              ),
              child: TabBar(
                  labelColor: Colors.blue.shade800,
                  unselectedLabelColor: Colors.grey.shade600,
                  indicatorColor: Colors.blue.shade800,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                  indicatorWeight: 2,
                  tabs: const [
                    Tab(text: "Trending"),
                    Tab(text: "Health"),
                    Tab(text: "Politics"),
                    Tab(text: "Sports"),
                    Tab(text: "Business"),
                    Tab(text: "Entertainment"),
                    Tab(text: "Technology"),
                    Tab(text: "Science"),
                    Tab(text: "World"),
                    Tab(text: "National"),
                    Tab(text: "Local"),
                    Tab(text: "Opinion"),
                  ]),
            ),
            SizedBox(
                key: key,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 3 -
                    kTextTabBarHeight -
                    kToolbarHeight -
                    36,
                child: const TabBarView(
                  children: [
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                    NewsList(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
