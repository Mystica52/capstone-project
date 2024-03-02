import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticketpro2/headerWidget.dart';

class BusBooking extends StatefulWidget {
  const BusBooking({super.key});

  @override
  _BusBookingState createState() => _BusBookingState();
}

class _BusBookingState extends State<BusBooking> {
  final List<Map<String, String>> tableData = [
    {'plate_no': 'RA12', 'from': 'City A', 'to': 'City B', 'number_of_seats': '3', 'time': '13:49'},
    {'plate_no': 'RD12', 'from': 'City B', 'to': 'City C', 'number_of_seats': '3', 'time': '14:49'},
    // Add more rows as needed
  ];
    Map<String, String> selectedValues = {};
    late TextEditingController dateController = TextEditingController();
  IconData? selectedIcon;
  //   @override
  // void initState() {
  //   super.initState();
  // //  TextEditingController controller = TextEditingController(); // Initialize controller
  // }
   @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                 appBar: AppBar(
        title: const Text(
          'Bus Booking',
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
                height: 600,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextFieldWithLabel(
                        label: 'Name',
                        placeholder: 'Nyagatare',
                        icon: Icons.car_crash_outlined,
                        selectIcon: Icons.arrow_drop_down,
                        showDropdown: true,
                        items: tableData.map((data) => data['from']!).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValues['from'] = newValue ?? '';
                          });
                        },
                      ),
                      const SizedBox(height: 18),
                      buildTextFieldWithLabel(
                        label: 'From',
                        placeholder: 'Nyagatare',
                        icon: Icons.car_crash_outlined,
                        selectIcon: Icons.arrow_drop_down,
                        showDropdown: true,
                        items: tableData.map((data) => data['from']!).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValues['from'] = newValue ?? '';
                          });
                        },
                      ),
                      const SizedBox(height: 18),
                      buildTextFieldWithLabel(
                        label: 'To',
                        placeholder: 'Kigali',
                        icon: Icons.location_on,
                        selectIcon: Icons.arrow_drop_down,
                        showDropdown: true,
                        items: tableData.map((data) => data['to']!).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValues['to'] = newValue??'';
                          });
                        },
                      ),
                      const SizedBox(height: 18),
                      buildTextFieldWithLabel(
                        label: 'Date',
                        placeholder: '20 November 2023',
                        icon: Icons.calendar_today,
                        controller: dateController,
                        
                        onTap: () {
                          selectDate(context, dateController);
                        },

                      ),
                      const SizedBox(height: 18),
                      buildTextFieldWithLabel(
                        label: 'Time',
                        placeholder: '15:50 PM',
                        icon: Icons.access_time,
                        selectIcon: Icons.arrow_drop_down,
                        showDropdown: true,
                        items: tableData.map((data) => data['time']!).where((time) => time != null).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValues['time'] = newValue??'';
                          });
                        },
                      ),
                       const SizedBox(height: 25),
                       buildTotalAmountContainer()
                    ],
                  ),
                ),
                ],
              ),
              ),
              const SizedBox(height: 18),
                      SizedBox(
                        width: 400,
                        height: 60,
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
    );
  }
  void selectDate(BuildContext context,  TextEditingController controller) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: controller.text.isEmpty ? DateTime.now() : DateTime.parse(controller.text) ,
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );
    if (picked != null && picked != controller.text) {
       String formattedDate = DateFormat('y MMM d').format(picked);
    controller.text = formattedDate;// Format the picked date as needed
    }
    else {
    // Show a message indicating no date was selected
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No date selected'),
      ),
    );
  }
}


  Widget buildTextFieldWithLabel({
    required String label,
    required String placeholder,
    required IconData icon,
    TextEditingController? controller,
    bool showDropdown = false,
    IconData? selectIcon,
    List<String>? items= const [],
    String value = '',
    Function(String?)? onChanged,
    BuildContext? context,
    
    Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Stack(
                children: [
                  
                  // Text field (always visible)
                  TextField(
                    controller: controller,
                    readOnly: true,
                    enabled: !showDropdown, // Disable when dropdown is active
                    decoration: InputDecoration(
                      hintText: placeholder,
                      border: InputBorder.none, // Remove default border
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 173, 172, 172),
                      ),
                    ),
                  ),
                  // Conditional dropdown (optional)
                  const SizedBox(height: 15,),
                  showDropdown
                      ? DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedValues[label.toLowerCase()],
                            dropdownColor: const Color.fromARGB(255, 173, 172, 172),
                            icon: selectIcon != null ? Icon(
                              selectIcon,
                              color: Colors.white,
                            ) : const SizedBox.shrink(),
                            hint: const Text(
                             '',
                              style: TextStyle(
                                color: Color.fromARGB(255, 173, 172, 172),
                              ),
                            ),
                            items: items?.map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.white),
                              ),
                            )).toList() ??
                                [], // Handle empty items case
                            onChanged: (String? newValue) {
                  setState(() {
                    selectedValues[label.toLowerCase()] = newValue ?? '';
                    // Update the TextField value directly
                    controller?.text = newValue ?? '';
                  });
                },
                          ),
                        )
                      : const SizedBox(), // Placeholder for inactive dropdown
                ],
              ),
               ),
               
              
            ],
          ),
        ),
      ],
    );
  }
   Widget buildTotalAmountContainer() {
    double amount = 1500;
return RichText(
      text: TextSpan(
        text: 'Amount: ',
        style: const TextStyle(color: Colors.white, fontSize: 18),
        children: [
          TextSpan(
            text: '$amount RWF',
            style: const TextStyle(
              color: Color.fromARGB(255, 241, 136, 38),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
);
  }




}
