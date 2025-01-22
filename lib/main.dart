import 'package:flutter/material.dart';
import 'package:flutter_application_expand_card/details_page.dart';
import 'package:flutter_application_expand_card/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const ListPage(),
        '/card_details': (contexrt) => const DetailsPage(),
      },
    );
  }
}
