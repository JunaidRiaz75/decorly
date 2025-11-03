import 'package:decorly/favouritescreen.dart';
import 'package:decorly/listingscreen.dart';
import 'package:decorly/profilescreen.dart';
import 'package:decorly/realestateapp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0D1321);
    const cardColor = Color(0xFF1C2331);
    const accentColor = Color(0xFFB4FF00);

    return Scaffold(
      backgroundColor: backgroundColor,

      // === APPBAR ===
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Image.asset('assets/Frame.png', width: 32),
        ),
        title: Text(
          'AMSTERDAM',
          style: GoogleFonts.bebasNeue(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/profile4.png'),
            ),
          ),
        ],
      ),

      // === BODY WITH FLOATING NAV ===
      body: Stack(
        children: [
          // === SCROLLABLE CONTENT ===
          ListView(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 24,
              bottom: 140,
            ),
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Anything',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(Icons.search, color: accentColor),
                  filled: true,
                  fillColor: const Color(0xFF1A1F38),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
                style: GoogleFonts.inter(color: Colors.white),
              ),
              const SizedBox(height: 32),

              // Featured Properties Title
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'FEATURED PROPERTIES',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Categories Row
              Row(
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: accentColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, color: accentColor),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Property Cards
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
              const SizedBox(height: 20),
              buildPropertyCard(
                image: 'assets/r3.png',
                title: 'Jordaan',
                location: 'Amsterdam',
                beds: 2,
                baths: 3,
                sqft: 3200,
                price: '\$12,908',
              ),
              const SizedBox(height: 140),
            ],
          ),

          // === FLOATING NAVIGATION BAR ===
          Positioned(
            bottom: 40,
            left: 64,
            right: 64,
            child: Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: accentColor, // Active
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const Realestateapp(),
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
                          builder: (_) => const ListingScreen(),
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
                          builder: (_) => const FavouriteScreen(),
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
                          builder: (_) => const ProfileScreen(),
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
    );
  }

  // === PROPERTY CARD (UNCHANGED) ===
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
      margin: const EdgeInsets.only(bottom: 16),
      height: 216,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.asset(
            image,
            height: 216,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 216,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
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
