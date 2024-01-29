import 'package:flutter/material.dart';
import 'package:ticketpro/ButtomAppBar.dart';
import 'package:ticketpro/headerWidget.dart';

class BusDetails extends StatelessWidget {
    final List<Map<String, String>> tableData = [
    {'plate no': 'RA12','source': 'City A', 'dest': 'City B', 'number of seats': '3','time': '13:49'},
    {'plate no': 'RD12','source': 'City A', 'dest': 'City B', 'number of seats': '3','time': '14:49'},
    // Add more rows as needed
  ];

  BusDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'bus details',
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
            buildHeaderCell('Plate No'),
            buildHeaderCell('Src'),
            buildHeaderCell('Dest'),
            buildHeaderCell('No of seats'),
            buildHeaderCell('Time'),
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
              buildTableCell(rowData['plate no']),
              buildTableCell(rowData['source']),
              buildTableCell(rowData['dest']),
              buildTableCell(rowData['number of seats']),
              buildTableCell(rowData['time']),
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
 Widget buildTableCell(String? text) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(text ?? '', 
        style: const TextStyle(
          color: Colors.white,
          fontFamily:'Poppins' ),
          ), // Use the null-aware operator ?? to handle null
      ),
    ),
  );
}

}
