import 'package:flutter/material.dart';
import 'package:safetypass_app/constants/colors.dart';
import 'package:safetypass_app/widgets/atoms/texts/texts.dart';

class EmergencyButton extends StatelessWidget {
  final String text;
  final bool isOn;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const EmergencyButton({
    Key? key,
    required this.text,
    required this.isOn,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              backgroundColor ?? (isOn ? Colors.red : const Color(0xFFF9F9F9)),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor ?? (isOn ? Colors.red : Colors.red),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: SafetyPassTextStyle.bodyEB17.copyWith(
            color: textColor ?? (isOn ? SafetyPassColor.white : Colors.red),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
