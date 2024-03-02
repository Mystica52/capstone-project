import 'package:flutter/material.dart';
import 'package:ticketpro2/customerpages/allBuses.dart';
import 'package:ticketpro2/customerpages/privacy.dart';
import 'package:ticketpro2/customerpages/setting.dart';


class CustomBottomAppBar extends StatefulWidget {
  final token;
  const CustomBottomAppBar({required this.token, super.key});

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent, // Set the color to transparent
      elevation: 0, 
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
                                builder: (context) => AllBuses(token: widget.token),
                              ),
                            );
                // Navigate to home page or perform home-related action
              },
            ),
            IconButton(
              icon: const Icon(Icons.privacy_tip,color: Colors.white,),
              onPressed: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PrivacyPage(),
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
                                builder: (context) =>   SettingPage( token:widget.token ,),
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
