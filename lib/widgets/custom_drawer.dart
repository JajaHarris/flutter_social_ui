import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/chat_screen.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';
import 'package:flutter_social_ui/screens/settings_screen.dart';

typedef TPage PageConstructor<TPage extends Widget>();

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
      _createDrawerItems(Icons.dashboard, 'Home', () => HomeScreen()),
      _createDrawerItems(Icons.chat, 'Chat', () => ChatScreen()),
      _createDrawerItems(
          Icons.account_circle, 'Profile', () => ProfileScreen()),
      _createDrawerItems(Icons.settings, 'Settings', () => SettingsScreen())
    ];
  }

  Widget _createDrawerItems<T extends Widget>(
    IconData icon,
    String title,
    PageConstructor<T> destination,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        Navigator.pushReplacement(
            _context,
            MaterialPageRoute(
              builder: (_) => destination(),
            ));
      },
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
