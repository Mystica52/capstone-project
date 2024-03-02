import 'package:flutter/material.dart';
import 'package:ticketpro1/companypages/addingBus.dart';
import 'package:ticketpro1/companypages/companyBusDetails.dart';
import 'package:ticketpro1/companypages/companySetting.dart';


class CustomCompanyBottomAppBar extends StatelessWidget {
  const CustomCompanyBottomAppBar({super.key});

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
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => companyBusDetails(),
                              ),
                            );
                // Navigate to home page or perform home-related action
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline,color: Colors.white,),
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddingBus(),
                              ),
                            );
                // Navigate to privacy page or perform privacy-related action
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings,color: Colors.white,),
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingCompanyPage(),
                              ),
                            );
                // Navigate to settings page or perform settings-related action
              },
            ),
          ],
        ),
      ),
    );
  }
}
