import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF651fff),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: onTap,
              child: const Text(
                'APPLY',
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}
