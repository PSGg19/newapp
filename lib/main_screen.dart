import 'package:flutter/material.dart';
import 'second_screen.dart'; // Import the screen with the list of items

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Padding from the left for all items
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(200)),
            // Image
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5, // Image width
              child: Image.asset(
                'assets/image1.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16), // Spacing between image and text
            // Text 1
            const Text(
              'CRED Mint',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4), // Spacing between texts
            // Text 2
            const Text(
              'Grow your savings.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4), // Spacing between texts
            // Text 3
            const Text(
              '3x faster',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const Spacer(), // Push the button to the bottom
            // Button
            SizedBox(
              width: double.infinity, // Cover almost the whole width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0), // Padding inside the button
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Optional: rounded corners
                  ),
                ),
                child: const Text(
                  'Go to Category',
                  style: TextStyle(color: Colors.black), // Button text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
