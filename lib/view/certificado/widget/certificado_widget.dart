import 'package:certificados/model/certificado.dart';
import 'package:certificados/view/certificado/certificado_controller.dart';
import 'package:certificados/view/certificado/certificado_page.dart';
import 'package:flutter/material.dart';

class CertificadoWidget extends State<CertificadoPage> {
  CertificadoController controller = CertificadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: ((context, index) => Card(
              // child: ListTile(title: [index]),
              ))),
    );
  }
}
