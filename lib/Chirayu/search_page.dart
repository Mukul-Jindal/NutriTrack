// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'components/hot_topics_tile.dart';
import 'components/trending_list_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
              child: SearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                "Hot Now",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  HotTopicsTile(
                    imagePath: "assets/Search_page1.jpg",
                    titleText: "The Sabzi Secret",
                    subText: "The Sabzi Secrets...",
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  HotTopicsTile(
                    imagePath: "assets/Search_page2.jpg",
                    titleText: "The Avacado Secret",
                    subText: "The Avacado Secrets...",
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  HotTopicsTile(
                    imagePath: "assets/Search_page3.jpg",
                    titleText: "The ShimlaMirch Secret",
                    subText: "The ShimlaMirch Secrets...",
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 30, 24, 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trending",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TrendingListTile(title: "best vegetable recipes"),
                  Divider(),
                  TrendingListTile(title: "best chicken recipes"),
                  Divider(),
                  TrendingListTile(title: "best vegetable recipes"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
