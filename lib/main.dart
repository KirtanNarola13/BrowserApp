import 'package:flutter/material.dart';
import 'package:goverment_service_app/Provider/Connect_Provider.dart';
import 'package:goverment_service_app/screens/Bing/Views/Bing.dart';
import 'package:goverment_service_app/screens/Brave/Views/brave.dart';
import 'package:goverment_service_app/screens/DuckDuck/Views/duck%20duck%20go.dart';
import 'package:goverment_service_app/screens/Homepage/Views/homepage.dart';
import 'package:goverment_service_app/screens/Yahoo/Views/yahoo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectProvider()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            // home: HomePage(),
            routes: {
              '/': (context) => const HomePage(),
              'YahooPage': (context) => const YahooPage(),
              'BingPage': (context) => const BingPage(),
              'DuckDuckPage': (context) => const DuckDuckPage(),
              'Brave': (context) => const Brave(),
            },
          );
        },
      ),
    ),
  );
}
