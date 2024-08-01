import 'package:art/controllers/courses_controller.dart';
import 'package:art/shared/widgets/common_app_bar.dart';
import 'package:art/shared/widgets/common_drawer.dart';
import 'package:art/views/for_you/widgets/design_card.dart';
import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWebLayout = MediaQuery.of(context).size.width >= 700;
    final CoursesController controller = CoursesController();
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const CommonDrawer(),
      body: Column(
        children: [
          CommonAppBar(
            isWebLayout: isWebLayout,
            controller: controller,
            onMenuPressed: () {
              controller.scaffoldKey.currentState?.openDrawer();
            },
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return constraints.maxWidth < 700
                    ? _buildMobileLayout(constraints)
                    : _buildWebLayout(constraints);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(),
          _buildPopularCategories(),
          _buildCourseGrid(constraints),
        ],
      ),
    );
  }

  Widget _buildWebLayout(BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(),
          _buildPopularCategories(),
          _buildCourseGrid(constraints),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 1200,
        height: 150,
        child: Image.network(
          'https://th.bing.com/th/id/R.032806df13f94d5ef651e9af713a0b67?rik=N9jNwpEj3sOC6w&pid=ImgRaw&r=0',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPopularCategories() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              Text('Category 1'),
              Text('Category 1'),
              Text('Category 1'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Popular Courses',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseGrid(BoxConstraints constraints) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
        final double itemWidth =
            (constraints.maxWidth - (16 * (crossAxisCount + 1))) /
                crossAxisCount;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              14,
              (index) => SizedBox(
                width: itemWidth,
                height: itemWidth * 1.2,
                child: const DesignCard(),
              ),
            ),
          ),
        );
      },
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth < 600) return 1;
    if (screenWidth < 900) return 2;
    if (screenWidth < 1200) return 3;
    return 4;
  }
}
