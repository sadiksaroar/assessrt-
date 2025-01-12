import 'package:flutter/material.dart';

class StayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Curved image section
            Stack(
              children: [
                ClipPath(
                  clipper: CurvedClipper(),
                  child: Image.asset(
                    'assets/living_room.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: MediaQuery.of(context).size.width / 2 - 40,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50), // To accommodate the CircleAvatar overlap
            // Name and rating
            Text(
              'Marylin Hymel',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.green, size: 16),
                SizedBox(width: 4),
                Text(
                  '4.6',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Welcome message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "I'm thrilled to have you here and hope you have a wonderful experience. If you need anything or have any questions during your time with me, please don't hesitate to reach out.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Self Check-in Guide'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Get Passcode'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
