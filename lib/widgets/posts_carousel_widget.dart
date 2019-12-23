import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/post_model.dart';

class PostsCarouselWidget extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarouselWidget({this.pageController, this.title, this.posts});

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _followingCaption(),
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

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6
              ),
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              height: 400,
              width: 300,
              image: AssetImage(post.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _followingCaption() {
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
