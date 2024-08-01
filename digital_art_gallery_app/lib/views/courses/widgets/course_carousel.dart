import 'package:art/controllers/courses_controller.dart';
import 'package:art/views/courses/widgets/course_container.dart';
import 'package:flutter/material.dart';

class CourseCarousel extends StatefulWidget {
  const CourseCarousel({super.key});

  @override
  State<CourseCarousel> createState() => _CourseCarouselState();
}

class _CourseCarouselState extends State<CourseCarousel> {
  final ScrollController _scrollController = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = true;
  final controller = CoursesController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollButtons);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollButtons);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    setState(() {
      _canScrollLeft = _scrollController.position.pixels > 0;
      _canScrollRight = _scrollController.position.pixels <
          _scrollController.position.maxScrollExtent;
    });
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 220,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 220,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 350,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 14,
            itemBuilder: (BuildContext context, int index) {
              return CourseContainer(controller: controller);
            },
          ),
        ),
        Positioned(
          left: 0,
          top: 70,
          child: AnimatedOpacity(
            opacity: _canScrollLeft ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const Icon(Icons.chevron_left, size: 40),
              onPressed: _canScrollLeft ? _scrollLeft : null,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 70,
          child: AnimatedOpacity(
            opacity: _canScrollRight ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const Icon(Icons.chevron_right, size: 40),
              onPressed: _canScrollRight ? _scrollRight : null,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
