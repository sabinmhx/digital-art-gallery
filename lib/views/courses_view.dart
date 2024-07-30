import 'package:flutter/material.dart';

/// The view for the courses.
class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              'http://www.rc.au.net/blog/wp-content/uploads/20221001_083-089-Edit-3.jpg')
        ],
      ),
    );
  }
}
