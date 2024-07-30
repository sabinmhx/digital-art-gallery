import 'package:art/controllers/home_controller.dart';
import 'package:art/views/course_view.dart';
import 'package:art/views/for_you_view.dart';
import 'package:art/views/job_view.dart';
import 'package:art/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The home view of the digital art gallery app.
class HomeView extends StatelessWidget {
  final Widget child;

  /// Constructs a [HomeView] with the specified [child].
  const HomeView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final bool isWebLayout = MediaQuery.of(context).size.width >= 700;

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: Drawer(
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const ForYouView();
                        }));
                      }),
                  NavigationButton(
                      text: 'Courses',
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const CoursesView();
                        }));
                      }),
                  NavigationButton(
                      text: 'Jobs',
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const JobView();
                        }));
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
      ),
      body: Column(
        children: [
          Container(
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
            child: isWebLayout
                ? _buildWebLayout(context, controller)
                : _buildMobileLayout(controller),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context, HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildLogo(),
            NavigationButton(
                text: 'For You',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ForYouView();
                  }));
                }),
            NavigationButton(
                text: 'Courses',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const CoursesView();
                  }));
                }),
            NavigationButton(
                text: 'Jobs',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const JobView();
                  }));
                }),
          ],
        ),
        _buildSearchField(controller),
        _buildUserProfile(),
      ],
    );
  }

  Widget _buildMobileLayout(HomeController controller) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            controller.scaffoldKey.currentState?.openDrawer();
          },
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

  Widget _buildSearchField(HomeController controller) {
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

  Widget _buildLogo() {
    return InkWell(
      onTap: () {},
      child: const Text(
        'Logo',
        style: TextStyle(fontSize: 20),
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
}
