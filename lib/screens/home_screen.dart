import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: _title(context),
        bottom: _tabBar(),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      'FRENZY',
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 10),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabController,
      indicatorWeight: 3,
      labelColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(fontSize: 18),
      tabs: <Widget>[
        Tab(text: 'Trending'),
        Tab(text: 'Latest'),
      ],
    );
  }
}
