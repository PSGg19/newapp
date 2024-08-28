import 'package:flutter/material.dart';
import 'list_item.dart'; // Import your Items widget
import 'main_screen.dart';
import 'third_screen.dart'; // Import the ThirdScreen widget

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _isGridView = false;

  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Items List'),
        backgroundColor: Colors.black,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _toggleView,
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.zero, // Sharp corners
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Opacity(
                            opacity: !_isGridView
                                ? 1.0
                                : 0.0, // Show list icon only if not in grid view
                            child: Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                    width: 16), // Add spacing between toggle and new button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.zero, // Sharp corners
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_downward, // Downward arrow icon
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionContainer(
              title: 'Benefits',
              itemCount: 2,
              isGridView: _isGridView,
            ),
            const SizedBox(height: 16), // Padding between sections

            SectionContainer(
              title: 'Bills',
              itemCount: 4,
              isGridView: _isGridView,
            ),
            const SizedBox(height: 16), // Padding between sections

            SectionContainer(
              title: 'Shop',
              itemCount: 2,
              isGridView: _isGridView,
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
  final bool isGridView;

  const SectionContainer({
    required this.title,
    required this.itemCount,
    required this.isGridView,
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
          isGridView
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Show 4 items per row
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: itemCount,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.zero, // Sharp corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/image1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.zero, // Sharp corners
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: 4), // Spacing between image and text
                          const Text(
                            'Mint',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Column(
                  children: List.generate(
                    itemCount,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const Items(),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
