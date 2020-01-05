import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screens/chat_screen.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';

enum Routes { Chat, Home, Login, Map, Profile, Settings }

abstract class AppNavigator {
  static final _constructors = {
    Routes.Home: () => HomeScreen(),
    Routes.Chat: () => ChatScreen(),
  };

  static pushReplacement(
    BuildContext context,
    Routes destination
    ) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => _constructors[destination](),
      ),
    );
  }
}
