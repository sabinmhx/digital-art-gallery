import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({super.key});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Stack(
            children: [
              Image.network(
                'https://www.pictureframesexpress.co.uk/blog/wp-content/uploads/2020/05/7-Tips-to-Finding-Art-Inspiration-Header-1024x649.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              if (isHovered)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Editorial Illustrations',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.favorite_border, color: Colors.white),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(),
            Text('designer_pro'),
            Text('Likes'),
            Text('Comments'),
          ],
        ),
      ],
    );
  }
}
