// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pr/core/init/storage/get_storage_service.dart';
import 'package:pr/views/auth/view/auth_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child:  const Icon(Icons.logout),
        onPressed: () async {
          await StorageService.instance.delete('token');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const AuthView()),
            (route) => false,
          );
        },
      ),
    );
  }
}