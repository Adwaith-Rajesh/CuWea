import 'package:cuwea/components/cw_text.dart';
import 'package:flutter/material.dart';

class CurrentCondition extends StatelessWidget {
  final String conditionText;

  const CurrentCondition({super.key, required this.conditionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.33),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CWText(
            text: 'Today\'s Weather',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          CWText(
            text: conditionText,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          )
        ],
      ),
    );
  }
}
