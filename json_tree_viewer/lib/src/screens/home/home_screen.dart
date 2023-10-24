import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText('JSON Tree Viewer', style: textTheme.titleLarge),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: SelectableText(
                'Simple JSON Viewer that runs completely on-client. No data exchange',
                style: textTheme.titleMedium,
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: Text(
                'Load JSON',
                style: textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
