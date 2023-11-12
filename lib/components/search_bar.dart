import 'package:flutter/material.dart';

class CitySearchBox extends StatelessWidget {
  final void Function(String)? onSubmitted;

  const CitySearchBox({
    super.key,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.33),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: const TextStyle(
          color: Color(0xffF6F8FF),
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          fillColor: Colors.transparent,
          filled: true,
          border: InputBorder.none,
          hintText: 'Search City',
          hintStyle: TextStyle(
            color: Color(0xffF6F8FF),
          ),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
