import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
         // title: Text('Selection'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.person_add), // Icon for Sign Up
                child: Text('Sign Up', style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // Text color for selected page
                )),
              ),
              Tab(
                icon: Icon(Icons.person), // Icon for Sign In
                child: Text('Sign In', style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // Text color for selected page
                )),
              ),
            ],
            indicator: BoxDecoration(
              //color: Colors.blue, // Background color for selected page
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Your Sign Up Page Widget
            Container(
              color: Colors.white,
              child: Center(
                child: Text('Sign Up Page Content'),
              ),
            ),
            // Your Sign In Page Widget
            // A sign in page in whick there should be an email textbox and a password textbox
            // and forgot password button below them and below that a signin button and this should
            // be on the bottom 70% of the page and the top 30% of the page there should be
            // an image related to POS
            Container(
              color: Colors.white,
              child: Center(
                child: Text('Sign In Page Content'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}