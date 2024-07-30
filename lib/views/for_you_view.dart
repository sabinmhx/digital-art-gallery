import 'package:art/views/home_view.dart';
import 'package:art/widgets/course_carousel.dart';
import 'package:art/widgets/design_card.dart';
import 'package:flutter/material.dart';

/// The home view.
class ForYouView extends StatelessWidget {
  /// This view represents the home screen of the digital art gallery app.
  /// It displays various design cards, a course carousel, and allows filtering
  /// and sorting options based on user preferences.
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 700) {
            return _buildMobileLayout(constraints);
          } else {
            return _buildWebLayout(constraints);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return SingleChildScrollView(
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
    );
  }

  Widget _buildWebLayout(BoxConstraints constraints) {
    return SingleChildScrollView(
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
              child: const DesignCard(),
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
