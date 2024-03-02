import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy and Security',
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
      body:   const SingleChildScrollView(
              child:  Padding(
        padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " 1. Information Collection:",
                style: TextStyle(fontSize: 20,  fontWeight: FontWeight.bold,color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  
                  Text('1.1. Personal Information: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      Text(
                         'We collect and store personal information, including but not limited to names, contact details, and payment information, to facilitate the booking process. Users provide this information voluntarily.',
                        style: TextStyle(
                          color: Colors.white, // Link color for conditions
                        ),

                      ),
                ]

                      ),

              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  
                  Text('1.2. Usage Data: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      Text(
                         'We may collect data on user interactions with our app, such as session duration and features accessed, to enhance user experience and improve our services.',
                        style: TextStyle(
                          color: Colors.white, // Link color for conditions
                        ),

                      ),
                ]

                      ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  
                  Text('2. Information Use: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      SizedBox(height: 16,),
                      Text('2.1. Booking Process: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      Text(
                         'Personal information is used solely for the purpose of processing bookings and facilitating communication between users and service providers',
                        style: TextStyle(
                          color: Colors.white, // Link color for conditions
                        ),
                        

                      ),
                      SizedBox(height: 16,),
                      Text('2.2. Communication: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      Text(
                         'Users may receive notifications, updates, or promotional messages related to their bookings or app features. Users can opt out of promotional communications.',
                        style: TextStyle(
                          color: Colors.white, // Link color for conditions
                        ),
                        

                      )
                ]

                      ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  
                  Text('1.1. Personal Information: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      Text(
                         'We collect and store personal information, including but not limited to names, contact details, and payment information, to facilitate the booking process. Users provide this information voluntarily.',
                        style: TextStyle(
                          color: Colors.white, // Link color for conditions
                        ),

                      ),
                ]

                      ),
                      SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  
                  Text('3. Information Sharing: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      SizedBox(height: 16,),
                  Text('3.1. Service Providers: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      Text(
                         'We may share necessary information with service providers (e.g., hotels, transportation) to fulfill bookings. These entities are bound by confidentiality and data protection agreements.',
                        style: TextStyle(
                          color: Colors.white, // Link color for conditions
                        ),

                      ),
                      SizedBox(height: 16,),
                  Text('3.2. Legal Compliance: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold 
                        ),

                      ),
                      Text(
                         'We may disclose information if required by law or to protect our rights, users, or the public.',
                        style: TextStyle(
                          color: Colors.white, // Link color for conditions
                        ),

                      ),
                ]

                      ),

  
            ],
          ),
        
      ),
   
      ),
 );
  }
}

