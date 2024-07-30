import 'package:art/views/courses_view.dart';
import 'package:art/views/for_you_view.dart';
import 'package:art/views/job_view.dart';
import 'package:art/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNavigationButton(context, 'For You', const ForYouView()),
                _buildNavigationButton(context, 'Courses', const CoursesView()),
                _buildNavigationButton(context, 'Jobs', const JobView()),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String text, Widget destination) {
    return NavigationButton(
      text: text,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => destination),
        );
        Navigator.of(context).pop();
      },
    );
  }
}
