import 'package:authentication_app/src/local_storage/share_preference.dart';
import 'package:flutter/material.dart';

class HomeUiScreen extends StatefulWidget {
  const HomeUiScreen({super.key});

  @override
  State<HomeUiScreen> createState() => _HomeUiScreenState();
}

class _HomeUiScreenState extends State<HomeUiScreen> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  String? info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Local Storage",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("From", style: TextStyle(fontSize: 22, color: Colors.black)),
              SizedBox(height: 10),
              TextField(
                controller: nameC,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneC,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  SharePre().saveData(
                    name: nameC.text,
                    email: emailC.text,
                    phone: phoneC.text,
                  );
                },
                child: Text("Save Data"),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  info= await SharePre().getData();
                  setState(() {});
                },
                child: Text("Show Data"),
              ),
              SizedBox(height: 20),
              Text("${info}"),
            ],
          ),
        ),
      ),
    );
  }
}
