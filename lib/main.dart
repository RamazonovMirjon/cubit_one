
import 'package:flutter/material.dart';
import 'package:pr/core/init/storage/get_storage_service.dart';
import 'package:pr/views/auth/view/auth_view.dart';
import 'package:pr/views/home/view/home_view.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Appcha",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: a(),
        builder: (context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return const CircularProgressIndicator.adaptive();
          } else {
            return snap.data;
          }
        },
      ),
    );
  }

  Future<Widget> a() async {
    if (await StorageService.instance.reads('token') != "null") {
      return const HomeView();
    } else {
      return const AuthView();
    }
  }
}
