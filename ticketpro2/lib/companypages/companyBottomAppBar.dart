import 'package:flutter/material.dart';
import 'package:ticketpro2/companypages/addingBus.dart';
import 'package:ticketpro2/companypages/companyALLBus.dart';
import 'package:ticketpro2/companypages/companySetting.dart';



class CustomCompanyBottomAppBar extends StatefulWidget {
  final token;

  const CustomCompanyBottomAppBar({required this.token, super.key});

  @override
  _CustomCompanyBottomAppBarState createState() => _CustomCompanyBottomAppBarState();
}

class _CustomCompanyBottomAppBarState extends State<CustomCompanyBottomAppBar> {
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
                                builder: (context) => CompanyAllBuses(token: widget.token),
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
                                builder: (context) =>  AddingBus(token: widget.token,),
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
                                builder: (context) =>  SettingCompanyPage(token: widget.token),
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
