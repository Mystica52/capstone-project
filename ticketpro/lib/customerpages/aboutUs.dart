import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
        title: const Text(
          'About us',
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
      body:  Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child:               Text(
                'Welcome to our bus transport ticket booking app, your reliable travel companion for seamless journeys! Explore, book, and travel effortlessly to your desired destinations with ease. Our user-friendly app offers a range of routes, schedules, and secure payment options, ensuring a convenient booking experience. Join thousands of travelers relying on us for stress-free commuting and embark on your next adventure hassle-free.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                ),
              ),
              ),

              SizedBox(height: 16),
              Container(
                child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter your Email Address', // Label text
            labelStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ),
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      // fillColor: Color(0x2DFFCEA2),
          //  filled: true
          ),
        ),
              ),
              

        SizedBox(height: 16),
        Container(
          
                        child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter your message here...', // Label text
            labelStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ),
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      // fillColor: Color(0x2DFFCEA2),
          //  filled: true
          ),
        ),
        ), SizedBox(height: 16,),
        Container(
          child: TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 241, 136, 38),
                            ),
                            child: const Center(
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
        ),
        )

            ],
          ),
        ),
      ),
    );
  }
}
