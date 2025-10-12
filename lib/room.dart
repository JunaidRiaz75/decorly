import 'package:decorly/style.dart';
import 'package:decorly/upload.dart';
import 'package:flutter/material.dart';

class ChooseRoomScreen extends StatefulWidget {
  const ChooseRoomScreen({super.key});

  @override
  State<ChooseRoomScreen> createState() => _ChooseRoomScreenState();
}

class _ChooseRoomScreenState extends State<ChooseRoomScreen> {
  String? selectedRoom;

  final List<String> rooms = [
    "Living Room",
    "Bed Room",
    "Dining Room",
    "Gaming Room",
    "Office",
    "Garden",
    "Study Room",
    "Kitchen",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Row (Back + Step)
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RoomPhotoStepScreen(),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    const Text(
                      "Step 2 / 4",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Progress bar (4 steps)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepIndicator(active: true),
                  _buildStepIndicator(active: true),
                  _buildStepIndicator(),
                  _buildStepIndicator(),
                ],
              ),

              const SizedBox(height: 30),

              // Title and subtitle
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose Room",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select a room to design and see it transformed in your chosen style",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ),

              const SizedBox(height: 30),

              // Room Buttons Grid
              Expanded(
                child: GridView.builder(
                  itemCount: rooms.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 2.8,
                  ),
                  itemBuilder: (context, index) {
                    final room = rooms[index];
                    final isSelected = selectedRoom == room;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRoom = room;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF9C4A2D)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            room,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: selectedRoom != null
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => StyleSelectionScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9C4A2D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator({bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        height: 4,
        width: 50,
        decoration: BoxDecoration(
          color: active ? Colors.black87 : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
