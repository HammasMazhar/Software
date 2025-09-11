import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Future<bool> checkPassword(BuildContext context) async {
  final TextEditingController controller = TextEditingController();
  bool isCorrect = false;

  String currentPassword =
      Hive.box('passwordBox').get('password', defaultValue: '122003');

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Enter Password"),
        content: TextField(
          controller: controller,
          obscureText: true,
          decoration: const InputDecoration(hintText: "Password"),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              if (controller.text == currentPassword) {
                isCorrect = true;
              }
              Navigator.pop(context);
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                changePassword(context);
              },
              child: Text('Change Password')),
        ],
      );
    },
  );

  if (!isCorrect && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Wrong password!")),
    );
  }

  return isCorrect;
}

void changePassword(BuildContext context) {
  final oldController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Change Password"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Old Password"),
            ),
            TextField(
              controller: newController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "New Password"),
            ),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: "Confirm New Password"),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              String currentPassword = Hive.box('passwordBox')
                  .get('password', defaultValue: '122003');
              if (oldController.text != currentPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Old password is wrong")));
                return;
              }
              if (newController.text != confirmController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Passwords do not match")));
                return;
              }

              Hive.box('passwordBox').put('password', newController.text);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Password changed successfully")));
              Navigator.pop(context);
            },
            child: const Text("Change"),
          ),
        ],
      );
    },
  );
}
