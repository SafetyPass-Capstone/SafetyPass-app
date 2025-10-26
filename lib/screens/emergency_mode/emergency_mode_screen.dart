import 'package:flutter/material.dart';
import 'package:safetypass_app/constants/colors.dart';
import 'package:safetypass_app/widgets/organisms/stadium_map_widget.dart';

class EmergencyModeScreen extends StatelessWidget {
  const EmergencyModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SafetyPassColor.systemGray05,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A5F),
        title: const Text("긴급 대피 모드"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: StadiumMapWidget(),
        ),
      ),
    );
  }
}
