import 'package:flutter/material.dart';
import 'list_item.dart'; // Import your Items widget

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Money section
            SectionContainer(
              title: 'Money',
              itemCount: 3,
            ),
            const SizedBox(height: 16), // Padding between sections

            // Benefits section
            SectionContainer(
              title: 'Benefits',
              itemCount: 5,
            ),
            const SizedBox(height: 16), // Padding between sections

            // Bills section
            SectionContainer(
              title: 'Bills',
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String title;
  final int itemCount;

  const SectionContainer({
    required this.title,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding inside the container
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8), // Padding between title and items
          Column(
            children: List.generate(
              itemCount,
              (index) => const Items(),
            ),
          ),
        ],
      ),
    );
  }
}
