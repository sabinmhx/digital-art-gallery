import 'package:art/views/home_view.dart';
import 'package:flutter/material.dart';

/// The view for the courses.
class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView(
      child: Column(
        children: [
          Image.network('https://hd.wallpaperswide.com/thumbs/long_road-t2.jpg')
        ],
      ),
    );
  }
}
