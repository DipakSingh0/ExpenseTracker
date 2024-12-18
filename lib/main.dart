import 'package:expensetracker/google_sheets_api.dart';
import 'package:expensetracker/homepage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //loading .env file
  // await dotenv.load(fileName: ".env"); //          //

  //initialize google sheets connection
  await GoogleSheetsApi().init();

  //testing connection by fetching first
  await GoogleSheetsApi.testConnection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
