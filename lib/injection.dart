import 'package:certificados/dao/interfaces/i_dao_certificado.dart';
import 'package:certificados/dao/sqflite/certificado/dao_certificado.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future setupInjection() async {
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<IDaoCertificado>(DaoCertificado());
}
