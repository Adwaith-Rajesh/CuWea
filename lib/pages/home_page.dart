import 'dart:ui';

import 'package:cuwea/components/info_glance.dart';
import 'package:cuwea/components/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _submitText = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffB0C3F0), Color(0xff5C79B3)],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: CitySearchBox(
              onSubmitted: (value) {
                setState(() {
                  _submitText = value;
                });
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InfoGlance(
                  temp: 30,
                  feelsLike: 22,
                  city: 'Kakkad',
                  dateTime: 'Sun, 11:07',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
