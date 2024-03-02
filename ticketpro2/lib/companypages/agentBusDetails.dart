import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ticketpro2/companypages/agentALLBUS.dart';
import 'package:ticketpro2/companypages/agentCustomButtomAppBar.dart';
import 'package:ticketpro2/headerWidget.dart';
import 'package:http/http.dart'as http;



class AgentBusDetails extends StatefulWidget {
  final token;
  final String origin; 
  final String destination;
  const AgentBusDetails({super.key, required this.token,required this.origin, required this.destination});

  @override
  _AgentBusDetailsState createState() => _AgentBusDetailsState();
}

class _AgentBusDetailsState extends State<AgentBusDetails> {
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

    void _updateBus(String plateNo, String date, String seats, String time, String price, String busId) async {
  try {
    // final response = await http.put(Uri.parse('http://192.168.1.68:3000/api/updateBus/${busId}'),
    final response = await http.put(Uri.parse('http://10.46.113.107:3000/api/updateBus/${busId}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}',
      },
      body: jsonEncode(<String, dynamic>{
        'plateNo': plateNo,
        'date': date,
        'available_seats': seats,
        'departure_time': time,
        'price': price,
      }),
    );  
    var resp= response.statusCode;
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Bus updated successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16,
      );
      // Refresh the bus details after update
      fetchData();
    } else {
      print('error at $resp');
      Fluttertoast.showToast(
        msg: "Failed to update bus",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  } catch (error) {
    Fluttertoast.showToast(
      msg: "Error updating bus",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}

void _showEditDialog(BuildContext context, dynamic initialData,String busId) {
  final plateNoController = TextEditingController(text: initialData['plateNo']);
  final dateController = TextEditingController(text: initialData['date']);
  final seatsController = TextEditingController(text: initialData['available_seats'].toString());
  final departureTimeController = TextEditingController(text: initialData['departure_time']);
  final priceController = TextEditingController(text: initialData['price'].toString());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Bus Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: plateNoController,
                decoration: InputDecoration(hintText: 'Plate No'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(hintText: 'Date'),
                keyboardType: TextInputType.datetime,
              ),
                                          TextField(
                controller: seatsController,
                decoration: InputDecoration(hintText: 'Seats Available'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: departureTimeController,
                decoration: InputDecoration(hintText: 'Departure Time'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _updateBus(
                plateNoController.text,
                dateController.text,
                seatsController.text,
                departureTimeController.text,
                priceController.text,
                busId
              );
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}


    Future<void> _deleteBus(String busId) async {
    try {
      // final response = await http.delete(Uri.parse('http://192.168.1.68:3000/api/deleteBus/${busId}'));
      final response = await http.delete(Uri.parse('http://10.46.113.107:3000/api/deleteBus/${busId}'));
      
      print(response);
      if (response.statusCode == 200) {
        print('Bus deleted successfully');
         Fluttertoast.showToast(
          msg: "Bus deleted successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
        );
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgentAllBuses(token: widget.token)),
          );
      } 
      else if(response.statusCode == 404){
         print('Bus not found');
          Fluttertoast.showToast(
          msg: "Bus not found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16
        );
      }
      
      else {
        print('Failed to delete bus ', );
         Fluttertoast.showToast(
          msg: "Failed to delete bus ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16
        );
      }
    } catch (error) {
      print('Error deleting bus: $error');
       Fluttertoast.showToast(
          msg: "Error deleting bus",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16
        );
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
                
                children: [Padding(
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
            buildHeaderCell(''),
            buildHeaderCell(''),
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
              buildEditIcon(rowData),
              buildDeleteIcon(rowData),
            ],
          ),
      ],
    ),
                ),
                
                ]
              ),
              ),          
            ],
          ),
        ),
      ),
       bottomNavigationBar:  CustomAgentBottomAppBar(token: widget.token)
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
               fontSize: 13,
            ),
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
          fontFamily:'Poppins' ,
          fontSize: 13
          ),
          softWrap: false,
          ), // Use the null-aware operator ?? to handle null
      ),
    ),
  );
}
  Widget buildEditIcon(dynamic rowData) {
    return Expanded(
      child: IconButton(
        icon: const Icon(Icons.edit, size: 20,color: Color(0xFF425C5A),),
        onPressed: () {
          // Implement edit functionality here
           final busId = rowData['_id'];
          _showEditDialog(context, rowData, busId);
        },
      ),
    );
  }
   Widget buildDeleteIcon(dynamic rowData) {
    return Expanded(
      child: IconButton(
        icon: const Icon(Icons.delete_outline,size: 22,color: Color.fromARGB(255, 241, 136, 38),)
        ,
        onPressed: () {
         final busId = rowData['_id'];
          _deleteBus(busId);
        },
      ),
    );
  }


}
