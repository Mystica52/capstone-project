import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticketpro1/companypages/companyBusDetails.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey= stripePublishableKey;
  // await Stripe.instance.applySettings();
  runApp(const ticketApp());
}

class ticketApp extends StatelessWidget {
  const ticketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color(0xFF425C5A)
      ),
      // home:SignupPage()
      // home: const CardFormScreen()
      // home:const editProfile()
      // home: BusBooking(),
      // home:AllBuses()
      // home:AboutUsPage()
      //  home: SettingPage(),
      // home: AssignRole(),
      home: companyBusDetails(),
      // home: AddingBus(),
      // home: ConfirmPage(),
      // home: DownloadPage(),
      // home: DownloadedTicket(),
      // home: PrivacyPage(),
      // home: Splash(),
    );
  }

}