import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.onGoHome,
  });

final void Function() onGoHome;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              const CircleAvatar(
                radius: 50, // You can adjust the radius
                backgroundImage: AssetImage('assets/images/foto_pribadi.jpg'), // Use local asset
                // Or use a network image like in the picture
                // backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/009/211/185/non_2x/female-user-profile-avatar-is-a-woman-a-character-for-a-screen-saver-with-emotions-vector.jpg'),
              ),
              SizedBox(height: screenSize.height * 0.03), // Responsive spacing
              const Text(
                'Nama Mahasiswa',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ), // TextStyle
              ), // Text
              const Text(
                'Muhammad Azhari Nur Pratama',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ), // Text
              SizedBox(height: screenSize.height * 0.02),
              const Text(
                'NPM',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const Text(
                '2210010326', // Static NPM
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.04),

              // Reusable info cards
              _buildInfoCard(
                context: context,
                icon: Icons.email,
                label: 'Email',
                value: 'muhazhari123@gmail.com',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              _buildInfoCard(
                context: context,
                icon: Icons.phone,
                label: 'Telepon',
                value: '+62 85390455567',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              _buildInfoCard(
                context: context,
                icon: Icons.school,
                label: 'Jurusan',
                value: 'Teknik Informatika',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              _buildInfoCard(
                context: context,
                icon: Icons.calendar_today,
                label: 'Tanggal Lahir',
                value: '09 Maret 2004',
                screenSize: screenSize,
              ),

              const SizedBox(height: 30),
              TextButton(
                onPressed: onGoHome,
                child: const Text('Kembali', style: TextStyle(color: Colors.white)),
              ),
            ],
          ), // Column
        ), // SingleChildScrollView
      ), // Center
    ); // Scaffold
  }

  // Helper method to build consistent data cards
  Widget _buildInfoCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required Size screenSize,
  }) {
    return Container(
      width: screenSize.width * 0.88, // Responsive width
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(125, 7, 82, 123), // Card background color
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3), // Shadow for depth
          ),
        ],
      ), // BoxDecoration
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ), // Text
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Text
              ],
            ), // Column
          ), // Expanded
        ],
      ), // Row
    ); // Container
  }
}