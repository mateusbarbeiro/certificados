import 'package:certificados/components/card_certificado.dart';
import 'package:certificados/model/certificado.dart';
import 'package:certificados/view/certificado/certificado_controller.dart';
import 'package:certificados/view/certificado/certificado_page.dart';
import 'package:flutter/material.dart';

class CertificadoWidget extends State<CertificadoPage> {
  CertificadoController controller = CertificadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Certificados')),
      body: FutureBuilder<List<Certificado>>(
        future: controller.allCertificados,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: data
                  .map(
                    (e) => CardCertificado(
                      id: e.id ?? 0,
                      validado: e.validado,
                      titulo: e.titulo,
                      descricao: e.descricao,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
