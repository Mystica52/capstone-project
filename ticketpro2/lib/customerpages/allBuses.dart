

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticketpro2/ButtomAppBar.dart';
import 'package:ticketpro2/customerpages/busDetails.dart';
import 'package:ticketpro2/customerpages/busbooking.dart';
import 'package:ticketpro2/headerWidget.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart'as http;


class AllBuses extends StatefulWidget {
  final token ;
  const AllBuses({@required this.token, super.key});

  @override
  _AllBusesState createState() => _AllBusesState();
}

class _AllBusesState extends State<AllBuses> {
  late List< dynamic> tableData = [];
  late String role;
  @override
  void initState(){
    super.initState();
        FlutterError.onError = (details) {
      // Handle the error, e.g., log it or show a dialog
      print('Caught error: ${details.exception}');
    };
    Map<String, dynamic> jwtDecodedToken  = JwtDecoder.decode(widget.token);

    role = jwtDecodedToken['role'];
    fetchData();
    
    
  }
    void fetchData() async {
    // final response = await http.get(Uri.parse('http://192.168.1.68:3000/api/bus-routes'));
    final response = await http.get(Uri.parse('http://10.46.113.107:3000/api/bus-routes'));
    
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['routes'];
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
              Text(role) ,
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

                
                children: [Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
      children: [
        Row(
          children: [
            buildHeaderCell('Origin'),
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
              buildTableCell(context, rowData['origin'], false,rowData['origin'], rowData['destination']),
              buildTableCell(context, rowData['destination'], false,rowData['origin'], rowData['destination']),
              buildTableCell(context, null,true,rowData['origin'], rowData['destination']),
            ],
          ),
      ],
    ),
                ),
                ],
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
               fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
Widget buildTableCell(BuildContext context, String? text, bool isIssuedBy, String origin, String destination) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: isIssuedBy
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BusDetails(token: widget.token,origin: origin, destination:destination)),
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
