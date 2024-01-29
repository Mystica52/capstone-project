import 'package:flutter/material.dart';
import 'package:ticketpro/ButtomAppBar.dart';
import 'package:ticketpro/headerWidget.dart';

class BusBooking extends StatelessWidget {
  const BusBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const MyAppHeader(), 
              Container(
                width: 350,
                height: 480,
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
                      buildTextFieldWithLabel(
                        label: 'From',
                        placeholder: 'Nyagatare',
                        icon: Icons.car_crash_outlined,
                        selectIcon: Icons.arrow_drop_down,
                      ),
                      const SizedBox(height: 18),
                      buildTextFieldWithLabel(
                        label: 'To',
                        placeholder: 'Kigali',
                        icon: Icons.location_on,
                        selectIcon: Icons.arrow_drop_down,
                      ),
                      const SizedBox(height: 18),
                      buildTextFieldWithLabel(
                        label: 'Date',
                        placeholder: '20 November 2023',
                        icon: Icons.calendar_today,
                        context: context,
                      ),
                      const SizedBox(height: 18),
                      buildTextFieldWithLabel(
                        label: 'Time',
                        placeholder: '15:50 PM',
                        icon: Icons.access_time,
                        selectIcon: Icons.arrow_drop_down,
                      ),
                       const SizedBox(height: 25),
                       buildTotalAmountContainer()
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
                            "Book Ticket ",
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
              onTap: () {
                selectDate();
              },
              child: Icon(
                icon,
                color: Colors.white,
              ),
              ),
              
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: const TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
