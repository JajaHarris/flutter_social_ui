import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_users_widget.dart';
import 'package:flutter_social_ui/widgets/posts_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
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
      body: _body(context),
      drawer: CustomDrawer(),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      children: <Widget>[
        FollowingUsersWidget(),
        PostsCarouselWidget(
          pageController: _pageController,
          title: 'Posts',
          posts: posts
        ),
      ],
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
