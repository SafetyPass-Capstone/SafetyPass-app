import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('행사장 등록')),
      body: const Center(child: Text('등록 화면(목업)')),
    );
  }
}
