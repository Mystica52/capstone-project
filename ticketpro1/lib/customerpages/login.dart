
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ticketpro1/customerpages/allBuses.dart';
import 'package:ticketpro1/headerWidget.dart';
import 'package:ticketpro1/customerpages/signup.dart';
class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const MyAppHeader(), // Include the header widget
                // Your page content goes here
                Container(
                  
          width: 350,
          height: 500,
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
                const SizedBox(height: 20,),
                const Text(
            'Log in',
              style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0,
             )
           ),
           const SizedBox(height: 30),
           SizedBox(
            height:50,
            width: 500,
            // margin: EdgeInsets.symmetric(horizontal: 7),
            child: ElevatedButton.icon(
            onPressed: () {
              // Handle Google Sign-Up button tap
            },
             icon: Image.asset('assets/googleIcon.png', 
            height:30,),
            label: const Text('Log in with Google'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 241, 136, 38), 
               side: const BorderSide(color: Colors.white, width: 1),
                 shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
              // Choose text color
            )
          ),

              ),

          const SizedBox(height: 30),
              SizedBox(
                height: 50,
        // Input field with label
         child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter your Email Address', // Label text
            labelStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ),
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      // fillColor: Color(0x2DFFCEA2),
          //  filled: true
          ),
        ),
              ),
        const SizedBox(height: 30),
              SizedBox(
                height: 50,
        // Input field with label
         child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter your password', // Label text
            labelStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ), 
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
        ),
        ),
       const SizedBox(height: 10),
              // Checkbox for terms and conditions using RichText
              CheckboxListTile(
                title: RichText(
                  text: const TextSpan(
                    text: 'Remember me ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
     ),
                ),
                value: false,
                onChanged: (bool? value) {
                  // Handle checkbox state change
                },
                activeColor: Colors.red,
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // Checkbox for terms and conditions using RichText
     const SizedBox(height: 16),
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllBuses(),
                              ),
                            );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:  const Color.fromARGB(255, 241, 136, 38),
                              ),
                            child: const Center(
                              child: Text(
                                "Log in ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
        ),
                      ),
                      const SizedBox(height: 20,),
              RichText(
  text: TextSpan(
    text: "Don't have an account?" ,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    children: [
      TextSpan(
        text: ' Sign up ',
        style: const TextStyle(
          color: Color.fromARGB(255, 241, 136, 38), // Link color for login
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            // Navigate to the login page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupPage(),
              ),
            );
          },
      ),
    ],
)
)
              

          
                   ],)
  ),
        ),
        
                
              ],
            ),
          ),
        ),
      );
     }

}