
import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketpro2/companypages/agentALLBUS.dart';
import 'package:ticketpro2/companypages/companyALLBus.dart';
import 'package:ticketpro2/customerpages/allBuses.dart';
import 'package:ticketpro2/customerpages/signup.dart';
import 'package:ticketpro2/headerWidget.dart';
import 'package:http/http.dart'as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;

  @override
  void initState(){
    super.initState();
    initSharedPref();
  }
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }
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

  void loginUser() async{
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      var regBody={
        "email":emailController.text,
        "password":passwordController.text
      };
      try{
        // var response = await http.post(Uri.parse("http://192.168.1.68:3000/api/login"),
        var response = await http.post(Uri.parse("http://10.46.113.107:3000/api/login"),
        headers: {"Content-type":"application/json"},
        body: jsonEncode(regBody)
      );
      print(response);

      var jsonResponse = jsonDecode(response.body);

          if (response.statusCode == 201 ) {
            var myToken = jsonResponse['token'];
            prefs.setString('token', myToken);
      print('Login  successful ');
      Fluttertoast.showToast(
          msg: "log in successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
        );
                // Decode the token to get the role
        Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(myToken);
        String role = jwtDecodedToken['role'];

        // Navigate based on role
        if (role == 'admin') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompanyAllBuses(token: myToken)),
          );
        } else if (role == 'passenger') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AllBuses(token: myToken)),
          );
        } 
        else if(role=='agent'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentAllBuses(token: myToken))
          );
        }
        else {
          // Handle unknown role or navigate to a default page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AllBuses()),
          );
        }

    } else if (response.statusCode == 401){
      print('Invalid email or password');
      Fluttertoast.showToast(
          msg: "Invalid email or password",
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
      throw Exception('Internal server error ');
    }
      } on SocketException catch(e){
        print('Error: $e');
              Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
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
                  const SizedBox(height: 40,),
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
                height: 50,
        // Input field with label
         child: TextFormField(
          controller: emailController,
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
          validator:validateEmail
        ),
              ),
        const SizedBox(height: 30),
              SizedBox(
                height: 50,
        // Input field with label
         child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: 'Enter your password', // Label text
            hintStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ), 
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          validator:validatePassword
        ),
        ),
              // Checkbox for terms and conditions using RichText
     const SizedBox(height: 16),
                      SizedBox(
                        width: 400,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            loginUser();
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