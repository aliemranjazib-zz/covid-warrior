import 'package:covidpk/plasmadonation.dart/LoginScreen.dart';
import 'package:covidpk/routes.dart';
import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width * 0.8, 0);
    path.quadraticBezierTo(
        280, size.height * 0.6, size.width * 0.8, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Home',
              onTap: () => Navigator.pushNamed(context, Routes.mainPage)),
          _createDrawerItem(
              icon: Icons.event,
              text: 'Pakistan Data',
              onTap: () => Navigator.pushNamed(context, Routes.pakCovidPage)),
          _createDrawerItem(
              icon: Icons.location_city,
              text: 'Federal and Provincial Stats',
              onTap: () => Navigator.pushNamed(context, Routes.provincePage)),
          _createDrawerItem(
              icon: Icons.location_on_rounded,
              text: 'Covid Tracker',
              onTap: () => Navigator.pushNamed(context, Routes.mapsPage)),
          _createDrawerItem(
              icon: Icons.check_box_rounded,
              text: 'Self Test',
              onTap: () =>
                  Navigator.pushNamed(context, Routes.agreenmentScreen)),
          _createDrawerItem(
            icon: Icons.bloodtype_sharp,
            text: 'Plasma Donation',
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => LoginScreen())),
          ),
          // Navigator.pushNamed(context, Routes.loginSignupPage)),
          Divider(),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   fit: BoxFit.fill,
            //   image: AssetImage('res/images/drawer_header_background.png'),
            // ),
            ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("STAY HOME STAY SAFE",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
