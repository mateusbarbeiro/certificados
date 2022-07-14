import 'package:certificados/service/interfaces/i_service_certificado.dart';
import 'package:certificados/service/sqflite/certificado/service_certificado.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future setupInjection() async {
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<IServiceCertificado>(ServiceCertificado());
}
