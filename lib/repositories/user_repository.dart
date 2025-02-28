import 'dart:convert';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {

  //Singleton pattern is used to create a single instance of the class
  UserRepository ._privateConstructor();
  static final UserRepository  instance = UserRepository ._privateConstructor();

  Future<List<User>> fetchUsers() async {
    String url = 'https://jsonplaceholder.typicode.com/users';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body))
          .map((json) => User.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch Users!');
    }
  }
}
