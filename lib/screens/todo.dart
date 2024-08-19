import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List _mytodo = [];
  void _todolist() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String todoList = '';
          return AlertDialog(
            title: const Text('My TODO'),
            content: TextField(
              onChanged: (value) {
                todoList = value;
              },
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    setState(() {
                      if (todoList.isNotEmpty) {
                        _mytodo.add(todoList);
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: Colors.white,
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: const Text('MY TODO'),
        ),
        body: ListView.builder(
            itemCount: _mytodo.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 6,
                color: Colors.pink,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ListTile(
                    title: Text(
                      _mytodo[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _mytodo.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.white,
                        ))),
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: _todolist,
          child: const Icon(
            Icons.add_circle_outline_sharp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
