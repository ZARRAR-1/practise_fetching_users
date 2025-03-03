import 'package:flutter/material.dart';
import 'package:practise_fetching_users/providers/user_provider.dart';
import 'package:practise_fetching_users/repositories/user_repository.dart';
import 'package:practise_fetching_users/screens/home_page.dart';
import 'package:provider/provider.dart';


//Theme data
const Color primaryColor = Colors.white;
const Color secondaryColor = Color.fromRGBO(7, 94, 85, 1);
const Color primaryTextColor = Colors.black;
const Color secondaryTextColor = Colors.grey;

void main() {
  runApp(
    //User Provider is provided for app vide access along with passing UserRepository instance:
    ChangeNotifierProvider(
      create: (context) => UserProvider(UserRepository.instance),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(title: 'All Connections'),
    );
  }
}

//TODO:
//1) Implement Custom Search Bar in home page which doesn't scroll
//2) Add Navigation to a details page of a user, showing all his details.