import 'package:certificados/style/app_theme.dart';
import 'package:certificados/view/certificado/certificado_form_page.dart';
import 'package:certificados/view/certificado/certificado_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certificados',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const CertificadoFormPage(),
    );
  }
}
