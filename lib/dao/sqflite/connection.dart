import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'certificado');
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(createTableCertificado);
        db.execute(insertCertificado);
      });
    }
    return _db!;
  }
}

const createTableCertificado = '''
  CREATE TABLE certificado (
    id INTEGER PRIMARY KEY
    ,titulo VARCHAR(50) NOT NULL
    ,descricao VARCHAR(200) NOT NULL
    ,dataEmissao VARCHAR(20) NOT NULL
    ,quantidadeHoras INTEGER NOT NULL
    ,quantidadeHorasValidadas INTEGER NULL
    ,validado BOOLEAN NOT NULL CHECK (validado IN(0,1))
    ,categoria VARCHAR(30) NOT NULL
    ,urlImage VARCHAR(20) NULL
  )
''';

const insertCertificado =
    '''INSERT INTO certificado (titulo, dataEmissao, descricao, 
      categoria, quantidadeHoras, quantidadeHorasValidadas, 
      validado, urlImage) VALUES (
        'object.titulo',
        'object.dataEmissao',
        'object.descricao',
        'object.categoria',
        5,
        5,
        true,
        'object.urlImagem')''';
