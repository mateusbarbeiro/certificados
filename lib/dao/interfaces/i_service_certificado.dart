import 'package:certificados/model/certificado.dart';

abstract class IServiceCertificado {
  Future insert(Certificado object);

  Future update(Certificado object);

  Future deleteById(int id);

  Future<Certificado> getById(int id);

  Future<List<Certificado>> getAll();
}
