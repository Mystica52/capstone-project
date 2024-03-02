import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketpro2/companypages/companyALLBus.dart';
import 'package:ticketpro2/companypages/companyBottomAppBar.dart';
import 'package:ticketpro2/headerWidget.dart';
import 'package:http/http.dart'as http;



class AddingBus extends StatefulWidget {
  final token;
  const AddingBus({required this.token, super.key});

  @override
  _AddingBusState createState() => _AddingBusState();
}

class _AddingBusState extends State<AddingBus> {
  // final List<Map<String, String>> tableData = [
  //   {'plate_no': 'RA12', 'from': 'City A', 'to': 'City B', 'number_of_seats': '3', 'time': '13:49'},
  //   {'plate_no': 'RD12', 'from': 'City B', 'to': 'City C', 'number_of_seats': '3', 'time': '14:49'},
  //   // Add more rows as needed
  // ];

  final TextEditingController plateNoController = TextEditingController();
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
   @override
 void dispose() {


    // Dispose of the controllers
    plateNoController.dispose();
    originController.dispose();
    destinationController.dispose();
    dateController.dispose();
    departureTimeController.dispose();
    seatsController.dispose();
    priceController.dispose();

    super.dispose();
 }

  Future<void> _addBus(BuildContext context) async {
     print('Plate No: ${plateNoController.text}');
 print('Origin: ${originController.text}');
  print('Plate No: ${destinationController.text}');
 print('Origin: ${dateController.text}');
  print('Plate No: ${plateNoController.text}');
 print('Origin: ${seatsController.text}');
  print('Origin: ${priceController.text}');

     if (plateNoController.text.isEmpty ||
      originController.text.isEmpty ||
      destinationController.text.isEmpty ||
      dateController.text.isEmpty ||
      departureTimeController.text.isEmpty ||
      seatsController.text.isEmpty ||
      priceController.text.isEmpty) {
    Fluttertoast.showToast(
      msg: 'Please fill all required fields',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
    return;
  }
  // final url = Uri.parse('http://192.168.1.68:3000/api/addbus');
    final url = Uri.parse('http://10.46.113.107:3000/api/addbus');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.token}',
        },
        body: jsonEncode(
          <String, dynamic>{
            'plateNo': plateNoController.text,
    'origin': originController.text,
    'destination': destinationController.text,
    'date': dateController.text,
    'departure_time': departureTimeController.text,
    'available_seats': int.parse(seatsController.text), // Convert to int
    'price': double.parse(priceController.text),
          },
        ),
      );
      var resp= response.statusCode;
      if (response.statusCode == 201) {
        print('Bus added successfully');
        Fluttertoast.showToast(
          msg: 'Bus added successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16,
        );

        // Navigate back to previous screen after adding bus
        // Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompanyAllBuses(token: widget.token)),
          );
      }else if (response.statusCode == 401){
        print('Unauthorized invalidToken');
        Fluttertoast.showToast(
          msg: 'Unauthorized invalidToken',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16,
        ); 
      }
      else if (response.statusCode == 400){
        print('Another bus already exists with the same origin, destination, departure time');
        Fluttertoast.showToast(
          msg: 'Another bus already exists',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16,
        ); 
      }
       else {
        print('Failed to add bus. Please try again $resp');
        Fluttertoast.showToast(
          msg: 'Failed to add bus. Please try again.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16,
        );
      }
    } catch (error) {
      print('Error adding bus: $error');
      Fluttertoast.showToast(
        msg: 'Error adding bus. Please try again.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                       appBar: AppBar(
        title: const Text(
          'Add buses',
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
                height: 650,
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
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextFieldWithLabel(
                      label: 'Plate No',
                      hintText: 'plate no',
                      icon: Icons.car_crash_outlined,
                      controller: plateNoController,
                    ),
                      buildTextFieldWithLabel(
                        label: 'From',
                        hintText: 'Nyagatare',
                        icon: Icons.car_crash_outlined,
                        controller: originController,
                      ),
                      const SizedBox(height: 7),
                      buildTextFieldWithLabel(
                        label: 'To',
                        hintText: 'Kigali',
                        icon: Icons.location_on,
                        controller: destinationController
                      ),
                      const SizedBox(height: 7),
                      buildTextFieldWithLabel(
                        label: 'Date',
                        hintText: '20 November 2023',
                        icon: Icons.calendar_today,
                        context: context,
                        controller:dateController
                      ),
                      const SizedBox(height: 7),
                      buildTextFieldWithLabel(
                        label: 'Time',
                        hintText: '15:50 PM',
                        icon: Icons.access_time,
                        controller:departureTimeController 
                      ),
                       const SizedBox(height: 7),
                       buildTextFieldWithLabel(
                        label: 'Seats',
                        hintText: 'insert numbers of seats',
                        icon: Icons.access_time,
                        controller:seatsController
                      ),
                       const SizedBox(height: 5),
                       buildTextFieldWithLabel(
                        label: 'Amount',
                        hintText: 'insert amount of travel ',
                        icon: Icons.access_time,
                        controller:priceController
                      ),
                    ],
                  ),
                ),
                ] 
              ),
              ),
              const SizedBox(height: 12),
                      SizedBox(
                        width: 400,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            _addBus(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:  const Color.fromARGB(255, 241, 136, 38),
                              ),
                            child: const Center(
                              child: Text(
                                "Add bus",
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
       bottomNavigationBar: CustomCompanyBottomAppBar(token:widget.token)
    );
  }

  Widget buildTextFieldWithLabel({
    required String label,
    required String hintText,
    required IconData icon,
    IconData? selectIcon,
    BuildContext? context,
    required TextEditingController controller,
  }) {
    // TextEditingController dateController = TextEditingController();

Future<void> selectDate() async {
  if (context != null) {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dateController.text) {
      dateController.text = picked.toString(); // Format the picked date as needed
    }
  }
}
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            height: 0,
          ),
        ),
        const SizedBox(height: 2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              GestureDetector(
              onTap: () {
                selectDate();
              },
              child: Icon(
                icon,
                color: Colors.white,
              ),
              ),
              
              const SizedBox(width: 2),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
                          
               Icon(
                selectIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

}
