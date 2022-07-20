import 'package:certificados/model/certificado.dart';
import 'package:certificados/dao/interfaces/i_service_certificado.dart';
import 'package:get_it/get_it.dart';

class CertificadoController {
  IServiceCertificado service = GetIt.I.get<IServiceCertificado>();

  Future<List<Certificado>> get allCertificados async {
    return List.generate(
      3,
      ((index) => Certificado(
            titulo: 'Titulo $index',
            descricao: 'Descrição $index',
            dataEmissao: 'Data Emissao $index',
            quantidadeHoras: index,
            quantidadeHorasValidadas: index,
            validado: true,
            categoria: 'Categoria',
          )),
    );
  }
}
