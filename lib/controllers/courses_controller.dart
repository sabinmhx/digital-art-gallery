import 'package:flutter/material.dart';

/// The controller for the course view.
class CoursesController {
  /// The controller for the search bar.
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  /// Key for the scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  double get courseRating => 2.5;
}
