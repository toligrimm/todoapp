
import 'package:flutter/material.dart';

class Todo {
  String text;
  Todo(this.text);
}

List<Todo> todos = [
  // Todo("Learn Flutter"),
  // Todo("Make Todo App List"),
  // Todo("Search for out of range error"),
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onReorder(int oldIndex, int newIndex) {
    setState(
          () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final Todo item = todos.removeAt(oldIndex);
        todos.insert(newIndex, item);
      },
    );
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        children: List.generate(todos.length, (index) {
          return ListViewCard(index, Key('$index'), todos, refresh);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.insert(todos.length, Todo("New Todo"));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<Todo> todoList;
  VoidCallback callback;

  ListViewCard(this.index, this.key, this.todoList, this.callback);
  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
     child: ListTile(
        title: Text(widget.todoList[widget.index].text),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            todos.removeAt(widget.index);
            widget.callback();
            /*setState(() {
              todos.removeAt(widget.index);
            });*/
          },
        ),
        onTap: () {},
      ),
    );
  }
}