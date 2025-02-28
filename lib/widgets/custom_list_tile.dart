import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/user_provider.dart';

class CustomListTile extends StatelessWidget {
  final String userName;
  final String email;
  final int userId;

  const CustomListTile({
    super.key,
    required this.userName,
    required this.email,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return IndividualUser(
            //           //TODO: implement IndividualUser as an optional functionality
            //           // chat: chat
            //           );
            //     },
            //   ),
            // );
          },
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.teal,
            ),
            title: Text(userName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            subtitle: Row(
              children: [
                // Correctly placed opening bracket
                Expanded(
                  child: Text(
                    email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ), // Correctly placed closing bracket
              ], // Correctly placed closing bracket
            ),
            trailing: IconButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false)
                    .deleteUser(userId);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 100),
                      content: Text('User Deleted Successfully!'),
                      backgroundColor: Colors.green,
                      // behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              icon: const Icon(Icons.delete_forever),
            ),
          ),
        ),
        const Divider(color: secondaryTextColor, indent: 80, endIndent: 15),
      ],
    );
  }
}
