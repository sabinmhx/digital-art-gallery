import 'package:art/controllers/for_you_controller.dart';
import 'package:art/widgets/common_app_bar.dart';
import 'package:art/widgets/common_drawer.dart';
import 'package:art/widgets/course_carousel.dart';
import 'package:art/widgets/design_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouView extends StatelessWidget {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWebLayout = MediaQuery.of(context).size.width >= 700;
    final ForYouController controller = Get.find<ForYouController>();

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
                const double gap = 16.0;
                final int crossAxisCount =
                    _getCrossAxisCount(constraints.maxWidth);
                final double availableWidth =
                    constraints.maxWidth - (gap * (crossAxisCount - 1));
                final double itemWidth = availableWidth / crossAxisCount;
                return constraints.maxWidth < 700
                    ? _buildMobileLayout(constraints, itemWidth)
                    : _buildWebLayout(constraints, itemWidth);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints, double itemWidth) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropDown(),
                _filterButton(),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              children: List.generate(
                14,
                (index) => SizedBox(
                  width: itemWidth,
                  height: itemWidth * 1.2, // Adjust aspect ratio as needed
                  child: const DesignCard(),
                ),
              ),
            ),
            const Divider(height: 32),
            const Text(
              'Hot and Fresh Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const CourseCarousel(),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout(BoxConstraints constraints, double itemWidth) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 16),
            Wrap(
              children: List.generate(
                14,
                (index) => SizedBox(
                  width: itemWidth,
                  height: itemWidth * 1.2, // Adjust aspect ratio as needed
                  child: const DesignCard(),
                ),
              ),
            ),
            const Divider(height: 32),
            const Text(
              'Hot and Fresh Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const CourseCarousel(),
          ],
        ),
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
      height: 50,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Category 1'),
          Text('Category 2'),
          Text('Category 3'),
        ],
      ),
    );
  }

  Widget _buildDropDown() {
    return SizedBox(
      width: 120,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(),
        ),
        hint: const Text('Popular'),
        items: const [
          DropdownMenuItem(value: 'popular', child: Text('Popular')),
          DropdownMenuItem(value: 'for you', child: Text('For You')),
        ],
        onChanged: (value) {},
      ),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth < 600) return 1;
    if (screenWidth < 900) return 2;
    if (screenWidth < 1200) return 3;
    return 4;
  }
}
