// TODO Complete the file, main/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with 'FutureBuilder' widget.
//      For todo items with the status has been 'done', they should be displayed
//      with the 'line through'. Otherwise, display it with normal text.
//
//   2. Perform the following operations:
//        a. Edit a todo - i.e., when the user tap a todo.
//           This operation will navigate to the '/edit' route.
//        b. Delete a todo - i.e. when the user long-press a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: _state.todoListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _state.todoList = snapshot.data;
            return _buildListView();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  void editFunction(BuildContext context, int index) async {
    final returnData = await Navigator.pushNamed(context, '/edit',
        arguments: _state.todoList[index]);
    if (returnData != null) {
      _state.updateTodo(index: index, todo: _state.todoList[index]);
    } else {
      _state.refreshTodoListFuture();
    }
  }

  ListView _buildListView() {
    return ListView.separated(
      itemCount: _state.todoList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => ListTile(
        title: Text('${_state.todoList[index].title}',
            style: _state.todoList[index].done
                ? TextStyle(decoration: TextDecoration.lineThrough)
                : TextStyle(decoration: TextDecoration.none)),
        subtitle: Text('${_state.todoList[index].description}'),
        onTap: () => editFunction(context, index),
        onLongPress: () => _state.removeTodo(_state.todoList[index]),
      ),
    );
  }
}
