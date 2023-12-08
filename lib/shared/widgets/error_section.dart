import 'package:flutter/material.dart';

class ErrorSection extends StatelessWidget {
  const ErrorSection({required this.onRetry, super.key});
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Something went wrong.\nPlease try again',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: onRetry,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: Colors.transparent,
            ),
            child: const Icon(
              Icons.refresh_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
