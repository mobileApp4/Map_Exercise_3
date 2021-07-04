// TODO Complete the file, main/bar.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether the user has logged in or not).
//      This includes:
//        a. The app bar shows 'unknown user' logo and the 'Login' button if
//           the user has not logged in yet.
//
//        b. Otherwise (if the user has logged in), the app bar shows the user
//           photo and name, as well as the 'Logout' button.
//
//   2. Perform the following operations:
//        a. Login  - This operation will navigate to the '/login' route.
//        b. Logout - This will reset the 'user' state to 'null'.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'main_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  final MainScreenState _state;
  const Bar({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(
          backgroundImage: _state.user != null
              ? NetworkImage(_state.user.photoUrl)
              : AssetImage('assets/unknown_user.png')),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MY TODO LIST'),
          _state.user != null
              ? Text(_state.user.name, style: TextStyle(fontSize: 12.0))
              : Text('Please login to see My Todo List', style: TextStyle(fontSize: 12.0)),
        ],
      ),
      actions: [
        IconButton(
          icon: _state.user != null
              ? Icon(
                  Icons.logout,
                  color: Colors.red,
                )
              : Icon(Icons.login),
          onPressed: () {
            _state.user != null ? _logout(context) : _login(context);
          },
        )
      ],
    );
  }

  void _login(BuildContext context) async {
    var _user = await Navigator.pushNamed(context, '/login');
    if (_user != null) {
      _state.user = _user;
    }
  }

  void _logout(BuildContext context) async {
    var _user = await Navigator.pushNamed(context, '/');
    if (_user != null) {
      _state.user = _user;
    }
  }
}
