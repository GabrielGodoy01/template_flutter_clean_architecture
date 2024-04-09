import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/app/app_widget.dart';
import 'package:flutter_clean_architecture_template/app/injector.dart';

void main() {
  registerInstances();
  runApp(const AppWidget());
}
