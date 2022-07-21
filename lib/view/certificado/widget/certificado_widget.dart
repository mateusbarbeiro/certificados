import 'package:certificados/view/shared_widget/card_certificado.dart';
import 'package:certificados/model/certificado.dart';
import 'package:certificados/view/certificado/certificado_controller.dart';
import 'package:certificados/view/certificado/certificado_page.dart';
import 'package:flutter/material.dart';

class CertificadoWidget extends State<CertificadoPage> {
  CertificadoController controller = CertificadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificados'),
        actions: [
          _addCertificadoBotao(context),
        ],
      ),
      body: _listaCertificados(),
    );
  }

  IconButton _addCertificadoBotao(BuildContext context) {
    return IconButton(
      onPressed: () => controller.goToForm(context).then(
            (value) => setState(() {}),
          ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  FutureBuilder<List<Certificado>> _listaCertificados() {
    return FutureBuilder<List<Certificado>>(
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
    );
  }
}
