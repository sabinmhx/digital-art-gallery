import 'package:art/controllers/home_controller.dart';
import 'package:art/views/course_carousel.dart';
import 'package:art/views/couse_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildForYouButton(),
                  _buildCoursesButton(),
                  _buildJobsButton(),
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 700) {
            return _buildMobileLayout(constraints);
          } else {
            return _buildWebLayout(controller, constraints);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return Column(
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
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
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
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDropDown(),
                    _filterButton(),
                  ],
                ),
                _buildResponsiveGrid(constraints),
                const Divider(height: 100),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child: Text(
                    'Hot and Fresh Courses',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const CourseCarousel(),
                const Divider(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWebLayout(
      HomeController controller, BoxConstraints constraints) {
    return Column(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildLogo(),
                  _buildForYouButton(),
                  _buildCoursesButton(),
                  _buildJobsButton(),
                ],
              ),
              _buildSearchField(controller),
              _buildUserProfile(),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDropDown(),
                    _buildCategoryList(),
                    _filterButton(),
                  ],
                ),
                _buildResponsiveGrid(constraints),
                const Divider(height: 100),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child: Text(
                    'Hot and Fresh Courses',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const CourseCarousel(),
                const Divider(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _filterButton() {
    return IconButton(
      icon: const Icon(Icons.filter_alt),
      onPressed: () {},
    );
  }

  Widget _buildCategoryList() {
    return const SizedBox(
      height: 100,
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Category 1'),
          Text('Category 1'),
          Text('Category 1'),
        ],
      ),
    );
  }

  Widget _buildDropDown() {
    return SizedBox(
      width: 100,
      child: DropdownButtonFormField(
        hint: const Text('Popular'),
        items: const [
          DropdownMenuItem(
            value: 'popular',
            child: Text('Popular'),
          ),
          DropdownMenuItem(
            value: 'for you',
            child: Text('For You'),
          ),
        ],
        onChanged: (value) {},
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

  Widget _buildForYouButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      child: InkWell(onTap: () {}, child: const Text('For You')),
    );
  }

  Widget _buildCoursesButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: InkWell(
        onTap: () {},
        child: const Text('Courses'),
      ),
    );
  }

  Widget _buildJobsButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: InkWell(
        onTap: () {},
        child: const Text('Jobs'),
      ),
    );
  }

  Widget _buildResponsiveGrid(BoxConstraints constraints) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double gap = 1.0;
        final int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
        final double availableWidth =
            constraints.maxWidth - (gap * (crossAxisCount - 1));
        final double itemWidth = availableWidth / crossAxisCount;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: List.generate(
            14,
            (index) => SizedBox(
              width: itemWidth,
              height: itemWidth,
              child: const CourseCard(),
            ),
          ),
        );
      },
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth < 600) {
      return 1;
    } else if (screenWidth < 900) {
      return 2;
    } else if (screenWidth < 1200) {
      return 3;
    } else {
      return 4;
    }
  }
}
