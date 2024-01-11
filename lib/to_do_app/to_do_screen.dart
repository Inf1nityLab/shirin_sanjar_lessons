import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<String> tasks = [
    'Learn flutter',
    'To do homework',
    'Clean at',
    'Wash the car'
  ];

  TextEditingController addController = TextEditingController();
  TextEditingController updateController = TextEditingController();

  //CRUD

  void create() {
    setState(() {
      tasks.add(addController.text);
    });
    Navigator.pop(context);
  }

  void delete(int index){
    setState(() {
      tasks.removeAt(index);
    });
    Navigator.pop(context);
  }

  void update(int index){
    setState(() {
      tasks[index] = updateController.text;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(radius: 40, child: Text('$index'),),
                title: Text('${tasks[index]}', style: const TextStyle(fontSize: 30),),
                subtitle: const Text('task'),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Обновить задачу'),
                              content: TextField(
                                controller: updateController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Обновить задачу'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Отмена'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    update(index);
                                  },
                                  child: const Text('Обновить задачу'),
                                ),
                              ],
                            );
                          },
                        );
                      }, icon: const Icon(Icons.edit)),
                      IconButton(onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Вы действительно хотите удалить задачу?'),

                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Отмена'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    delete(index);
                                  },
                                  child: const Text('Удалить'),
                                ),
                              ],
                            );
                          },
                        );
                      }, icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Добавить задачу'),
                content: TextField(
                  controller: addController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Добавить задачу'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Отмена'),
                  ),
                  TextButton(
                    onPressed: () {
                      create();
                    },
                    child: const Text('Добавить задачу'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
