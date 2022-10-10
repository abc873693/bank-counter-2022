import 'package:bank_counter/models/bank_counter_model.dart';
import 'package:bank_counter/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

const List<BankCounterModel> _counterList = <BankCounterModel>[
  BankCounterModel('Amy'),
  BankCounterModel('Bob'),
  BankCounterModel('Cory'),
  BankCounterModel('Dora'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(counterList: _counterList),
    );
  }
}
