import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;
import 'package:jwt_decoder/jwt_decoder.dart';
class editProfile extends StatefulWidget {
  final token; 
  const editProfile({required this.token, super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<editProfile> {
  late ImagePicker _imagePicker;
  late XFile _image;
  late String userId;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController  phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _image = XFile(''); // Placeholder, you can set it to your default image
           super.initState();
        FlutterError.onError = (details) {
      // Handle the error, e.g., log it or show a dialog
      print('Caught error: ${details.exception}');
    };
    Map<String, dynamic> jwtDecodedToken  = JwtDecoder.decode(widget.token);

    userId = jwtDecodedToken['userId'];
    fetchUserProfileData();
  }
 @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    cityController.dispose();
    super.dispose();
  }
    Future<void> fetchUserProfileData() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.46.113.107:3000/api/singleUser/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${widget.token}'
        },
      );
      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body)['user'];

        setState(() {
          // Populate fields with fetched data
          nameController.text = userData['name'];
          emailController.text = userData['email'];
          phoneNumberController.text = userData['contactNumber']??'';
          cityController.text = userData['city']??'';
        });
      } else {
        // Handle errors here
        print('Failed to fetch user profile data: ${response.statusCode}');
      }
    } catch (error) {
      final response = await http.get(
        Uri.parse('http://10.46.113.107:3000/api/singleUser/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${widget.token}'
        },
      );
      // Handle errors here
      print('Error occurred while fetching user profile data: $error+ ${response.statusCode}');
    }
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
    Future<void> _saveChanges() async {
    // Get profile information from text fields
    String name = nameController.text;
    String email = emailController.text; // get email value
    String contactNumber = phoneNumberController.text; // get contact number value
    String city = cityController.text; // get city value

    // Prepare request body
    Map<String, dynamic> requestBody = {
      'name': name,
      'email': email,
      'contactNumber': contactNumber,
      'city': city,
    };

    // If an image is selected, encode it to base64 and add it to the request body
  if (_image.path.isNotEmpty) {
    List<int> imageBytes = await _image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    requestBody['profileImage'] = base64Image;
  }

    // Make PUT request to backend
    try {

      //       final response = await http.put(
      //   Uri.parse('http://192.168.1.68:3000/api/edit-profile/userId'), // Replace with your actual backend URL and userId
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'Authorization': 'Bearer ${widget.token}'
      //   },
      //   body: jsonEncode(requestBody),
      // );

      final response = await http.put(
        Uri.parse('http://10.46.113.107:3000/api/edit-profile/$userId'), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${widget.token}'
        },
        body: jsonEncode(requestBody),
      );

      

      if (response.statusCode == 200) {
        // Profile updated successfully
        // Handle success as per your app's requirements
        print('Profile updated successfully');
                Fluttertoast.showToast(
          msg: "Profile updated successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
        );

      }
       else {
        // Error occurred while updating profile
        // Handle error as per your app's requirements
                  print('Error occurred while updating profile');
           Fluttertoast.showToast(
          msg: "Error occurred while updating profile",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16
        );
      }
    } catch (error) {
      // Error occurred while making the HTTP request
      // Handle error as per your app's requirements
        print('Error occurred, $error');
           Fluttertoast.showToast(
          msg: "Error occurred while updating profile",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
           appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                      backgroundImage: _image.path.isNotEmpty
                          ? Image.file(_image as File).image
                          : Image.asset('assets/beautiful-profile-icon-vector.jpg').image,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Color(0xFF425C5A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),           const SizedBox(height: 16),
                      
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
                child:ListView(
                  shrinkWrap: true,
                
                children: [Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your names',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 16),
                      // SizedBox(
                      //   height: 40,
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       labelText: 'Enter your Last name',
                      //       labelStyle: const TextStyle(color: Colors.white),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide:
                      //             const BorderSide(color: Colors.white, width: 1),
                      //         borderRadius: BorderRadius.circular(5),
                      //       ),
                      //       contentPadding: const EdgeInsets.symmetric(
                      //           vertical: 10, horizontal: 12),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your Email Address',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: cityController,
                          decoration: InputDecoration(
                            hintText: 'Enter your city',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                          ),
                          
                        ),
                      ),
                      const SizedBox(height: 25),
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
                              _saveChanges();
                              Navigator.pop(context);
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
                                "Save",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),)

                        ],
                      ),
                    ],
                  ),
                ),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
