import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ticketpro2/ButtomAppBar.dart';
import 'package:ticketpro2/customerpages/busbooking.dart';
import 'package:ticketpro2/headerWidget.dart';
import 'package:http/http.dart'as http;


class BusDetails extends StatefulWidget {
   final token ;
  final String origin; 
  final String destination;

  const BusDetails({super.key, required this.token,required this.origin, required this.destination});

  @override
  _BusDetailsState createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  late List<dynamic> tableData = [];
    late String userId;
  @override
  void initState(){
    super.initState();
        FlutterError.onError = (details) {
      // Handle the error, e.g., log it or show a dialog
      print('Caught error: ${details.exception}');
    };
    Map<String, dynamic> jwtDecodedToken  = JwtDecoder.decode(widget.token);

    userId = jwtDecodedToken['userId'];

    fetchData();
    
    
  }
    void fetchData() async {

        // final response = await http.get(Uri.parse('http://192.168.1.68:3000/api/bus-on-route?origin=${widget.origin}&destination=${widget.destination}'));
      final response = await http.get(Uri.parse('http://10.46.113.107:3000/api/bus-on-route?origin=${widget.origin}&destination=${widget.destination}'));
    if (response.statusCode == 200) {
   final List<dynamic> responseData = json.decode(response.body)['buses'];
    final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(responseData);
    setState(() {
      tableData = data;
    });
    } else {
      throw Exception('Failed to load data');
    }
  }
  

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
                child:ListView(
                  shrinkWrap: true,
                
                children:[ Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
      children: [
        Row(
          children: [
            buildHeaderCell('Plate No'),
            // buildHeaderCell('Src'),
            // buildHeaderCell('Dest'),
            buildHeaderCell('No of seats'),
            buildHeaderCell('Time'),
            buildHeaderCell('Price'),
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
              buildTableCell(rowData['plateNo']),
              // buildTableCell(rowData['origin']),
              // buildTableCell(rowData['destination']),
              buildTableCell(rowData['available_seats']),
              buildTableCell(rowData['departure_time']),
              buildTableCell(rowData['price']),
            ],
          ),
      ],
    ),
                ),
                ]
              ),
              ),
              const SizedBox(height: 18,),
                       SizedBox(
                        width: 300,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BusBooking()),
                  );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:  const Color.fromARGB(255, 241, 136, 38),
                              ),
                            child: const Center(
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
        ),
                      ),
                      
            ],
          ),
        ),
      ),
       bottomNavigationBar:  CustomBottomAppBar(token: widget.token)
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
               fontWeight: FontWeight.bold,
               fontSize: 13
            ),
            softWrap: false,
          ),
        ),
      ),
    );
  }
 Widget buildTableCell(dynamic data) {
 final  text = data.toString();
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(text ?? '', 
        style: const TextStyle(
          color: Colors.white,
          fontFamily:'Poppins',
          fontSize: 13
          ),
          softWrap: false,
          ), // Use the null-aware operator ?? to handle null
      ),
    ),
  );
}

}
