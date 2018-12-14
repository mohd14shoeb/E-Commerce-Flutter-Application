import 'package:flutter/material.dart';

import 'appTools/appTools.dart';
import 'data/Store.dart';
import 'favouriteItems.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  String acctName = "Ravi Shankar Singh";
  String acctEmail = "ravishankarsingh1996@gmail.com";
  String acctPic =
      "https://avatars3.githubusercontent.com/u/20386271?s=460&v=4";
  int noOfFav= 0;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    void setFavourite(int index) {
      if (storeItems[index].favourite == false){
        storeItems[index].favourite = true;
        noOfFav = noOfFav +1;
      }
      else{
        storeItems[index].favourite = false;
        noOfFav = noOfFav -1;
      }
      setState(() {});
    }

    IconData _setFavouriteIcon(bool state) {
      if (state) {
        return Icons.favorite;
      } else
        return Icons.favorite_border;
    }

    Widget drawer = new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(acctName),
            accountEmail: new Text(acctEmail),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: new NetworkImage(acctPic))),
              ),
            ),
          ),
          new ListTile(
            selected: true,
            leading: new CircleAvatar(
              child: new Icon(
                Icons.local_offer,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            title: new Text("Offer Zone"),
            onTap: () {
              showSnackBar("Open Offer Zone", scaffoldKey);
            },
          ),
          new ListTile(
            leading: new CircleAvatar(
              child: Icon(
                Icons.notifications_active,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            title: new Text("Order Notifiaction"),
            onTap: () {
              showSnackBar("Open Order Notifications", scaffoldKey);
            },
          ),
          new Divider(),
          new ListTile(
            leading: new CircleAvatar(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            title: new Text("My Cart"),
            onTap: () {
              showSnackBar("Open My Cart", scaffoldKey);
            },
          ),
          new ListTile(
            leading: new CircleAvatar(
              child: Icon(
                Icons.history,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            title: new Text("Order History"),
            onTap: () {
              showSnackBar("Open Order History", scaffoldKey);
            },
          ),
          new ListTile(
            leading: new CircleAvatar(
              child: Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            title: new Text("My Account"),
            onTap: () {
              showSnackBar("Open My Account", scaffoldKey);
            },
          ),
          new Divider(),
          new ListTile(
            trailing: new CircleAvatar(
              child: new Icon(
                Icons.help,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            title: new Text("About Us"),
            onTap: () {
              showSnackBar("Open About Us", scaffoldKey);
            },
          ),
          new ListTile(
            trailing: new CircleAvatar(
              child: new Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            title: new Text("Logout"),
            onTap: () {
              showSnackBar("Logout User.", scaffoldKey);
            },
          )
        ],
      ),
    );

    Widget body = new Center(
      child: Column(
        children: <Widget>[
          new Flexible(
              child: new GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: storeItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      onTap: () {},
                      child: new Card(
                        child: Stack(
                          alignment: FractionalOffset.topLeft,
                          children: <Widget>[
                            new Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: <Widget>[
                                new Container(
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: new NetworkImage(
                                              storeItems[index].itemImage))),
                                ),
                                new Container(
                                  height: 35.0,
                                  color: Colors.black.withAlpha(100),
                                  child: new Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text(
                                          "${storeItems[index].itemName.substring(0, 8)}...",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                              color: Colors.white),
                                        ),
                                        new Text(
                                          "₹${storeItems[index].itemPrice}",
                                          style: new TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      height: 30.0,
                                      width: 60.0,
                                      decoration: new BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: new BorderRadius.only(
                                              topRight:
                                                  new Radius.circular(5.0),
                                              bottomRight:
                                                  new Radius.circular(5.0))),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          new Icon(Icons.stars,
                                              color: Colors.deepOrange,
                                              size: 20.0),
                                          new Text(
                                            "${storeItems[index].itemRating}",
                                            style: new TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    new IconButton(
                                        icon: new Icon(
                                          _setFavouriteIcon(
                                              storeItems[index].favourite),
                                          color: Colors.deepOrange,
                                        ),
                                        onPressed: () {
                                          setFavourite(index);
                                        })
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  alignment: Alignment(1.0, 0.0),
                                  child: new InkWell(
                                    child: new CircleAvatar(
                                      backgroundColor: Colors.black26,
                                      child: new IconButton(
                                          icon: new Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.deepOrange,
                                            size: 20.0,
                                          ),
                                          onPressed: () {}),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: GestureDetector(
          onLongPress: openAdmin,
          child: new Text("Shop Time"),
        ),
        centerTitle: true,
        actions: <Widget>[
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {
//                showSnackBar("Opne Favourite", scaffoldKey);
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => FavouriteItems(storeItems: storeItems, onUnFavouritePressed: (bool state){
                          noOfFav = noOfFav -1;
                          setState(() {
                          });
                        }, )));
                  }),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.teal,
                child: new Text(
                  noOfFav.toString(),
                  style: new TextStyle(color: Colors.white, fontSize: 8.0),
                ),
              )
            ],
          ),
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showSnackBar("Open Chat", scaffoldKey);
                  }),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.teal,
                child: new Text(
                  "0",
                  style: new TextStyle(color: Colors.white, fontSize: 8.0),
                ),
              )
            ],
          )
        ],
      ),
      body: body,
      drawer: drawer,
    );
  }

  openAdmin() {
    showSnackBar("Open Admin", scaffoldKey);
  }
}
