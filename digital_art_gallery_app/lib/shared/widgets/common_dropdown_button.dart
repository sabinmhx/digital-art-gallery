import 'package:flutter/material.dart';

class CommonDropdownButton extends StatelessWidget {
  const CommonDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(5),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        hint: const Text('Popular'),
        items: const [
          DropdownMenuItem(value: 'popular', child: Text('Popular')),
          DropdownMenuItem(value: 'for you', child: Text('For You')),
        ],
        onChanged: (value) {},
        dropdownColor: Colors.white,
      ),
    );
  }
}
