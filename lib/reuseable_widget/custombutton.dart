import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final bool isloading;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isloading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size.fromHeight(50),
      ),
      child: isloading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            )
          : Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
    );
  }
}
