import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestHomePage extends StatelessWidget {
  TestHomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(child: Text("Logged IN as :" + user.email!)),
    );
  }
}
