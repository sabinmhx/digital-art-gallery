import 'package:flutter/material.dart';

/// The controller for the for you view.
class ForYouController extends ChangeNotifier {
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
    notifyListeners();
  }
}
