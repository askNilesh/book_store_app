import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  PageController controller;
  int currentpage = 0;
  int qty = 1;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Book Details',
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
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentpage = value;
                    });
                  },
                  controller: controller,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white),
                      padding: EdgeInsets.all(10.0),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
//                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/book.jpg',
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '\$20.0',
                                style: TextStyle(
                                    color: Color(0xff52AFA1), fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                'A Love Hate Thing',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                'Author name',
                                style: TextStyle(fontWeight: FontWeight.normal),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Color(0xff52AFA1),
                          child: Icon(Icons.bookmark),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Column(
                          children: <Widget>[
                            Text(
                              'Rating',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '4.5',style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2,),
                          ],
                        )),
                        SizedBox( height: 30,child: VerticalDivider(color: Colors.black,)),

                        Expanded(child: Column(
                          children: <Widget>[
                            Text(
                              'No. of pages',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '120 pages',style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2,),
                          ],
                        )),
                        Container( height: 30,child: VerticalDivider(color: Colors.black,)),
                        Expanded(child: Column(
                          children: <Widget>[
                            Text(
                              'Languege',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'GUJ',style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2,),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                    style: TextStyle(),
                    textAlign: TextAlign.justify,),
                  ),
                  SizedBox(height: 25,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.grey.withOpacity(0.5
                                )),
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Expanded(child: Text('QTY')),
                                IconButton(icon: Icon(Icons.remove), onPressed: (){
                                  setState(() {
                                    qty--;
                                    if(qty<=0){
                                      qty=1;
                                    }
                                  });
                                }),
                                Text(qty.toString()),
                                IconButton(icon: Icon(Icons.add), onPressed: (){
                                  setState(() {
                                    qty++;
                                  });
                                }),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              ),
                          onPressed: () {},
                          color:  Color(0xffff8f00),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          child: Text("Buy now".toUpperCase(),
                              style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
