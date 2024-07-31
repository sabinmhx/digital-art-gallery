import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {},
        child: const Row(
          children: [
            Icon(Icons.filter_alt_sharp),
            Text('filter'),
          ],
        ),
      ),
    );
  }
}
