import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaletteSelectionScreen(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class PaletteSelectionScreen extends StatefulWidget {
  const PaletteSelectionScreen({super.key});

  @override
  _PaletteSelectionScreenState createState() => _PaletteSelectionScreenState();
}

class _PaletteSelectionScreenState extends State<PaletteSelectionScreen> {
  String? _selectedPalette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text('Step 4 / 4', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[400], thickness: 2)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '──────',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[400], thickness: 2)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              'Select Palette',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Choose A Color Palette To Bring Your Vision To Life !\nSelect From Curated Shades To Transform Your Space.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          // Step Indicators
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepIndicator(active: true),
                _buildStepIndicator(active: true),
                _buildStepIndicator(active: true),
                _buildStepIndicator(active: true),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildPaletteCard('Terracotta', [
                    Color(0xFFD2691E),
                    Color(0xFFC68642),
                    Color(0xFF8B4513),
                  ]),
                  _buildPaletteCard('Sage Green', [
                    Color(0xFF9EA7A1),
                    Color(0xFF87A96B),
                    Color(0xFF6B705C),
                  ]),
                  _buildPaletteCard('Warm Beige', [
                    Color(0xFFF5F5DC),
                    Color(0xFFD2B48C),
                    Color(0xFFC2A679),
                  ]),
                  _buildPaletteCard('Burnt Sienna', [
                    Color(0xFF8A360F),
                    Color(0xFFC35817),
                    Color(0xFFE67E22),
                  ]),
                  _buildPaletteCard('Olive', [
                    Color(0xFF6B705C),
                    Color(0xFF556B2F),
                    Color(0xFF808000),
                  ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedPalette == null
                  ? null
                  : () {
                      // Navigate to the next screen or process the selection
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextScreen()),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedPalette == null
                    ? Colors.grey
                    : Color(0xFFD2691E),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator({required bool active}) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Color(0xFFD2691E) : Colors.grey[400],
        border: active ? null : Border.all(color: Colors.grey[400]!, width: 1),
      ),
    );
  }

  Widget _buildPaletteCard(String title, List<Color> colors) {
    bool isSelected = _selectedPalette == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPalette = title;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: isSelected
              ? BorderSide(color: Color(0xFFD2691E), width: 3)
              : BorderSide.none,
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for the next screen (replace with your actual next screen)
class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Screen')),
      body: Center(child: Text('Proceed to the next step here')),
    );
  }
}
