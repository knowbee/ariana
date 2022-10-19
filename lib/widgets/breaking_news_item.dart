import 'package:ariana/model/news.dart';
import 'package:ariana/screens/news_details.dart';
import 'package:flutter/material.dart';

class BreakingNewsItem extends StatelessWidget {
  const BreakingNewsItem({
    Key? key,
    required this.newsItem,
    this.height,
    this.radius,
    this.padding,
    this.margin,
  }) : super(key: key);

  final News newsItem;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(newsItem: newsItem),
          ),
        );
      },
      child: Container(
        height: height,
        margin: margin ?? const EdgeInsets.only(right: 16),
        padding:
            const EdgeInsets.only(top: 16.0, bottom: 16, left: 24, right: 64),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: NetworkImage(newsItem.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Chip(
                  label: Text(newsItem.categories[0].name),
                ),
                const SizedBox(
                  width: 8,
                ),
                Icon(Icons.fiber_manual_record,
                    size: 8, color: Colors.grey.shade300),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  newsItem.formattedDate,
                  style: TextStyle(color: Colors.grey.shade300),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              newsItem.title,
              style: TextStyle(
                  color: Colors.grey.shade100,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
