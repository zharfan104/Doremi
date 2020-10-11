import 'package:auto_route/auto_route.dart';
import 'package:doremi/tabs/accountPage/settings/change_password_page.dart';
import 'package:flutter/material.dart';

class changeAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        ExtendedNavigator.of(context).pop();
                      }),
                  Text(
                    'Settings',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container(
                          margin: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0),
                                ),
                              ),
                              Card(
                                child: Container(
                                  margin: EdgeInsets.only(top: 8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text('Long Hoang'),
                                              ),
                                              GestureDetector(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4.0),
                                                      child: Text('Edit'),
                                                    ),
                                                    Icon(
                                                      Icons.edit,
                                                      size: 10.0,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                    'longhoang.2984@gmail.com'),
                                              ),
                                              GestureDetector(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4.0),
                                                      child: Text('Edit'),
                                                    ),
                                                    Icon(
                                                      Icons.edit,
                                                      size: 10.0,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text('07 - 05 - 1993'),
                                              ),
                                              GestureDetector(
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4.0),
                                                      child: Text('Edit'),
                                                    ),
                                                    Icon(
                                                      Icons.edit,
                                                      size: 10.0,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text('Security'),
                                              ),
                                              GestureDetector(
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.navigate_next,
                                                      size: 16.0,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) =>
                                                      ChangePasswordPage())),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child:
                                                      Text('Change Password'),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.navigate_next,
                                                      size: 16.0,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
