import 'package:certificados/model/certificado.dart';
import 'package:certificados/dao/interfaces/i_dao_certificado.dart';
import 'package:certificados/dao/sqflite/connection.dart';
import 'package:sqflite/sqflite.dart';

class DaoCertificado extends IDaoCertificado {
  late Database _db;

  @override
  Future deleteById(int id) async {
    _db = await Connection.get();

    var sql = "DELETE FROM certificado WHERE id = ?";
    await _db.rawDelete(sql, [id]);
  }

  @override
  Future<List<Certificado>> getAll() async {
    _db = await Connection.get();

    List<Map<String, dynamic>> resultado = await _db.query("certificado");
    List<Certificado> certificados = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Certificado(
        id: linha['id'],
        titulo: linha['titulo'],
        dataEmissao: linha['dataEmissao'],
        descricao: linha['descricao'],
        categoria: linha['categoria'],
        quantidadeHoras: linha['quantidadeHoras'],
        quantidadeHorasValidadas: linha['quantidadeHorasValidadas'],
        validado: linha['validado'] == 1,
        urlImagem: linha['urlImagem'],
      );
    });

    return certificados;
  }

  @override
  Future<Certificado> getById(int id) async {
    _db = await Connection.get();

    var sql = "SELECT * FROM certificado WHERE id = ?";
    var linha = (await _db.rawQuery(sql, [id])).first;

    var certificado = Certificado(
      id: int.parse(linha['id'].toString()),
      titulo: linha['titulo'].toString(),
      dataEmissao: linha['dataEmissao'].toString(),
      descricao: linha['descricao'].toString(),
      categoria: linha['categoria'].toString(),
      quantidadeHoras: int.parse(linha['quantidadeHoras'].toString()),
      quantidadeHorasValidadas:
          int.parse(linha['quantidadeHorasValidadas'].toString()),
      validado: linha['validado'] == 1,
      urlImagem: linha['urlImagem'].toString(),
    );

    return certificado;
  }

  @override
  Future insert(Certificado object) async {
    _db = await Connection.get();

    if (object.id != null) {
      throw Exception();
    }

    var sql = '''INSERT INTO certificado (titulo, dataEmissao, descricao, 
      categoria, quantidadeHoras, quantidadeHorasValidadas, 
      validado, urlImagem) VALUES (?, ?, ?, ?, ?, ?, ?, ?)''';
    await _db.rawInsert(sql, [
      object.titulo,
      object.dataEmissao,
      object.descricao,
      object.categoria,
      object.quantidadeHoras,
      object.quantidadeHorasValidadas,
      object.validado,
      object.urlImagem,
    ]);
  }

  @override
  Future update(Certificado object) async {
    _db = await Connection.get();

    _db = await Connection.get();

    if (object.id == null) {
      throw Exception();
    }

    var sql = '''INSERT INTO certificado (id, titulo, dataEmissao, descricao, 
      categoria, quantidadeHoras, quantidadeHorasValidadas, 
      validado, urlImagem) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)''';
    await _db.rawInsert(sql, [
      object.id,
      object.titulo,
      object.dataEmissao,
      object.descricao,
      object.categoria,
      object.quantidadeHoras,
      object.quantidadeHorasValidadas,
      object.validado,
      object.urlImagem,
    ]);
  }
}
