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
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: SelectableText(
                controller.text,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
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
