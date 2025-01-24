import 'package:flutter/material.dart';
import 'package:flutter_application_expand_card/details/details_page.dart';
import 'package:flutter_application_expand_card/list_page.dart';
import 'package:flutter_application_expand_card/model/card_item.dart';

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
      onGenerateRoute: (settings) {
        // better to use https://pub.dev/packages/auto_route for declaring routes.
        switch (settings.name) {
          case '/card_details':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                final card = settings.arguments as CardItem;

                return DetailsPage(card: card);
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // slide from bottom animation
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(position: offsetAnimation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 100),
              reverseTransitionDuration: const Duration(milliseconds: 100),
            );
          default:
            return MaterialPageRoute(builder: (context) => const ListPage());
        }

        // Default fallback route
      },
    );
  }
}
