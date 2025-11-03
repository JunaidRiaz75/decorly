import 'package:decorly/favouritescreen.dart';
import 'package:decorly/listingscreen.dart';
import 'package:decorly/profilescreen.dart';
import 'package:decorly/realestateapp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0D1321);
    const cardColor = Color(0xFF1C2331);
    const accentColor = Color(0xFFB4FF00);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'PROPERTIES LISTING',
          style: GoogleFonts.bebasNeue(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/profile4.png'),
            ),
          ),
        ],
      ),

      // === STACK: Content + Floating Nav Bar ===
      body: Stack(
        children: [
          // === MAIN CONTENT ===
          Column(
            children: [
              // === 1. ROW: Categories + Arrow + Filter ===
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
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
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        color: accentColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),

              // === 2. LEFT SIDEBAR + RIGHT LISTINGS ===
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LEFT: Categories List
                      Expanded(
                        flex: 2,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _categoryItem(Icons.apartment, 'Flats', true),
                            _categoryItem(Icons.home_work, 'Studios', false),
                            _categoryItem(Icons.location_city, 'Condos', false),
                            _categoryItem(Icons.villa, 'Villas', false),
                            _categoryItem(Icons.roofing, 'Lofts', false),
                            _categoryItem(
                              Icons.lightbulb_outline,
                              'Smart',
                              false,
                            ),
                            _categoryItem(Icons.location_city, 'Urban', false),
                            _categoryItem(Icons.house, 'Manor', false),
                            _categoryItem(Icons.landscape, 'Plots', false),
                            _categoryItem(Icons.beach_access, 'Coast', false),
                          ],
                        ),
                      ),

                      const SizedBox(width: 12),

                      // RIGHT: Property Cards
                      Expanded(
                        flex: 5,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _propertyCard(
                              image: 'assets/r1.png',
                              title: 'De Pijp',
                              location: 'Amsterdam',
                              beds: 3,
                              baths: 4,
                              sqft: 4200,
                              price: '\$14,904',
                            ),
                            const SizedBox(height: 16),
                            _propertyCard(
                              image: 'assets/r2.png',
                              title: 'Jordaan',
                              location: 'Amsterdam',
                              beds: 2,
                              baths: 3,
                              sqft: 3200,
                              price: '\$12,908',
                            ),
                            const SizedBox(height: 16),
                            _propertyCard(
                              image: 'assets/r3.png',
                              title: 'Oud‑Zuid',
                              location: 'Amsterdam',
                              beds: 3,
                              baths: 5,
                              sqft: 4100,
                              price: '\$14,320',
                            ),
                            const SizedBox(height: 16),
                            _propertyCard(
                              image: 'assets/r4.png',
                              title: 'SKYLINE RESIDENCE',
                              location: 'Amsterdam',
                              beds: 3,
                              baths: 4,
                              sqft: 4200,
                              price: '\$14,343',
                            ),
                            const SizedBox(
                              height: 100,
                            ), // Extra space for nav bar
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // === FLOATING NAVIGATION BAR (Your Container) ===
          Positioned(
            bottom: 20,
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
                    color: Colors.white70,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const Realestateapp(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.list),
                    color: accentColor,
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

  // === CATEGORY ITEM ===
  Widget _categoryItem(IconData icon, String title, bool isActive) {
    const accentColor = Color(0xFFB4FF00);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
      decoration: BoxDecoration(
        color: isActive ? accentColor : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? accentColor : Colors.white24,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: isActive ? Colors.black : Colors.white70),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.black : Colors.white70,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isActive)
            const Icon(Icons.arrow_forward_ios, size: 13, color: Colors.black),
        ],
      ),
    );
  }

  // === PROPERTY CARD ===
  Widget _propertyCard({
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
      height: 210,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 210,
            fit: BoxFit.cover,
          ),
          Container(
            height: 210,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xCC000000), Colors.transparent],
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
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
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _specChip(Icons.bed, '$beds Beds'),
                    const SizedBox(width: 8),
                    _specChip(Icons.bathtub, '$baths Baths'),
                    const SizedBox(width: 8),
                    _specChip(Icons.square_foot, '$sqft sqft'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.inter(
                        color: accentColor,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Read More',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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

  Widget _specChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 10),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.inter(color: Colors.white70, fontSize: 8),
          ),
        ],
      ),
    );
  }
}
