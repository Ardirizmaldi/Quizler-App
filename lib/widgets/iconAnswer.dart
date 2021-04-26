import 'package:flutter/material.dart';

class IconAnswer {
  Icon getIcon(bool correct) {
    return Icon(
      correct ? Icons.check : Icons.close,
      color: correct ? Colors.green : Colors.red,
    );
  }
}
