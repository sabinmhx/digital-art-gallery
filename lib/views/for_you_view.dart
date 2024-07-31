import 'package:art/controllers/for_you_controller.dart';
import 'package:art/widgets/category_list.dart';
import 'package:art/widgets/common_app_bar.dart';
import 'package:art/widgets/common_drawer.dart';
import 'package:art/widgets/course_carousel.dart';
import 'package:art/widgets/dropdown_button.dart';
import 'package:art/widgets/filter_button.dart';
import 'package:art/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouView extends StatelessWidget {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    final ForYouController controller = Get.put(ForYouController());

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const CommonDrawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final isWebLayout = constraints.maxWidth >= 900;
          return Column(
            children: [
              CommonAppBar(
                isWebLayout: isWebLayout,
                controller: controller,
                onMenuPressed: () {
                  controller.scaffoldKey.currentState?.openDrawer();
                },
              ),
              Expanded(
                child: _buildResponsiveLayout(context, constraints, controller),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context,
      BoxConstraints constraints, ForYouController controller) {
    final isWebLayout = constraints.maxWidth >= 1200;

    int columns = (constraints.maxWidth / 300).floor();
    columns = columns.clamp(1, 4);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWebLayout ? 70.0 : 15.0,
          vertical: isWebLayout ? 120.0 : 60.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonDropdownButton(),
                if (isWebLayout) const CategoryList(),
                const FilterButton(),
              ],
            ),
            const SizedBox(height: 18),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                childAspectRatio: 1.27,
              ),
              itemCount: controller.items.length,
              itemBuilder: (context, index) =>
                  ReusableCard(data: controller.items[index]),
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
}
