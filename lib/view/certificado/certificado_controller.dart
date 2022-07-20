import 'package:certificados/model/certificado.dart';
import 'package:certificados/dao/interfaces/i_dao_certificado.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class CertificadoController {
  final IDaoCertificado _dao = GetIt.I.get<IDaoCertificado>();
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final dataEmissaoController = TextEditingController();
  final quantHorasController = TextEditingController();
  final quantHorasValidadasController = TextEditingController();
  final certificadoValidadoController = TextEditingController();
  final categoriaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<List<Certificado>> get allCertificados async {
    return _dao.getAll();
  }
}
