import 'package:art/controllers/courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({
    super.key,
    required this.controller,
  });

  final CoursesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'The Ultimate Digital Painting Course - Beginner to Advanced',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Everything from drawing fundamentals to professional painting techniques',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              RatingStars(
                value: controller.courseRating,
                starBuilder: (index, color) => Icon(
                  index < controller.courseRating.floor()
                      ? Icons.star
                      : Icons.star_outline_sharp,
                  color: color,
                ),
                starCount: 5,
                starSize: 20,
                valueLabelColor: Colors.transparent,
                valueLabelTextStyle: const TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0,
                ),
                valueLabelRadius: 0,
                valueLabelVisibility: true,
                maxValueVisibility: false,
                animationDuration: const Duration(milliseconds: 1000),
                valueLabelPadding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                ),
                valueLabelMargin: const EdgeInsets.only(right: 8),
                starOffColor: const Color(0xffe7e8ea),
                starColor: Colors.yellow,
              ),
              const SizedBox(width: 5.0),
              const Text('(1200)'),
            ],
          ),
          const Text(
            '24 total hours  •  24 lectures  •  Beginner',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5.0),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '\$11.99',
                ),
                WidgetSpan(
                  child: SizedBox(width: 5.0),
                ),
                TextSpan(
                  text: '\$15.99',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
