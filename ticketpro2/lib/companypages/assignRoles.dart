
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticketpro2/companypages/companyBottomAppBar.dart';
import 'package:http/http.dart'as http;



class AssignRole extends StatefulWidget { 
  final token ;
    const AssignRole({required this.token, super.key});
  @override
  _AssignRoleState createState() => _AssignRoleState();
}

class _AssignRoleState extends State<AssignRole> {
  String name = "John Doe";
  List<dynamic> users = [];

    @override
  void initState() {
    super.initState();
    fetchData(); // Fetch user data when the widget initializes
  }
    void fetchData() async {
      // final response = await http.get(Uri.parse('http://192.168.1.68:3000/api/users'),headers: {'Authorization': 'Bearer ${widget.token}'});
    final response = await http.get(Uri.parse('http://10.46.113.107:3000/api/users'),headers: {'Authorization': 'Bearer ${widget.token}'});

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        users = responseData['users'];
      });
    } else {
      // Handle error
      print('Failed to fetch users: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
  
           appBar: AppBar(
        title: const Text(
          'Assign Role',
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
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // MyAppHeader(),
               // Add an image upload widget here
        const SizedBox(height: 16),
        const SizedBox(
                        width: 300,
                        height: 40,
                        child:   Text(
                            "Edit Role",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      

              const SizedBox(height: 10),
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
            Container(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
               child: TextField(
            
          decoration: InputDecoration(
            labelText: 'search user ',// Label text
            labelStyle: const TextStyle(color: Colors.white), // Label text color
           enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1), // Border color and width
              borderRadius: BorderRadius.circular(5),
           ), 
           contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
           prefixIcon: const Icon(Icons.search, color: Colors.white),
          ),
        ),
            ),
            const SizedBox(height: 10),
            const Padding(padding:EdgeInsets.only(left: 30) ,
            child: Text("Names", style: TextStyle(color: Colors.white,),),),
          
           buildSeparator(),
        const SizedBox(height: 16),
        for (var user in users)
                        ListTile(
                          leading:
                              const Icon(Icons.person, color: Colors.white),
                          title: Text(user['name'],
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text(user['role'],
                              style: const TextStyle(color: Colors.white)),
                          trailing: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                          onTap: () {
                            // Handle user tap
                          },
                        ),
                    ],
                  ),
                ),

            // ListTile(
            //   leading: const Icon(Icons.person, color: Colors.white,),
            //   title: Text(name, style: const TextStyle(color: Colors.white),),
            //   subtitle: const Text('admin', style: TextStyle(color: Colors.white)),
            //   trailing: const Icon(Icons.arrow_drop_down,color: Colors.white),
            //       onTap: () {
            //       },
            //     ),
            // ListTile(
            //       leading: const Icon(Icons.person, color: Colors.white,),
            //      title: Text(name, style: const TextStyle(color: Colors.white),),
            //      subtitle: const Text('admin', style: TextStyle(color: Colors.white)),
            //       trailing: const Icon(Icons.arrow_drop_down,color: Colors.white),
            //       onTap: () {
            //       },
            //     ),
            // ListTile(
            //       leading: const Icon(Icons.person, color: Colors.white,),
            //       title: Text(name, style: const TextStyle(color: Colors.white),),
            //       subtitle: const Text('admin', style: TextStyle(color: Colors.white)),
            //       trailing: const Icon(Icons.arrow_drop_down,color: Colors.white),
            //       onTap: () {
            //       },
            //     ),
            // ListTile(
            //   leading: const Icon(Icons.person, color: Colors.white,),
            //   title: Text(name, style: const TextStyle(color: Colors.white),),
            //   subtitle: const Text('admin', style: TextStyle(color: Colors.white)),
            //   trailing: const Icon(Icons.arrow_drop_down,color: Colors.white),
            //   onTap: () {

            //       },
            //     ),
        //   ],
        // ),
        
          // ),
                const SizedBox(height: 16),
             Container(
  width: 300,
  height: 40,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color:  const Color.fromARGB(255, 241, 136, 38), // Change the color as needed
  ),
  child: TextButton(
    onPressed: () {
      // Handle logout action
    },
 
    child: const Text(
      'Load More',
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
         ),
         bottomNavigationBar:  CustomCompanyBottomAppBar(token: widget.token,)
          );
  
  }
    Widget buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(),
    );
  }


}
