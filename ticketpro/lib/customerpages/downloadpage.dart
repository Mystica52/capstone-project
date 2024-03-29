import 'package:flutter/material.dart';
import 'package:ticketpro/ButtomAppBar.dart';
import 'package:ticketpro/headerWidget.dart';

class DownloadPage extends StatefulWidget {


  DownloadPage({super.key});
  @override
  _DownloadPageState createState() => _DownloadPageState();
}
class _DownloadPageState extends State<DownloadPage> {
  final List<Map<String, String >> tableData1 = [
    {'plate no': 'RA12','src': 'City A', 'dest': 'City B', 'seat no': '3','time': '13:49', 'date':'11,02,24','amount': '2000' },
    
    // Add more rows as needed
  ];
  String name = "John Doe";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirm',
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
              Center(
                              child: Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  const EdgeInsets.only(left: 16.0), 
                        child: Row(
                          children: [
                            Text("Ticket issued by:   ",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          Text(name , style: TextStyle(color: Colors.white))
                        ],
                      ),
                      ),

                      SizedBox(height: 65,),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeaderCell('Date'),
                          buildHeaderCell('Time'),
                          buildHeaderCell('Seat No'),
                        ],
                      ),
                      SizedBox(height: 25,),
                      for (var rowData in tableData1)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTableCell(rowData['date'],false),
                          buildTableCell(rowData['time'],false),
                          buildTableCell(rowData['seat no'],false),
                          ],
                          ),
                      SizedBox(height: 65,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeaderCell('origin'),
                          buildHeaderCell('Stop city'),
                          buildHeaderCell('Plate N'),
                          buildHeaderCell('Amount'),
                          
                        ],
                      ),
                      SizedBox(height: 25,),
                      for (var rowData in tableData1)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTableCell(rowData['src'], false),
                          buildTableCell(rowData['dest'], false),
                          buildTableCell(rowData['plate no'], false),
                          buildTableCell(rowData['amount'], true),
                          ],
          ),
                    ],
                   ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.download, color: Colors.white,),
                              SizedBox(width: 5),
                              Text(
                            "Download ticket",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),
                          ),
                          
                            ],
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
        // padding: const EdgeInsets.all(8),
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
 Widget buildTableCell(String? text,bool isAmount ) {
  return Expanded(
    child: Container(
      // padding: const EdgeInsets.all(8),

      child: Center(
        child: Text(text ?? '', 
        style: TextStyle(
          color:Colors.white,
          fontFamily:'Poppins' ),
          ), // Use the null-aware operator ?? to handle null
      ),
    ),
  );
}

}
