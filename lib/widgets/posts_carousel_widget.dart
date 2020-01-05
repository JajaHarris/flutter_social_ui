import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/post_model.dart';

class PostsCarouselWidget extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;
  BuildContext _context;

  PostsCarouselWidget({this.pageController, this.title, this.posts});

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postsCaption(),
        _postsCarousel(),
      ],
    );
  }

  Widget _postsCarousel() {
    return Container(
      height: 400,
      child: PageView.builder(
        controller: pageController,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPost(context, index);
        },
      ),
    );
  }

  Widget _buildPost(BuildContext context, int index) {
    var post = posts[index];

    //used to slightly increase size of image as they are scrolled thru
    return AnimatedBuilder(
      animation: pageController,
      child: Stack(
        children: <Widget>[_postImage(post), _imageOverlay(post)],
      ),
      builder: (BuildContext context, Widget widget) {
        double value = 1;

        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
    );
  }

  Container _postImage(Post post) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 6),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          height: 400,
          width: 300,
          image: AssetImage(post.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imageOverlay(Post post) {
    //Parent widget is a stack so Positioned places the frosted overlay at the bottom of the stack
    return Positioned(
      left: 10,
      bottom: 10,
      right: 10,

      //this is the actual frosted container at bottom of image
      child: Container(
        child: _overlayInfo(post), //creates the stats i.e. # of likes, comments, etc.
        padding: EdgeInsets.all(12),
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
      ),
    );
  }

  Widget _overlayInfo(Post post) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _overlayTitle(post),
        _overlayLocation(post),
        SizedBox(height: 6),
        _overlayStats(post)
      ],
    );
  }

  Widget _overlayStats(Post post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _createStat(Icons.favorite, Colors.red, post.likes),
        _createStat(
          Icons.comment,
          Theme.of(_context).primaryColor,
          post.comments,
        ),
      ],
    );
  }

  Widget _createStat(IconData statIcon, Color iconColor, int statCount) {
    return Row(
      children: <Widget>[
        Icon(statIcon, color: iconColor),
        SizedBox(width: 6),
        Text(
          statCount.toString(),
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }

  Widget _overlayTitle(Post post) {
    return Text(
      post.title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _overlayLocation(Post post) {
    return Text(
      post.location,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _postsCaption() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
