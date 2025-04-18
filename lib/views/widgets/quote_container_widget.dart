import 'package:flutter/material.dart';

class QuoteContainerWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final VoidCallback onPressed;

  const QuoteContainerWidget({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(labelText),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            constraints: BoxConstraints(minHeight: 56),
            decoration: BoxDecoration(
              // TODO: Set to theme color
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
              // TODO: Set to theme color
              color: Colors.grey[50],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: SelectableText(
                controller.text,
                style: TextStyle(
                  fontSize: 16,
                  // TODO: Set to theme color
                  color: Colors.black,
                ),
                // enable text wrapping
                maxLines: null,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16)),
          onPressed: onPressed,
          child: Icon(Icons.copy),
        ),
      ],
    );
  }
}
