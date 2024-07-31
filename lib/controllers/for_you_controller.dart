import 'package:art/models/card_data.dart';
import 'package:art/models/design_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The controller for the for you view.
class ForYouController extends GetxController {
  /// The controller for the search bar.
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  /// Key for the scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final FocusNode _dropdownFocusNode = FocusNode();
  FocusNode get dropdownFocusNode => _dropdownFocusNode;

  String? dropdownValue;

  @override
  void dispose() {
    super.dispose();
    dropdownFocusNode.dispose();
  }

  void updateDropdownValue(String? value) {
    dropdownValue = value;
    update;
  }

  final List<CardData> items = [
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
    DesignData(
      imageUrl:
          'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
      title: 'Cool Design 1',
      designerName: 'designer1',
      likes: 1000,
      views: 5000,
    ),
  ];
}
