import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> navBarItem = ["Top News", "India", "World", "Finance", "Health"];
  @override
  Widget build(BuildContext context) {
    var news_name = ["NDTV", "NewsLaundry", "The Wire", "The Quint", "News 24"];
    final _random = new Random();
    var news = news_name[_random.nextInt(news_name.length)];
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if ((searchController.text).replaceAll(" ", "") == "") {
                      print("Blank Search");
                    } else {
                      //print("Search Me");
                    }
                  },
                  child: Container(
                    child: Icon(
                      Icons.search,
                      color: Colors.blueAccent,
                    ),
                    margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                  ),
                ),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search $news",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: navBarItem.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    print(navBarItem[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        navBarItem[index],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
