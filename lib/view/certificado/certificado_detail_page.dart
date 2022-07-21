import 'package:flutter/cupertino.dart';

import 'widget/certificado_detail_widget.dart';

class CertificadoDetailPage extends StatefulWidget {
  final int id;

  const CertificadoDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CertificadoDetailPage> createState() => CertificadoDetailWidget();
}
