import 'package:art/models/card_data.dart';
import 'package:art/models/course_data.dart';
import 'package:art/models/design_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ReusableCard extends StatefulWidget {
  final CardData data;

  const ReusableCard({super.key, required this.data});

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: Stack(
              children: [
                Container(
                  width: 280,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.data.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (widget.data is DesignData && isHovered)
                  Positioned(
                    bottom: 15,
                    left: 15,
                    right: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(Icons.favorite_border, color: Colors.white),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          if (widget.data is CourseData) _buildCourseDetails(),
          if (widget.data is DesignData) _buildDesignDetails(),
        ],
      ),
    );
  }

  Widget _buildCourseDetails() {
    final courseData = widget.data as CourseData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.data.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          courseData.description,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            RatingStars(
              value: courseData.rating,
              starBuilder: (index, color) => Icon(
                index < courseData.rating.floor()
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
              starOffColor: const Color(0xffe7e8ea),
              starColor: Colors.yellow,
            ),
            const SizedBox(width: 5.0),
            Text('(${courseData.reviewCount})'),
          ],
        ),
        Text(
          courseData.info,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5.0),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: courseData.price,
                style: const TextStyle(color: Colors.black),
              ),
              const WidgetSpan(
                child: SizedBox(width: 5.0),
              ),
              TextSpan(
                text: courseData.originalPrice,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesignDetails() {
    final designData = widget.data as DesignData;
    return Row(
      children: [
        const CircleAvatar(radius: 10),
        const SizedBox(width: 10),
        Text(designData.designerName),
        const Spacer(flex: 1),
        Row(
          children: [
            const Icon(Icons.thumb_up, size: 15.0),
            const SizedBox(width: 4.0),
            Text('${designData.likes}'),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            const Icon(Icons.remove_red_eye, size: 15.0),
            const SizedBox(width: 4.0),
            Text('${designData.views}'),
          ],
        ),
      ],
    );
  }
}
