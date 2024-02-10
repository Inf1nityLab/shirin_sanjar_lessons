




import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shirin_sanjar_lessons/profile/model/person_model.dart';
import 'package:shirin_sanjar_lessons/profile/service/service.dart';

import '../compas/compas.dart';

class ProfilScreen extends StatelessWidget {
   ProfilScreen({super.key});

   final Service _service = compas<Service>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _service.getData(),
      builder: (context, AsyncSnapshot<List<PersonModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return  TodoListPage(snapshot.data ?? []);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}


class TodoListPage extends StatefulWidget {
  final List<PersonModel> person;

  TodoListPage(this.person);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final Service _service = compas<Service>();
  final TextEditingController _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile screen"),
        backgroundColor: Colors.black,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<PersonModel>('Person').listenable(),
        builder: (context, Box<PersonModel> box, _) {
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              var todo = box.getAt(index);
              return ListTile(
                title: Text(todo!.name),
                subtitle: Text(todo!.age),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add Todo'),
                  content: TextField(
                    controller: _controllerName,
                  ),
                  actions: [
                    ElevatedButton(
                      child: Text('Add'),
                      onPressed: () {
                        if (_controllerName.text.isNotEmpty){
                          var todo = PersonModel(_controllerName.text, '24');
                          _service.create(todo);
                          _controllerName.clear();
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

