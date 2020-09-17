import 'package:flutter/material.dart';
import 'package:wedo/channelListPage.dart';
import 'package:wedo/shared/services/firebase_auth.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  _onTap(int index) {
    Widget redirectScreen;

    switch (index) {
      case 1:
        redirectScreen = ChannelListPage();
        break;
      case 2:
        // redirectScreen = VideoCall();
        break;
      case 0:
      default:
        redirectScreen = Dashboard();
        break;
    }
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return redirectScreen;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              AuthProvider().logout();
            },
            key: Key("logout"),
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(130.0),
        //   child:// _buildUserInfo(user),
        // ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/channelList');
                },
                child:
                    const Text('Chat channels', style: TextStyle(fontSize: 20)),
              ),
              RaisedButton(
                onPressed: () {},
                child:
                    const Text('Viceo Call ', style: TextStyle(fontSize: 20)),
              ),
              Text("Current user")
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Chat'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text(
                'Camera',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              title: Text('Call'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ]),
    );
  }
}
