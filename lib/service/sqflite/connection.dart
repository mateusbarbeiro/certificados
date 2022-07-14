import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'certificado');
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(createTableCertificado);
      });
    }
    return _db!;
  }
}

const createTableCertificado = '''
  CREATE TABLE certificado (
    id INTEGER NOT NULL PRIMARY KEY
    ,titulo VARCHAR(200) NOT NULL
    ,descricao VARCHAR(20) NOT NULL
    ,dataEmissao VARCHAR(20) NOT NULL
    ,quantidadeHoras INTEGER NOT NULL
    ,quantidadeHorasValidadas INTEGER NULL
    ,validado BOOLEAN NOT NULL CHECK (quantidadeHorasValidadas IN(0,1))
    ,categoria VARCHAR(30) NOT NULL
    ,urlImage VARCHAR(20) NULL
  )
''';
