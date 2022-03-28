// import 'package:flutter/material.dart';
//
//
//
// class TodoList extends StatefulWidget {
//   @override
//   _TodoListState createState() => _TodoListState();
//
// }
//
// class _TodoListState extends State<TodoList> {
//   final List<String> _todoList = [];
//   final TextEditingController _textFieldController = TextEditingController();
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Toliks To-Do List'),
//       ),
//       body: Scrollbar(
//         isAlwaysShown: true,
//         child: ListView(
//           // ignore: prefer_const_literals_to_create_immutables
//           children: _getItems(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         elevation: 10,
//         onPressed: () => _displayDialog(context),
//         tooltip: 'Добавить задачу',
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//
//   }
//
//
//   void _addTodoItem(String title) {
//     setState(() {
//       _todoList.add(title);
//     });
//     _textFieldController.clear();
//   }
//
//
//
//   Widget _buildTodoItem(String title) {
//     return ListTile(title: Text(title),);
//   }
//
//   Future<Future> _displayDialog(BuildContext context) async {
//     return showDialog(
//         barrierColor: Colors.pink.shade50,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Добавить задачу в список'),
//             content: TextField(
//               autofocus: true,
//               // enabled: editable,
//               controller: _textFieldController,
//               decoration: const InputDecoration(
//                 hintText: 'Ввести здесь',
//                 errorText: 'Не должно быть пустым',
//               ),
//               onEditingComplete: (){
//                 // After editing is complete, make the editable false
//                 setState(() {
//                 });
//               },
//             ),
//             actions: <Widget>[
//               TextButton(
//                   autofocus: true,
//                   child: const Text('Добавить'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     _addTodoItem(_textFieldController.text);
//                   }
//               ),
//               TextButton(
//                 child: const Text('Отменить'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           );
//         });
//   }
//
//   List<Widget> _getItems() {
//     final List<Widget> _todoWidgets = <Widget>[];
//     for (String title in _todoList) {
//       _todoWidgets.add(_buildTodoItem(title));
//       _todoWidgets.isEmpty;
//     }
//     return _todoWidgets;
//
//   }
//
//
//
// }