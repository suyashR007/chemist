import 'package:flutter/material.dart';

void goToPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void replacePage(BuildContext context, Widget page) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  });
}

void removePagesAndPush(BuildContext context, Widget page) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  });
}

void showMySnackBar(BuildContext context, String text) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    ),
  );
}

void showMyAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required VoidCallback onSignUpPressed,
  required String buttonText,
}) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title),
          content: Text(content),
          actionsPadding:
              const EdgeInsets.only(right: 12, left: 12, bottom: 12),
          actions: [
            ElevatedButton(
              onPressed: onSignUpPressed,
              child: Text(buttonText),
            ),
          ],
        );
      },
    ),
  );
}

bool isThemeDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
