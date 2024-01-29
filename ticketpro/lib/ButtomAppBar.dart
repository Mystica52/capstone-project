import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent, // Set the color to transparent
      elevation: 0, // Remove the default shadow
      child: Container(
        height: 56, // Set the height of the bottom app bar
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white, // Add a line color between the body and bottom app bar
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white,),
              onPressed: () {
                // Navigate to home page or perform home-related action
              },
            ),
            IconButton(
              icon: const Icon(Icons.privacy_tip,color: Colors.white,),
              onPressed: () {
                // Navigate to privacy page or perform privacy-related action
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings,color: Colors.white,),
              onPressed: () {
                // Navigate to settings page or perform settings-related action
              },
            ),
          ],
        ),
      ),
    );
  }
}
