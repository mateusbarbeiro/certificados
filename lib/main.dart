import 'package:certificados/injection.dart';
import 'package:certificados/view/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupInjection();

  runApp(const MyApp());
}
