import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 5, // Adjust the count based on your needs
        itemBuilder: (context, index) {
          return ListTile(
              title: ClipRRect(
                  // Clip the container to match rounded corners
                  borderRadius: BorderRadius.circular(
                      8.0), // Rounded corners for the container
                  child: Container(
                    height: screenHeight / 7, // 1/7th of screen height
                    width: screenWidth, // Full screen width
                    color: Colors.white, // Inner color of the container
                  )
              )
          );
        },
      ),
    );
  }
}
