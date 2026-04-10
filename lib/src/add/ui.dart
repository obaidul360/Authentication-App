import 'package:authentication_app/src/add/widget.dart';
import 'package:flutter/material.dart';
import 'storage_class.dart';

class TestHomeUiScreen extends StatefulWidget {
  const TestHomeUiScreen({super.key});

  @override
  State<TestHomeUiScreen> createState() => _TestHomeUiScreenState();
}

class _TestHomeUiScreenState extends State<TestHomeUiScreen> {
  List<String> userList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Load data
  Future<void> loadData() async {
    userList = await SharePre().getData();
    setState(() {});
  }

  // Add user dialog
  void openForm() {
    TextEditingController nameC = TextEditingController();
    TextEditingController emailC = TextEditingController();
    //TextEditingController phoneC = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.name,
                controller: nameC,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailC,
                decoration: const InputDecoration(hintText: "Email"),
              ),
             /* const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.phone,
                controller: phoneC,
                decoration: const InputDecoration(hintText: "Phone"),
              ),*/
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await SharePre().saveData(
                  name: nameC.text,
                  email: emailC.text,
                  //phone: phoneC.text,
                );

                Navigator.pop(context);
                loadData();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        backgroundColor: Colors.indigo,
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: openForm,
        icon: const Icon(Icons.add),
        label: const Text("Add User"),
      ),

      body: ListViewWidgets(userList: userList, refresh: loadData),
    );
  }
}

/*
import 'package:authentication_app/src/add/storage_class.dart';
import 'package:authentication_app/src/add/widget.dart';
import 'package:flutter/material.dart';


class TestHomeUiScreen extends StatefulWidget {
  const TestHomeUiScreen({super.key});

  @override
  State<TestHomeUiScreen> createState() => _TestHomeUiScreenState();
}

class _TestHomeUiScreenState extends State<TestHomeUiScreen> {
  List<String> userList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Load data
  Future<void> loadData() async {
    userList = await SharePre().getData();
    setState(() {});
  }

  // Open form dialog
  void openForm() {
    TextEditingController nameC = TextEditingController();
    TextEditingController emailC = TextEditingController();
    TextEditingController phoneC = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameC,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailC,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneC,
                decoration: const InputDecoration(hintText: "Phone"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await SharePre().saveData(
                  name: nameC.text,
                  email: emailC.text,
                  phone: phoneC.text,
                );

                Navigator.pop(context);
                loadData(); // refresh
              },
              child: const Text("Save"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Storage"),
        backgroundColor: Colors.indigo,
      ),

      // ➕ button
      floatingActionButton: FloatingActionButton(
        onPressed: openForm,
        child: const Icon(Icons.add),
      ),

      // List show
      body: ListViewWidgets(userList: userList),
    );
  }
}

*/
