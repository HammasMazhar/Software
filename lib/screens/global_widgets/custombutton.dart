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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size.fromHeight(50),
      ),
      child: isloading
          ? SizedBox(
              height: 25,
              width: 25,
              child: const CircularProgressIndicator(
                strokeWidth: 3,
              ))
          : Text(
              text,
            ),
    );
  }
}
