import 'package:decorly/listingscreen.dart';
import 'package:decorly/profilescreen.dart';
import 'package:decorly/realestateapp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0D1321);
    const cardColor = Color(0xFF1C2331);
    const accentColor = Color(0xFFB4FF00);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/profile4.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Property List
            Expanded(
              child: ListView(
                children: [
                  buildPropertyCard(
                    image: 'assets/r1.png',
                    title: 'De Pijp',
                    location: 'Amsterdam',
                    beds: 3,
                    baths: 4,
                    sqft: 4200,
                    price: '\$14,904',
                  ),
                  const SizedBox(height: 20),
                  buildPropertyCard(
                    image: 'assets/r2.png',
                    title: 'Jordaan',
                    location: 'Amsterdam',
                    beds: 2,
                    baths: 3,
                    sqft: 3200,
                    price: '\$12,908',
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),

            // Simple Bottom Navigation Container
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
                      color: accentColor,
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
                      color: Colors.white70,
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

  // Property Card Widget
  static Widget buildPropertyCard({
    required String image,
    required String title,
    required String location,
    required int beds,
    required int baths,
    required int sqft,
    required String price,
  }) {
    const accentColor = Color(0xFFB4FF00);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.asset(
            image,
            height: 216,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Container(
              height: 216,
              width: 364,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.favorite, color: accentColor, size: 18),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.bed, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$beds Beds',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.bathtub, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$baths Baths',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.square_foot,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$sqft sqft',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: accentColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: const Text(
                        'Read More',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
