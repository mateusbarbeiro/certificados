import 'package:certificados/model/certificado.dart';
import 'package:certificados/dao/interfaces/i_dao_certificado.dart';
import 'package:get_it/get_it.dart';

class CertificadoController {
  final IDaoCertificado _dao = GetIt.I.get<IDaoCertificado>();

  Future<List<Certificado>> get allCertificados async {
    return _dao.getAll();
  }
}
