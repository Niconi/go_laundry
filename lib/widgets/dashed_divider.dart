import 'package:flutter/material.dart';
import 'dart:math' as math;

class DashedDivider extends StatelessWidget {
  const DashedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[200],
        ),
        const SizedBox(height: 8),
        ClipPath(
          clipper: TicketClipper(),
          child: Container(
            height: 20,
            color: Colors.grey[100],
          ),
        ),
      ],
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    // Radius lingkaran
    double circleRadius = 8.0;
    // Jarak antar lingkaran
    double circleGap = 16.0;
    
    // Mulai dari kiri atas
    path.lineTo(0, 0);
    
    // Hitung berapa banyak lingkaran yang bisa masuk
    int numberOfCircles = (size.width / circleGap).floor();
    
    for (int i = 0; i < numberOfCircles; i++) {
      double centerX = (i * circleGap) + (circleGap / 2);
      
      // Gambar setengah lingkaran
      path.lineTo(centerX - circleRadius, 0);
      path.arcToPoint(
        Offset(centerX + circleRadius, 0),
        radius: Radius.circular(circleRadius),
        clockwise: false,
      );
    }
    
    // Tutup ke kanan bawah
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    
    // Kembali ke awal
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}