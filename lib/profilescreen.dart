import 'package:decorly/favouritescreen.dart';
import 'package:decorly/listingscreen.dart';
import 'package:decorly/realestateapp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0D1321);
    const cardColor = Color(0xFF1C2331);
    const accentColor = Color(0xFFB4FF00);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 70),

            // Custom Header Row (PROFILE + Settings icon)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24), // for left spacing (to balance design)
                  Text(
                    'YOUR COLLECTION',
                    style: GoogleFonts.bebasNeue(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Icon(Icons.settings, weight: 16, color: Colors.white70),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Profile Image
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/profile4.png',
                  ), // replace with your image
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.edit, color: Colors.black, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Name
            const Text(
              'Robbin Van Persie',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            // Options List
            buildProfileOption(Icons.person, 'Personal Information'),
            buildProfileOption(Icons.tune, 'Account Preference'),
            buildProfileOption(Icons.policy, 'Policies'),

            const Spacer(),

            // Bottom Navigation Bar
            Padding(
              padding: const EdgeInsets.only(left: 64, right: 64),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home),
                      color: Colors.white70,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Realestateapp(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.list),
                      color: Colors.white70,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ListingScreen(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.white70,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FavouriteScreen(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.person),
                      color: accentColor,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget
  Widget buildProfileOption(IconData icon, String title) {
    const cardColor = Color(0xFF1C2331);
    const accentColor = Color(0xFFB4FF00);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: accentColor, size: 18),
        ],
      ),
    );
  }
}
