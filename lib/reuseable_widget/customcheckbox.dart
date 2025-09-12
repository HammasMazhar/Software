import 'package:flutter/material.dart';

class CustomCheckboxWithText extends StatelessWidget {
  final bool value;
  final VoidCallback onChanged;
  final String text;

  const CustomCheckboxWithText({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onChanged,
          child: Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              color: value ? Colors.green : Colors.transparent,
            ),
            child: value
                ? const Icon(Icons.check, size: 10, color: Colors.white)
                : null,
          ),
        ),
        TextButton(
          onPressed: onChanged,
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
