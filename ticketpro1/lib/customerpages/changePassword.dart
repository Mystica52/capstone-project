import 'package:flutter/material.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String currentPassword = _currentPasswordController.text;
              String newPassword = _newPasswordController.text;
              // Call a function to handle password change
              // In a real app, you would handle the password change logic here
              print('Changing password: $currentPassword -> $newPassword');
              Navigator.pop(context); // Close the dialog
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
