import 'package:flutter/material.dart';

class TestForGit extends StatefulWidget {
  const TestForGit({super.key});

  @override
  State<TestForGit> createState() => _TestForGitState();
}

class _TestForGitState extends State<TestForGit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Git")),
    body: Column(
      children: [
        Text("data"),
        Text("test"),
        Text("push"),
        Text("push"),
        Text("push"),
        Text("push"),
        Text("push"),
        Text("data"),
        Text("test"),
        Text("push"),
      ],
    ),);
  }
}
