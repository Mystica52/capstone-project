import 'package:flutter/material.dart';
import 'package:ticketpro2/companypages/agentCustomButtomAppBar.dart';
import 'package:ticketpro2/headerWidget.dart';



class AgentAddingBus extends StatefulWidget {
  final token; 
  const AgentAddingBus({@required this.token, super.key});

  @override
  _AgentAddingBusState createState() => _AgentAddingBusState();
}

class _AgentAddingBusState extends State<AgentAddingBus> {
  final List<Map<String, String>> tableData = [
    {'plate_no': 'RA12', 'from': 'City A', 'to': 'City B', 'number_of_seats': '3', 'time': '13:49'},
    {'plate_no': 'RD12', 'from': 'City B', 'to': 'City C', 'number_of_seats': '3', 'time': '14:49'},
    // Add more rows as needed
  ];

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
                height: 520,
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
                        label: 'From',
                        placeholder: 'Nyagatare',
                        icon: Icons.car_crash_outlined,
                      ),
                      const SizedBox(height: 7),
                      buildTextFieldWithLabel(
                        label: 'To',
                        placeholder: 'Kigali',
                        icon: Icons.location_on,
                      ),
                      const SizedBox(height: 7),
                      buildTextFieldWithLabel(
                        label: 'Date',
                        placeholder: '20 November 2023',
                        icon: Icons.calendar_today,
                        context: context,
                      ),
                      const SizedBox(height: 7),
                      buildTextFieldWithLabel(
                        label: 'Time',
                        placeholder: '15:50 PM',
                        icon: Icons.access_time,
                      ),
                       const SizedBox(height: 7),
                       buildTextFieldWithLabel(
                        label: 'Seats',
                        placeholder: 'insert numbers of seats',
                        icon: Icons.access_time,
                      ),
                       const SizedBox(height: 5),
                       buildTextFieldWithLabel(
                        label: 'Amount',
                        placeholder: 'insert amount of travel ',
                        icon: Icons.access_time,
                      ),
                    ],
                  ),
                ),
                ]
              ),
              ),
              const SizedBox(height: 12),
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            
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
       bottomNavigationBar:  CustomAgentBottomAppBar(token: widget.token)
    );
  }

  Widget buildTextFieldWithLabel({
    required String label,
    required String placeholder,
    required IconData icon, 
    IconData? selectIcon,
    BuildContext? context,
  }) {
    TextEditingController dateController = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: placeholder,
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
