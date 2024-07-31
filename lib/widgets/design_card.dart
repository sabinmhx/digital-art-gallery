import 'package:flutter/material.dart';

class DesignCard extends StatefulWidget {
  const DesignCard({super.key});

  @override
  State<DesignCard> createState() => _DesignCardState();
}

class _DesignCardState extends State<DesignCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 180,
      child: Column(
        children: [
          MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: Stack(
              children: [
                Container(
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
                if (isHovered)
                  const Positioned(
                    bottom: 15,
                    left: 15,
                    right: 15,
                    child: Row(
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
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Row(
            children: [
              CircleAvatar(
                radius: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Text('designer_pro'),
              Spacer(flex: 1),
              Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    size: 15.0,
                  ),
                  SizedBox(width: 4.0),
                  Text('2,000'),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    size: 15.0,
                  ),
                  SizedBox(width: 4.0),
                  Text('10,000'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
