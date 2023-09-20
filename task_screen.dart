import 'package:flutter/material.dart';
import 'package:pmsn20232/database/agenda_db.dart';
import '../database/models/task_models.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  AgendaDB? agendaDB;
  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/add'),
              icon: Icon(Icons.task))
        ],
      ),
      body: FutureBuilder(
          future: agendaDB!.GETALLTASk(),
          builder:
              (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("Hello Madafaka");
                  });
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text("WTF bro, you are dumb ass"),
                );
              } else {
                return CircularProgressIndicator();
              }
            }
          }),
    );
  }
}
