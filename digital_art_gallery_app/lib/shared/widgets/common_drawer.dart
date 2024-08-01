import 'package:art/shared/widgets/navigation_button.dart';
import 'package:art/views/courses/courses_view.dart';
import 'package:art/views/for_you/for_you_view.dart';
import 'package:art/views/jobs_view.dart';
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
                NavigationButton(
                    text: 'For You',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ForYouView()),
                      );
                      Navigator.of(context).pop();
                    }),
                NavigationButton(
                    text: 'Courses',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CoursesView()),
                      );
                      Navigator.of(context).pop();
                    }),
                NavigationButton(
                    text: 'Jobs',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const JobsView()),
                      );
                      Navigator.of(context).pop();
                    }),
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
}
