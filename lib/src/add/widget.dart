
import 'package:flutter/material.dart';
class ListViewWidgets extends StatelessWidget {
  const ListViewWidgets({
    super.key,
    required this.userList,
  });

  final List<String> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        var data = userList[index].split("|");

        return ListTile(
          title: Text(data[0]), // name
          subtitle: Text("${data[1]} | ${data[2]}"),
        );
      },
    );
  }
}