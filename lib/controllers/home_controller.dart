import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
}
