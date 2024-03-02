import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class ChangePasswordDialog extends StatefulWidget {
  final String token;
   ChangePasswordDialog({super.key, required this.token});

  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late String userId;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
       super.initState();
        FlutterError.onError = (details) {
      // Handle the error, e.g., log it or show a dialog
      print('Caught error: ${details.exception}');
    };
    Map<String, dynamic> jwtDecodedToken  = JwtDecoder.decode(widget.token);

    userId = jwtDecodedToken['userId'];
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }
    Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) {
      String currentPassword = _currentPasswordController.text;
      String newPassword = _newPasswordController.text;
      
      try {
        // final response = await http.put(Uri.parse('http://192.168.1.68:3000/api/change-password/$userId'),
        final response = await http.put(Uri.parse('http://10.46.113.107:3000/api/change-password/$userId'),
          headers: {"Content-type":"application/json"},
        body: json.encode({ // Encode the body as JSON
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        }),
        );
        
        if (response.statusCode == 200) {
          print('Password changed successfully');
                Fluttertoast.showToast(
          msg: "Password changed successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
        );
        } else if (response.statusCode == 401) {
          // Incorrect current password
          print('Incorrect current password');
           Fluttertoast.showToast(
          msg: "Incorrect current password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16
        );
        } else {
          // Other error handling
          print('Failed to change password. Status code: ${response.statusCode}');
          Fluttertoast.showToast(
            msg: "Failed to change password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16
        );
        }
      } catch (e) {
        // Error handling for network issues
        print('Failed to change password. Error: $e');
                  Fluttertoast.showToast(
            msg: "Failed to change password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16
        );
      }
      
      Navigator.pop(context); // Close the dialog
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
      insetPadding: const EdgeInsets.all(20),
      title: Container( 
        child: Row( 
           mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
          const Text('Change Password   '),
          Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon:  const Icon(Icons.close_sharp, color: Color(0xFF425C5A),  ),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
          ),
        ),
        ],
        ),

        ),
      content: Form(
        key: _formKey,
        child: Column(
          
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _currentPasswordController,
              decoration: const InputDecoration(labelText: 'Current Password', contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your current password';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _newPasswordController,
              decoration: const InputDecoration(labelText: 'New Password',contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your new password';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                    TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF425C5A),
                            ),
                            child: const Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
        ),
            TextButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              String currentPassword = _currentPasswordController.text;
              String newPassword = _newPasswordController.text;
              // Call a function to handle password change
              // In a real app, you would handle the password change logic here
              print('Changing password: $currentPassword -> $newPassword');
              try {
                await _changePassword(); // Call the function to change the password
      // Password change successful, close the dialog
      Navigator.pop(context);
    } catch (e) {
      // Password change failed, do not close the dialog
      print('Password change failed: $e');
    }
  }
    
          },
          
         child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 241, 136, 38),
                            ),
                            child: const Center(
                              child: Text(
                                "Change",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
        ),

      ], ),
      ],
    );
  }
}
