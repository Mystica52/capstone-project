import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticketpro/companypages/assignRoles.dart';
import 'package:ticketpro/companypages/companyBusDetails.dart';
import 'package:ticketpro/customerpages/aboutUs.dart';
import 'package:ticketpro/customerpages/allBuses.dart';
import 'package:ticketpro/customerpages/confirmationPage.dart';
import 'package:ticketpro/customerpages/downloadedTicket.dart';
import 'package:ticketpro/customerpages/downloadpage.dart';
import 'package:ticketpro/customerpages/editprofile.dart';
import 'package:ticketpro/customerpages/privacy.dart';
import 'package:ticketpro/customerpages/setting.dart';
import 'package:ticketpro/customerpages/signup.dart';
import 'package:ticketpro/customerpages/splash.dart';
import 'package:ticketpro/customerpages/terms&condition.dart';



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
      // home:AllBuses()
      // home:AboutUsPage()
      //  home: SettingPage(),
      // home: AssignRole(),
      // home: companyBusDetails(),
      // home: ConfirmPage(),
      // home: DownloadPage(),
      // home: DownloadedTicket(),
      // home: PrivacyPage(),
      home: Splash(),
    );
  }

}