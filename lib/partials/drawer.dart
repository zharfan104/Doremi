import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:doremi/tabs/accountTabs.dart';
import 'package:doremi/view/home.dart';
import 'package:doremi/view/subscription.dart';
import 'globals.dart' as globals;

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({Key key}) : super(key: key);

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      elevation: 16,
      child: Container(
          color: HexColor("C52127").withOpacity(0.9),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              DrawerHeader(
                duration: Duration(seconds: 5),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.asset(
                            "assets/images/user.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        //child: Image.network("${globals.user['photo']}", fit: BoxFit.cover ,),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: width - 250,
                                child: Text('Assi Christian',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                              ),
                              Container(
                                  height: 20,
                                  width: width - 250,
                                  child: Text('08074391'))
                            ],
                          ))
                    ],
                  ),
                ),
                decoration: new BoxDecoration(
                    //color: HexColor("C52127"),
                    ),
              ),
              Container(
                color: globals.menuSelected == "Home"
                    ? HexColor("C52127")
                    : Colors.transparent,
                child: ListTile(
                  onTap: () {
                    setState(() {
                      globals.menuSelected = "Home";
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  title: Text('Home',
                      style: TextStyle(
                          color: HexColor("ffffff").withOpacity(0.6),
                          fontSize: 18)),
                ),
              ),
              Container(
                  color: globals.menuSelected == "My Events"
                      ? HexColor("C52127")
                      : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        globals.menuSelected = "My Events";
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    index: 2,
                                  )));
                    },
                    // trailing: Badge(
                    //   badgeColor: Colors.white,
                    //   badgeContent: Text('3'),
                    // ),
                    title: Text('My Events',
                        style: TextStyle(
                            color: HexColor("ffffff").withOpacity(0.6),
                            fontSize: 18)),
                  )),
              Container(
                  color: globals.menuSelected == "Notifications"
                      ? HexColor("C52127")
                      : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        globals.menuSelected = "Notifications";
                      });

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    trailing: Badge(
                      badgeColor: Colors.white,
                      badgeContent: Text('3'),
                    ),
                    title: Text('Notifications',
                        style: TextStyle(
                            color: HexColor("ffffff").withOpacity(0.6),
                            fontSize: 18)),
                  )),
              Container(
                  color: globals.menuSelected == "Gift Cards"
                      ? HexColor("C52127")
                      : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        globals.menuSelected = "Gift Cards";
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    index: 3,
                                  )));
                    },
                    // trailing: Badge(
                    //   badgeColor: Colors.white,
                    //   badgeContent: Text('3'),
                    // ),
                    // leading: Icon(Icons.home),
                    title: Text('Gift Cards',
                        style: TextStyle(
                            color: HexColor("ffffff").withOpacity(0.6),
                            fontSize: 18)),
                  )),
              Container(
                color: globals.menuSelected == "Favorite"
                    ? HexColor("C52127")
                    : Colors.transparent,
                child: ListTile(
                  selected: true,
                  onTap: () {
                    setState(() {
                      globals.menuSelected = "Favorite";
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  // trailing: Badge(
                  //   badgeColor: Colors.white,
                  //   badgeContent: Text('3'),
                  // ),
                  // leading: Icon(Icons.home),
                  title: Text('Favorite',
                      style: TextStyle(
                          color: HexColor("ffffff").withOpacity(0.6),
                          fontSize: 18)),
                ),
              ),
              Container(
                  color: globals.menuSelected == "Subscription Plan"
                      ? HexColor("C52127")
                      : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        globals.menuSelected = "Subscription Plan";
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubscriptionPage()));
                    },
                    // trailing: Badge(
                    //   badgeColor: Colors.white,
                    //   badgeContent: Text('3'),
                    // ),
                    // leading: Icon(Icons.home),
                    title: Text('Subscription Plan',
                        style: TextStyle(
                            color: HexColor("ffffff").withOpacity(0.6),
                            fontSize: 18)),
                  )),
              Container(
                  color: globals.menuSelected == "Settings"
                      ? HexColor("C52127")
                      : Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        globals.menuSelected = "Settings";
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    index: 4,
                                  )));
                    },
                    // trailing: Badge(
                    //   badgeColor: Colors.white,
                    //   badgeContent: Text('3'),
                    // // ),
                    // leading: Icon(Icons.home),
                    title: Text('Settings',
                        style: TextStyle(
                            color: HexColor("ffffff").withOpacity(0.6),
                            fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.all(25),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                    onPressed: () async {
                      ExtendedNavigator.of(context)
                          .push(Routes.homePage(isLogin: 'true'));
                    },
                    padding: EdgeInsets.all(15),
                    color: HexColor("C52127"),
                    child:
                        Text('Logout', style: TextStyle(color: Colors.white)),
                  ))
            ],
          )),
    );
  }
}
