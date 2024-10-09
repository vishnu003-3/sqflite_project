import 'package:flutter/material.dart';
import 'package:sqflite_project/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          _customBottomSheet(context);
        },
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text("Name"),
          subtitle: Text("Designation"),
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
      ),
    );
  }

  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(),
            ),
            TextFormField(
              controller: desController,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"))),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          HomeScreenController.addEmployee();
                        },
                        child: Text("Save")))
              ],
            )
          ],
        ),
      ),
    );
  }
}
