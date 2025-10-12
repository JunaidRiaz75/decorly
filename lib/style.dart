//import 'package:decorly/palette.dart';
import 'package:decorly/platte.dart';
import 'package:decorly/room.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StyleSelectionScreen(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class StyleSelectionScreen extends StatefulWidget {
  const StyleSelectionScreen({super.key});

  @override
  _StyleSelectionScreenState createState() => _StyleSelectionScreenState();
}

class _StyleSelectionScreenState extends State<StyleSelectionScreen> {
  String? _selectedStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => ChooseRoomScreen()));
          },
        ),
        title: Text('Step 3 / 4', style: TextStyle(color: Colors.black)),
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
              'Select Style',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Select Your Desired Design Style To Start Creating Your Ideal Interior',
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
                _buildStepIndicator(active: false),
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
                  _buildStyleCard('Minimal', 'assets/minimal.png'),
                  _buildStyleCard('Scandinavian', 'assets/scand.png'),
                  _buildStyleCard('Bohemian', 'assets/bohemian.png'),
                  _buildStyleCard('Modern', 'assets/modern.png'),
                  _buildStyleCard('Industrial', 'assets/industerial.png'),
                  _buildStyleCard('Japandi', 'assets/pandi.png'),
                  _buildStyleCard('Vintage', 'assets/minimal.png'),
                  _buildStyleCard('Classic', 'assets/pandi.png'),
                  _buildStyleCard('Rustic', 'assets/modern.png'),
                  _buildStyleCard('Contemporary', 'assets/modern.png'),
                  _buildStyleCard('Mid-century', 'assets/bohemian.png'),
                  _buildStyleCard('Traditional', 'assets/industerial.png'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedStyle == null
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaletteSelectionScreen(),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedStyle == null
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

  Widget _buildStyleCard(String title, String assetPath) {
    bool isSelected = _selectedStyle == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStyle = title;
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
                  image: DecorationImage(
                    image: AssetImage(assetPath),
                    fit: BoxFit.cover,
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
