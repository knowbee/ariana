import 'package:ariana/widgets/bottom_navigation_bar.dart';
import 'package:ariana/widgets/breaking_news.dart';
import 'package:ariana/widgets/categories.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Breaking news",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: const BreakingNews(),
              ),
              const SizedBox(height: 24),
              const Categories(),
            ],
          ),
        ),
      ),
    );
  }
}
