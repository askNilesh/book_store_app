import 'package:book_store_app/ratingbar.dart';
import 'package:book_store_app/trending_list.dart';
import 'package:flutter/material.dart';

class MoreBooks extends StatefulWidget {
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<MoreBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'More Book',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share, color: Colors.grey), onPressed: () {}),
        ],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Top E-Book Reading',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                  style: TextStyle(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/book.jpg',
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Book Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Author Name',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$20.0',
                            style: TextStyle(color: Color(0xff52AFA1), fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RatingBar(
                            rating: 4.5,
                            color: Colors.yellow,
                            onRatingChanged: (rating) => () {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {},
                            color: Color(0xffff8f00),
                            textColor: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Text("Buy now".toUpperCase(), style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'More Recomended',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff757575)),
                      )),
                      Icon(
                        Icons.more_horiz,
                        color: Color(0xff757575),
                      ),
                    ],
                  ),
                ),
                TrendingListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
