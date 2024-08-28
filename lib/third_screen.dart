import 'package:flutter/material.dart';
import 'list_item.dart'; // Import your Items widget
import 'main_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
        title: const Text('Categories'),
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
                          alignment: Alignment.centerLeft,
                          child: Opacity(
                            opacity: _isGridView
                                ? 1.0
                                : 0.0, // Show grid icon only if in grid view
                            child: Icon(
                              Icons.grid_view,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
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
            CategoryContainer(
              title: 'Benefits',
              items: List.generate(
                2,
                (index) => GridItem(),
              ),
              isGridView: _isGridView,
            ),
            const SizedBox(height: 16), // Padding between categories
            CategoryContainer(
              title: 'Bills',
              items: List.generate(
                4,
                (index) => GridItem(),
              ),
              isGridView: _isGridView,
            ),
            const SizedBox(height: 16), // Padding between categories
            CategoryContainer(
              title: 'Shop',
              items: List.generate(
                2,
                (index) => GridItem(),
              ),
              isGridView: _isGridView,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final bool isGridView;

  const CategoryContainer({
    required this.title,
    required this.items,
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
                  itemCount: items.length,
                  itemBuilder: (context, index) => items[index],
                )
              : Column(
                  children: List.generate(
                    items.length,
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
                        child: items[index],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.zero, // Sharp corners
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image1.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
          ),
          const SizedBox(height: 4), // Spacing between image and text
          const Text(
            'Mint',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
