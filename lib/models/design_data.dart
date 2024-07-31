import 'package:art/models/card_data.dart';

class DesignData extends CardData {
  @override
  final String imageUrl;
  @override
  final String title;
  final String designerName;
  final int likes;
  final int views;

  DesignData({
    required this.imageUrl,
    required this.title,
    required this.designerName,
    required this.likes,
    required this.views,
  });
}
