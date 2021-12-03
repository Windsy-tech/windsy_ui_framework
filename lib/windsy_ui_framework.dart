/*
This flutter package contains UI elements that are used commonly
in all Windsy software's for both internal and external use.

created date: 18/11/2021.
created by: Manjunath Muntha Purushotham
* */

library windsy_ui_framework;

import 'package:flutter/material.dart';

//Theme Data
class WThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class WTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
  );
}

//Square Button
class WSquareButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  // ignore: use_key_in_widget_constructors
  const WSquareButton({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.zero,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }
}

//Text Box
class WTextBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle hintStyle;
  final Function(String) onChanged;

  const WTextBox({
    Key key,
    @required this.controller,
    this.hintText,
    this.hintStyle,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (string) => onChanged(string),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xFF1D70B8),
            style: BorderStyle.solid,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xFF1D70B8),
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
