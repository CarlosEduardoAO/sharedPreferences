import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtConName = TextEditingController();
    TextEditingController txtConDesc = TextEditingController();
    String dropDownValue = "pendiente";
    List<String> dropDownValues = ['Pendiente', 'Completado', 'En proceso'];

    final txtNameTask = TextFormField(
      controller: txtConName,
    );

    final txtDscTask = TextField(
      maxLines: 6,
      controller: txtConDesc,
    );
    final DropdownButton ddBStatus = DropdownButton(
      value: dropDownValues,
      items: dropDownValues
          .map((status) => DropdownMenuItem(
                value: status,
                child: Text(status),
              ))
          .toList(),
      onChanged: (value) {
        dropDownValue = value;
        setState(() {});
      },
    );
    final ElevatedButton btnGuardar = ElevatedButton(
      onPressed: () {},
      child: Text('Save Task'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Column(children: [txtNameTask, txtDscTask, ddBStatus, btnGuardar]),
    );
  }
}
