import 'package:get_it/get_it.dart';

import '../dao/interfaces/i_dao_certificado.dart';
import 'certificado.dart';

class CertificadoService {
  final IDaoCertificado _dao = GetIt.I.get<IDaoCertificado>();

  Future insert(Certificado object) async {
    _validaHoras(object);

    await _dao.insert(object);
  }

  Future update(Certificado object) async {
    _validaHoras(object);

    await _dao.update(object);
  }

  Future deleteById(int id) async {
    await _dao.deleteById(id);
  }

  Future<Certificado> getById(int id) async {
    return await _dao.getById(id);
  }

  Future<List<Certificado>> getAll() async {
    return await _dao.getAll();
  }

  void _validaHoras(Certificado object) {
    if (object.quantidadeHoras == 0) {
      throw Exception('Deveria ser inserido a quantidade de horas');
    }

    if (object.validado && object.quantidadeHorasValidadas == 0) {
      throw Exception('Deveria ser inserido a quantidade de horas validadas');
    }
  }
}
