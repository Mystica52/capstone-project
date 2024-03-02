
import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketpro2/customerpages/login.dart';
import 'package:ticketpro2/customerpages/terms&condition.dart';

import 'package:ticketpro2/headerWidget.dart';
import 'package:http/http.dart'as http;


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? validateName(String? value) {
 if (value == null || value.isEmpty) {
    return 'Name is required';
 }
 return null;
}

String? validateEmail(String? value) {
 if (value == null || value.isEmpty) {
    return 'Email is required';
 } else if (!EmailValidator.validate(value)) {
    return 'Invalid email address';
 }
 return null;
}

String? validatePassword(String? value) {
 if (value == null || value.isEmpty) {
    return 'Password is required';
 } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
 }
 return null;
}

  void registerUser() async{
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      var regBody={
        "name":nameController.text,
        "email":emailController.text,
        "password":passwordController.text
      };
      try{
              // var response = await http.post(Uri.parse("http://192.168.1.68:3000/api/signup"),
              var response = await http.post(Uri.parse("http://10.46.113.107:3000/api/signup"),
      headers: {"Content-type":"application/json"},
      body: jsonEncode(regBody)
      );
      print(response);

          if (response.statusCode == 201 ) {
      // If the server returns a 200 OK response, then parse the JSON.
      print('Sign up successful');
      Fluttertoast.showToast(
          msg: "Sign up successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
    } else if(response.statusCode == 400){
            Fluttertoast.showToast(
          msg: "Email already in use",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16
        );
    }
    else {
      // If the server returns an error response, then throw an exception.
      throw Exception('Failed to sign up');
    }
      } on SocketException catch(e){
        print('Error: $e');
      }

    }
  }

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
          child:ListView(
            shrinkWrap: true,
          
           children: [Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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

              const SizedBox(height: 20),

        // Input field with label
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: nameController,
            
          decoration: InputDecoration(
            hintText: 'Enter your name', // Label text
            hintStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ),
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      // fillColor: Color(0x2DFFCEA2)
          ),
          validator: validateName,
        ),
        ),
           const SizedBox(height: 16),
           SizedBox(
            height: 50,

        // Input field with label
         child: TextFormField(
          controller:emailController,
          decoration: InputDecoration(
            hintText: 'Enter your Email Address', // Label text
            hintStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ),
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      // fillColor: Color(0x2DFFCEA2),
          //  filled: true
          ),
          validator: validateEmail,
        ),
           ),
        const SizedBox(height: 16),
        SizedBox(
          height:40,        // Input field with label
         child: TextFormField(
          controller:passwordController,
          decoration: InputDecoration(
            hintText: 'Enter your password', // Label text
            hintStyle: const TextStyle(color: Colors.white),
           enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ), 
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          validator: validatePassword,
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
                                builder: (context) => const TermsPage(),
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
                      SizedBox(
                        width: 400,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            registerUser();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:  const Color.fromARGB(255, 241, 136, 38),
                              ),
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
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
        
           ]    
             )
             ) 
             ],
            ),
          ),
        ),
      );
     }

}


