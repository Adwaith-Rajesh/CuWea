import 'package:cuwea/components/cuwea_logo.dart';
import 'package:flutter/material.dart';

class DrawerChild extends StatelessWidget {
  const DrawerChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 72, 110, 187),
            Color.fromARGB(255, 233, 129, 69),
          ],
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            child: CuWeaLogo(),
          ),
        ],
      ),
    );
  }
}
