import 'package:art/models/card_data.dart';

class CourseData extends CardData {
  @override
  final String imageUrl;
  @override
  final String title;
  final String description;
  final double rating;
  final int reviewCount;
  final String info;
  final String price;
  final String originalPrice;

  CourseData({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.info,
    required this.price,
    required this.originalPrice,
  });
}
