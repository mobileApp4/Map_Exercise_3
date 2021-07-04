// TODO Complete the file, edit/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether it is for 'editing an existing todo' or 'creating a new todo').
//      This includes:
//        a. The 'done' field will only be enabled if it is an 'editing' mode
//
//   2. Update the states and reflect the changes on the UI:
//        a. when the user types in the 'title'.
//        b. when the user types in the 'description'.
//        c. when the user taps on the 'done' checkbox.
//
//   3. Perform the following operations:
//        a. Accept the updated / created item - i.e. when the 'Ok' button is tapped on.
//        b. Cancel the changes - i.e. when the 'Cancel' button is tapped on.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import '../../models/todo.dart';

import 'edit_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final EditScreenState _state;

  @override
  Widget build(BuildContext context) {
    Todo _todoEditable = Todo.copy(_state.widget.data);
    return ListView(
      children: [
        _buildTextLisTile(
            label: 'Title',
            value: _state.widget.isEditing ? _todoEditable.title : '',
            onChanged: (value) {
              _state.widget.data.title = value;
            }),
        _buildTextLisTile(
            label: 'Description',
            value: _state.widget.isEditing ? _todoEditable.description : '',
            onChanged: (value) {
              _state.widget.data.description = value;
            }),
        Visibility(
          visible: _state.widget.isEditing,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return CheckboxListTile(
                value: _todoEditable.done,
                onChanged: (value) {
                  setState(() {
                    _state.widget.data.done = value;
                    _todoEditable.done = value;
                  });
                },
                title: Text('Done'),
              );
            },
          ),
        ),
        _buildButtons(context)
      ],
    );
  }

  ListTile _buildTextLisTile({label, value, onChanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.pop(context, _state.widget.data);
          },
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
      ],
    );
  }}
