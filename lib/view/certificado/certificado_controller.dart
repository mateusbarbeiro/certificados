import 'package:certificados/model/certificado.dart';
import 'package:certificados/dao/interfaces/i_dao_certificado.dart';
import 'package:certificados/view/certificado/certificado_form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CertificadoController {
  final formKey = GlobalKey<FormState>();
  final IDaoCertificado _dao = GetIt.I.get<IDaoCertificado>();
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final dataEmissaoController = TextEditingController();
  final quantHorasController = TextEditingController();
  final quantHorasValidadasController = TextEditingController();
  final certificadoValidadoController = TextEditingController();
  final urlImagemController = TextEditingController();
  bool status = false;
  String? grupo;
  List<String> grupos = [
    "Grupo 1",
    "Grupo 2",
    "Grupo 3",
  ];

  Future<List<Certificado>> get allCertificados async {
    return _dao.getAll();
  }

  Future goToForm(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CertificadoFormPage(),
      ),
    );
  }

  void insertCertificado(BuildContext context) {
    Certificado certificado = Certificado(
      titulo: tituloController.text,
      descricao: descricaoController.text,
      dataEmissao: dataEmissaoController.text,
      quantidadeHoras: int.parse(quantHorasController.text),
      quantidadeHorasValidadas: int.parse(
          quantHorasValidadasController.text == ""
              ? quantHorasValidadasController.text
              : "0"),
      validado: status,
      categoria: grupo!,
      urlImagem: urlImagemController.text,
    );

    _dao.insert(certificado);
    Navigator.pop(context);
  }
}
