import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_expense_tracker/firebase_options.dart';
import 'package:smart_expense_tracker/models/expense.dart';
import 'package:smart_expense_tracker/views/dashboard_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Hive.registerAdapter(ExpenseAdapter());
  await Hive.initFlutter();
  await Hive.openBox('expenses');
  runApp(const SmartExpenseTrackerApp());
}

class SmartExpenseTrackerApp extends StatelessWidget {
  const SmartExpenseTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const DashboardScreen(),
    );
  }
}
