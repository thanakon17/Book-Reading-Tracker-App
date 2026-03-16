import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/book_provider.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookProvider()..loadData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Reading Tracker',
      theme: ThemeData(
        useMaterial3: true, // เปิดใช้งาน Material 3
        colorSchemeSeed: const Color.fromARGB(255, 0, 200, 255), // ใช้สี Indigo เป็นสีหลัก
        // ปรับฟอนต์ให้ดูทันสมัย (เช่น สารบรรณ หรือ Kanit)
        textTheme: GoogleFonts.sarabunTextTheme(Theme.of(context).textTheme), 
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent, // AppBar แบบใส
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}