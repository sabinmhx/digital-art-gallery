import 'package:art/views/courses_view.dart';
import 'package:art/views/for_you_view.dart';
import 'package:art/views/jobs_view.dart';
import 'package:art/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final bool isWebLayout;
  final dynamic controller;
  final VoidCallback onMenuPressed;

  const CommonAppBar({
    super.key,
    required this.isWebLayout,
    required this.controller,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 7,
          ),
        ],
      ),
      child: isWebLayout ? _buildWebLayout(context) : _buildMobileLayout(),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildLogo(),
            NavigationButton(
                text: 'For You',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ForYouView()),
                  );
                }),
            NavigationButton(
                text: 'Courses',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const CoursesView()),
                  );
                }),
            NavigationButton(
                text: 'Jobs',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const JobsView()),
                  );
                }),
          ],
        ),
        _buildSearchField(),
        _buildUserProfile(),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onMenuPressed,
        ),
        _buildLogo(),
        const Spacer(flex: 2),
        Row(
          children: [
            const Icon(Icons.search),
            _buildUserProfile(),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return InkWell(
      onTap: () {},
      child: const Text(
        'Logo',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: controller.searchController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return const Row(
      children: [
        Icon(Icons.browse_gallery_rounded),
        SizedBox(width: 10),
        Text('John Doe'),
        SizedBox(width: 10),
        CircleAvatar(),
      ],
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
