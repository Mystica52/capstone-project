

import 'package:flutter/material.dart';
import 'package:ticketpro/ButtomAppBar.dart';
import 'package:ticketpro/headerWidget.dart';
import 'package:ticketpro/customerpages/busDetails.dart';

class AllBuses extends StatelessWidget {
    final List<Map<String, String>> tableData = [
    {'source': 'City A', 'destination': 'City B', 'issuedBy': 'John Doe'},
    {'source': 'City X', 'destination': 'City Y', 'issuedBy': 'Jane Smith'},
    // Add more rows as needed
  ];

  AllBuses({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                 appBar: AppBar(
        title: const Text(
          'All buses available',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF425C5A),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const MyAppHeader(), 
              Container(
                width: 350,
                height: 400,
                decoration: ShapeDecoration(
                  color: const Color(0x2DFFCEA2),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0x33FFCEA2)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x2DFFCEA2),
                      blurRadius: 22,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
      children: [
        Row(
          children: [
            buildHeaderCell('Source'),
            buildHeaderCell('Destination'),
            buildHeaderCell('More Info'),
          ],
        ),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        // Generate rows dynamically
        for (var rowData in tableData)
          Row(
            children: [
              buildTableCell(context, rowData['source'], false),
              buildTableCell(context, rowData['destination'], false),
              buildTableCell(context, null,true),
            ],
          ),
      ],
    ),
                ),
                
              ),
              const SizedBox(height: 18),
                      Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 241, 136, 38),
                        ),
                        child: const Center(
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      
            ],
          ),
        ),
      ),
       bottomNavigationBar: const CustomBottomAppBar()
    );
  }
  Widget buildHeaderCell(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, 
              fontFamily:'Poppins' ,
               fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
Widget buildTableCell(BuildContext context, String? text, bool isIssuedBy) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: isIssuedBy
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BusDetails()),
                  );
                },
                 style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 241, 136, 38), // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Set the border radius
                  ),
                  minimumSize: const Size(100, 50)
                  ),
                child: const Text('more', 
                style: TextStyle(
                  color: Colors.white,
                  
                  fontSize: 14
                  ),
                  
                  // overflow: TextOverflow.ellipsis, // Set the overflow property
                  softWrap: false,),
              )
            : Text(text ?? '',style: const TextStyle(color: Colors.white),
            
          ), // Use the null-aware operator ?? to handle null
      ),
    ),
  );
}


}
