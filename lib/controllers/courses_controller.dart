import 'package:art/models/card_data.dart';
import 'package:art/models/course_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The controller for the course view.
class CoursesController extends GetxController {
  /// The controller for the search bar.
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  /// Key for the scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final List<CardData> items = [
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
    CourseData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'The Ultimate Digital Painting Course - Beginner to Advanced',
      description:
          'Everything from drawing fundamentals to professional painting techniques',
      rating: 4.5,
      reviewCount: 1200,
      info: '24 total hours  •  24 lectures  •  Beginner',
      price: '\$11.99',
      originalPrice: '\$15.99',
    ),
  ];
}
