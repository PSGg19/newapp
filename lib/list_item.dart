import 'package:flutter/material.dart';
import 'main_screen.dart'; // Import the MainScreen widget
import 'model.dart';

class Items extends StatelessWidget {
  // Static data
  final String imageUrl =
      'https://d2tecn3vwkchpd.cloudfront.net/mobile-assets/merchants/294e5c20b8eb11ed8c4a15b837168c3f.png';
  final String name = 'cred';
  final String description = 'cred is a good app';

  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 8.0), // Padding between items
        child: Container(
          height: 100, // Smaller height for each item
          color: Colors.black,
          child: Row(
            children: [
              // Square box with image
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit:
                        BoxFit.cover, // Ensures the image covers the square box
                  ),
                  borderRadius:
                      BorderRadius.circular(8), // Optional: rounded corners
                ),
              ),
              // Text description
              Expanded(
                child: Container(
                  color: Colors.black,
                  padding:
                      const EdgeInsets.all(8.0), // Padding inside the container
                  child: Align(
                    alignment:
                        Alignment.centerLeft, // Align content to the left
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align text to the start (left)
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      children: [
                        Text(name, style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                            height: 4), // Spacing between name and description
                        Text(description,
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
