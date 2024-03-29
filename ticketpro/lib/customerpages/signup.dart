
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ticketpro/customerpages/terms&condition.dart';
import 'package:ticketpro/headerWidget.dart';
import 'package:ticketpro/customerpages/login.dart';



class SignupPage extends StatelessWidget{
  const SignupPage({super.key});

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
                const Text(
            'Sign up',
              style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0,
             )
           ),
           const SizedBox(height: 16),
         // Adjust the spacing between text and button
           SizedBox(
            height:40,
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
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   color: Color(-)
            // ),
              ),
              const SizedBox(height: 16),

        // Input field with label
        SizedBox(
          height: 40,               child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter your name', // Label text
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
           const SizedBox(height: 16),
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
        const SizedBox(height: 16),
        SizedBox(
          height:40,        // Input field with label
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
       const SizedBox(height: 16),
              // Checkbox for terms and conditions using RichText
              CheckboxListTile(
                title: RichText(
                  text: TextSpan(
                    text: 'I agree to the ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'terms',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 241, 136, 38), // Link color for terms
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the terms page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TermsPage(),
                              ),
                            );
                          },
                      ),
                      const TextSpan(
                        text: ' and ',
                      ),
                      TextSpan(
                        text: 'conditions',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 241, 136, 38), // Link color for conditions
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the conditions page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConditionsPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                value: false,
                onChanged: (bool? value) {
                  // Handle checkbox state change
                },
                activeColor: Colors.red,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 16),
              Container(
                height:40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 241, 136, 38)
                ),
                child: const Center(
                  child:Text("SIGN UP ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: 16,),
              RichText(
  text: TextSpan(
    text: 'Already have an account? ',
    style: const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    children: [
      TextSpan(
        text: 'Login',
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
                builder: (context) => const LoginPage(),
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


// class TermsPage extends StatelessWidget {
//   const TermsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Terms and Conditions'),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Terms and Conditions',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Your terms content goes here.',
//                 style: TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ConditionsPage extends StatelessWidget {
  const ConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditions'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Conditions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Your conditions content goes here.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
