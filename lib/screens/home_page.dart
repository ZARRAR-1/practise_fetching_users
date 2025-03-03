import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/Custom_appbar.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/floating_action_button.dart';
import 'add_user_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<User> fetchedUsers = [];

  @override
  void initState() {
    super.initState();
    //Functionality to fetch users:
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
    // fetchedUsers = Provider.of<UserProvider>(context, listen: false).users ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      floatingActionButton: CustomFloatingActionButton(
        myIcon: const Icon(Icons.add),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNewUser()),
          );
        },
      ),
      body: SafeArea(
        child: Consumer<UserProvider>(
          builder:
              (BuildContext context, UserProvider userProvider, Widget? child) {
            if (userProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            }

            if (userProvider.error != null) {
              //Means there is some error text stored
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      userProvider.error!,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Retry fetching users
                        Provider.of<UserProvider>(context, listen: false)
                            .fetchUsers();
                      },
                      child: const Text('Tap to Retry'),
                    ),
                  ],
                ),
              );
              // Center(child: Text(userProvider.error!));
            }
            if (userProvider.users.isEmpty) {
              return const Center(
                child: Text(
                  'No users found.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return RefreshIndicator(
              color: Colors.grey,
              onRefresh: () async {
                await Provider.of<UserProvider>(context, listen: false)
                    .fetchUsers();

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 100),
                      content: Text('Refreshed Successfully!'),
                      backgroundColor: Colors.green,
                      // behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                // Force scrollable
                itemBuilder: (context, index) {
                  final user = userProvider.users[index];
                  return CustomListTile(
                    userName: user.name,
                    email: user.email,
                    userId: user.id,
                  );
                },
                itemCount: Provider.of<UserProvider>(context, listen: false)
                    .users
                    .length,
                shrinkWrap: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
