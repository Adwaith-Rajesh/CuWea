import 'package:cuwea/components/cw_text.dart';
import 'package:flutter/material.dart';

class CuWeaLogo extends StatelessWidget {
  const CuWeaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CWText(
        text: 'CuWea', fontSize: 48, fontWeight: FontWeight.bold);
  }
}
