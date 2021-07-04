//-----------------------------------------------------------------------------------------------------------------------------
//? Fill in the following information
//
// SCSJ3623 Mobile Application Programming
// Exercise 3 - HTTP and JSON
//
// Pair Programming
// Member 1's Name: Nuratifah Binti Zailani  Matric:A18CS0205       Location: Kulai,Johor (i.e. where are you currently located)
// Member 2's Name: Siti Maryam Binti Mohamad Shukri   Matric:A18CS0244      Location: Ipoh, Perak
// Date and time (s):   _____________, _____________, __________   (Date and time you conducted the pair programming sessions)
//-----------------------------------------------------------------------------------------------------------------------------
//? This file is fully given.

import 'package:flutter/material.dart';

import 'router.dart';

void main() => runApp(
      MaterialApp(
        title: 'MAP Exercise 3',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    );
