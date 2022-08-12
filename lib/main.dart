import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/providers/colouring_provider.dart';
import 'package:state_management_examples/providers/counter_provider.dart';
import 'package:state_management_examples/providers/favourite_provider.dart';
import 'package:state_management_examples/screens/colouring_screen.dart';
import 'package:state_management_examples/screens/counter_screen.dart';
import 'package:state_management_examples/screens/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (_)=>CounterProvider(),),
          ChangeNotifierProvider(
            create: (_)=>ColouringProvider(),),
          ChangeNotifierProvider(
            create: (_)=>FavouriteProvider(),),

        ],
        child: MaterialApp(
        home: FavouriteScreen(),
    ),
    );
  }
}

