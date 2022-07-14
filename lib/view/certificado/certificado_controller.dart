import 'package:certificados/service/interfaces/i_service_certificado.dart';
import 'package:get_it/get_it.dart';

class CerificadoController {
  IServiceCertificado service = GetIt.I.get<IServiceCertificado>();
}
