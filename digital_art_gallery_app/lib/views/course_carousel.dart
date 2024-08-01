import 'package:flutter/material.dart';

class CourseCarousel extends StatefulWidget {
  const CourseCarousel({super.key});

  @override
  State<CourseCarousel> createState() => _CourseCarouselState();
}

class _CourseCarouselState extends State<CourseCarousel> {
  final ScrollController _scrollController = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollButtons);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollButtons);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    setState(() {
      _canScrollLeft = _scrollController.position.pixels > 0;
      _canScrollRight = _scrollController.position.pixels <
          _scrollController.position.maxScrollExtent;
    });
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 220,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 220,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 280,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 14,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://th.bing.com/th/id/R.032806df13f94d5ef651e9af713a0b67?rik=N9jNwpEj3sOC6w&pid=ImgRaw&r=0',
                        height: 200,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('designer_pro', style: TextStyle(fontSize: 12)),
                          Text('Likes', style: TextStyle(fontSize: 12)),
                          Text('Comments', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          child: AnimatedOpacity(
            opacity: _canScrollLeft ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const Icon(Icons.chevron_left, size: 40),
              onPressed: _canScrollLeft ? _scrollLeft : null,
              color: Colors.blue,
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: AnimatedOpacity(
            opacity: _canScrollRight ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const Icon(Icons.chevron_right, size: 40),
              onPressed: _canScrollRight ? _scrollRight : null,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
