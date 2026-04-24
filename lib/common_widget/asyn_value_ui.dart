import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsynValueUi on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    final message = errorMessage(error);
    if (!isLoading && hasError) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text(message),
            icon: Icon(Icons.error, size: 40, color: Colors.red),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }
}

String errorMessage(Object? error) {
  if (error is FirebaseAuthException) {
    return error.message ?? error.toString();
  } else {
    return error.toString();
  }
}
