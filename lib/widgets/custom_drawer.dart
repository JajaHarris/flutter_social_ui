import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/utils/app_navigator.dart';

class CustomDrawer extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Drawer(
      child: Column(
        children: <Widget>[
          _userComponent(),
          ..._drawerItems(),
        ],
      ),
    );
  }

  Widget _userComponent() {
    return Stack(
      children: <Widget>[
        _backgroundImage(),
        _userInfo(),
      ],
    );
  }

  List<Widget> _drawerItems() {
    return <Widget>[
      _createDrawerItems(Icons.dashboard, 'Home', Routes.Home),
      _createDrawerItems(Icons.chat, 'Chat', Routes.Chat),
      _createDrawerItems(Icons.account_circle, 'Profile', Routes.Profile),
      _createDrawerItems(Icons.settings, 'Settings', Routes.Settings)
    ];
  }

  Widget _createDrawerItems(
    IconData icon,
    String title,
    Routes destination,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () => AppNavigator.pushReplacement(_context, destination),
    );
  }

  Widget _backgroundImage() {
    return Image(
      height: 200,
      width: double.infinity,
      image: AssetImage(currentUser.backgroundImageUrl),
      fit: BoxFit.cover,
    );
  }

  Widget _userInfo() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _userImage(),
          SizedBox(width: 6),
          _userName(),
        ],
      ),
    );
  }

  Container _userImage() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: Theme.of(_context).primaryColor,
          )),
      child: ClipOval(
        child: Image(
          image: AssetImage(currentUser.profileImageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _userName() {
    return Text(
      currentUser.name,
      style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5),
    );
  }
}
