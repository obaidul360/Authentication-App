import 'package:flutter/material.dart';
import 'storage_class.dart';

class ListViewWidgets extends StatelessWidget {
  const ListViewWidgets({
    super.key,
    required this.userList,
    required this.refresh,
  });

  final List<String> userList;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        var parts = userList[index].split("|");

        String name = parts.length > 0 ? parts[0] : "";
        String email = parts.length > 1 ? parts[1] : "";
        String phone = parts.length > 2 ? parts[2] : "";

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Text(name.isNotEmpty ? name[0] : "?"),
            ),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "$email",
              maxLines: 1,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
            isThreeLine: true,

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✏️ Edit
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => editUser(context, index),
                ),

                // 🗑 Delete
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteUser(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 🔴 Delete
  void deleteUser(int index) async {
    userList.removeAt(index);
    await SharePre().saveAllData(userList);
    refresh();
  }

  // 🟡 Edit
  void editUser(BuildContext context, int index) {
    var parts = userList[index].split("|");

    TextEditingController nameC = TextEditingController(text: parts[0]);
    TextEditingController emailC = TextEditingController(text: parts[1]);
    TextEditingController phoneC = TextEditingController(text: parts[2]);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Edit User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameC,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              TextField(
                controller: emailC,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              TextField(
                controller: phoneC,
                decoration: const InputDecoration(hintText: "Phone"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                userList[index] = "${nameC.text}|${emailC.text}|${phoneC.text}";

                await SharePre().saveAllData(userList);
                refresh();
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }
}

/*
import 'package:flutter/material.dart';

class ListViewWidgets extends StatelessWidget {
  const ListViewWidgets({super.key, required this.userList});

  final List<String> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        var data = userList[index].split("|");

        return ListTile(
          title: Text(
            data[0],
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w400,
            ),
          ), // name
          subtitle: Text("${data[1]} | ${data[2]}"),
        );
      },
    );
  }
}
*/
