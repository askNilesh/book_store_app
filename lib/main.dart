import 'package:book_store_app/trending_list.dart';
import 'package:flutter/material.dart';

import 'custom_bottomvavbar.dart';
import 'more_books.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller;
  int currentpage = 0;

  int _currentPage;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.9,
    );
    _currentPage = 0;
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: null),
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/user.png',
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, color: Color(0xffff8f00)),
                          child: Text(
                            '12',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.shopping_basket), onPressed: null),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Color(0xffe0e0e0)),
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Color(0xff757575),
                  ),
                  Expanded(child: Text('')),
                  Icon(
                    Icons.mic,
                    color: Color(0xff757575),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    'Trending book',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff757575)),
                  )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MoreBooks()));
                    },
                    child: Icon(
                      Icons.more_horiz,
                      color: Color(0xff757575),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TrendingListView(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                    color: Color(0xff52AFA1)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              'Continue book',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      child: PageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              currentpage = value;
                            });
                          },
                          controller: controller,
                          itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.white),
                                padding: EdgeInsets.all(10.0),
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        'assets/images/book.jpg',
                                        height: 80,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'by author name',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'A Love Hate the dummy text',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        CircularProgressIndicator(
                                            backgroundColor: Colors.grey,
                                            value: 0.65,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(Color(0xffff8f00))),
                                        Positioned(
                                          child: Text(
                                            '65%',
                                            style: TextStyle(color: Color(0xffff8f00)),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                          color: Colors.white),
                      child: AnimatedBottomNavBar(
                          currentIndex: _currentPage,
                          onChange: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
