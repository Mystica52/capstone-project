import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticketpro2/companypages/assignRoles.dart';
import 'package:ticketpro2/customerpages/aboutUs.dart';
import 'package:ticketpro2/customerpages/changePassword.dart';
import 'package:ticketpro2/customerpages/editprofile.dart';
import 'package:ticketpro2/customerpages/privacy.dart';
import 'package:ticketpro2/customerpages/terms&condition.dart';

class SettingCompanyPage extends StatefulWidget {
  final token;

  const SettingCompanyPage({required this.token, super.key});
  @override
  _SettingCompanyPageState createState() => _SettingCompanyPageState();
}

class _SettingCompanyPageState extends State<SettingCompanyPage> {
  late ImagePicker _imagePicker;
  late XFile _image;
  String name = "John Doe";
  bool notificationsEnabled = true;
   bool _isChangePasswordVisible = false;

  void _toggleChangePasswordVisibility() {
    setState(() {
      _isChangePasswordVisible = !_isChangePasswordVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _image = XFile(''); // Placeholder, you can set it to your default image
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path) as XFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
              
    

    return Scaffold(
  
           appBar: AppBar(
        title: const Text(
          'Settings',
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
              // MyAppHeader(),
               // Add an image upload widget here
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

         children: [
         Expanded(
          child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: const EdgeInsets.only(left: 70.0),
                  child: GestureDetector(
                    
                    onTap: _pickImage,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                      backgroundImage: _image.path.isNotEmpty
                          ? Image.file(_image as File).image
                          : Image.asset('assets/beautiful-profile-icon-vector.jpg').image,
                        ),
                      ],
                    ),
                  ),
                  ),

                ],
              ),
          ),
          Padding(padding:  const EdgeInsets.only(right: 16.0),
          child: Align(
          alignment: Alignment.topRight,
          
          child: IconButton(
            icon:  const Icon(Icons.edit, color: Color.fromARGB(255, 241, 136, 38),  ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  editProfile(token: widget.token),
              ),
            ); 
            },
          ),
        ),
        ),
                        
         ]
        ),
              
              const SizedBox(height: 10),
              SizedBox(
                        width: 300,
                        height: 40,
                        child:  Center(
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
      
        ]
  ),

              const SizedBox(height: 0),
              Container(
                width: 350,
                height: 430,
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
                child: ListView(
                  shrinkWrap: true,
          children: [
            const SizedBox(height: 16),
            buildSettingRow(
              icon: Icons.notifications_active_outlined,
              label: 'Notifications',
              onPressed: () {
                setState(() {
                          notificationsEnabled = !notificationsEnabled;
                        });
                // Handle navigation to notifications page
              },
              showToggle: true,
              isSwitched: notificationsEnabled,
            ),
            buildSeparator(),
            ListTile(
                  leading: const Icon(Icons.lock,color: Colors.white,),
                  title: const Text('Change Password', style: TextStyle(color: Colors.white),),
                  trailing: const Icon(Icons.chevron_right,color: Colors.white),
                  onTap: () {
                    showDialog(
                context: context,
                builder: (BuildContext context) {
                  return  ChangePasswordDialog(token:widget.token);
                },
              );
                  },
                ),
            buildSeparator(),
            ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined, color: Colors.white,),
                  title: const Text('Privacy and security', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right,color: Colors.white),
                  onTap: () {
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PrivacyPage(),
                              ),
                            );
                  },
                ),
            buildSeparator(),
            ListTile(
                  leading: const Icon(Icons.assignment_outlined, color: Colors.white,),
                  title: const Text('Terms and Conditions', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right,color: Colors.white),
                  onTap: () {
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TermsPage(),
                              ),
                            );
                  },
                ),
            buildSeparator(),
            ListTile(
                  leading: const Icon(Icons.assignment_outlined, color: Colors.white,),
                  title: const Text('Assign Role', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right,color: Colors.white),
                  onTap: () {
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  AssignRole(token: widget.token,),
                              ),
                            );
                  },
                ),
            buildSeparator(),
            ListTile(
              leading: const Icon(Icons.info_outline,color: Colors.white,),
              title: const Text('About Us', style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.chevron_right,color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUsPage(),
                    ),
                    );
                  },
                ),
                 const SizedBox(height: 16),
          ],
        ),

          ),
                const SizedBox(height: 16),
             Container(
  width: 300,
  height: 40,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color:  const Color.fromARGB(255, 241, 136, 38), // Change the color as needed
  ),
  child: TextButton.icon(
    onPressed: () {
      // Handle logout action
    },
    icon: const Icon(
      Icons.logout, // Icon for logout
      color: Colors.white, // Icon color
    ),
    label: const Text(
      'Logout',
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
    );
  }
    Widget buildSettingRow({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
       bool showToggle = false,
    bool isSwitched = false,
    Color switchColor = const  Color.fromARGB(255, 241, 136, 38),
    Color iconColor = Colors.white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon,color: Colors.white,
              ),
              const SizedBox(width: 16),
              Text(label,style: const TextStyle(color: Colors.white),),
            ],
          ),
          if (showToggle)
          Switch(
            value: isSwitched,
            onChanged: (value) {
              onPressed();
            },
            activeColor: switchColor
          ),
          if (!showToggle)
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onPressed,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
  Widget buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(),
    );
  }

}
