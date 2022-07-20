import 'package:certificados/model/certificado.dart';

abstract class IDaoCertificado {
  Future insert(Certificado object);

  Future update(Certificado object);

  Future deleteById(int id);

  Future<Certificado> getById(int id);

  Future<List<Certificado>> getAll();
}
