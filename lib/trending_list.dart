import 'package:flutter/material.dart';

import 'book_detail.dart';

class TrendingListView extends StatefulWidget {
  @override
  _TrendingListViewState createState() => _TrendingListViewState();
}

class _TrendingListViewState extends State<TrendingListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetails()));
              },
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/book.jpg',
                        height: 150,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 110,
                      child: Text(
                        'by author name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 110,
                      child: Text(
                        'A Love Hate the dummy text',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
