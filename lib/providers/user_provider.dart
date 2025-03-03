import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import '../models/user.dart';
import '../repositories/user_repository.dart';
import 'dart:io'; // For SocketException

//Since state of the User list is to be maintained, we implemented UserProvider
class UserProvider extends ChangeNotifier {
  //Our attributes:
  final UserRepository _repository;
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  //Constructor:
  UserProvider(this._repository);

  //Getters:
  List<User> get users => _users;

  bool get isLoading => _isLoading;

  String? get error => _error;

  //Methods:
  Future<void> fetchUsers() async {
    _isLoading = true;
    // Delaying notifyListeners until the next frame:
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners(); // Notify listeners that the state has changed
    });

    try {
      _users = await _repository.fetchUsers();

      _error = null;
    } on SocketException {
      // Handling no internet connectivity:
      _error = 'No internet connection. Please check your network settings.';
    } on http.ClientException {
      // Handling other HTTP errors (e.g. server down):
      _error = 'Failed to connect to the server. Please try again later.';
    } catch (e) {
      // Handling any other unexpected errors:
      _error = 'An unexpected error occurred: ${e.toString()}';
      developer.log(_error!);
    } finally {
      _isLoading = false;
      // Delaying notifyListeners until the next frame:
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify listeners that the state has changed
      });
    }
  }

  void deleteUser(int userId) {
    //Simply removing the user from the local list:
    _users.removeWhere((user) => user.id == userId);
    notifyListeners();
  }

  void addUser(User user) {
    _users.insert(0, user);
    notifyListeners();
  }
}
