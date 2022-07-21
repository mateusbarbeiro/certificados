import 'package:certificados/view/certificado/certificado_controller.dart';
import 'package:certificados/view/shared_widget/custom_switch.dart';
import 'package:certificados/view/certificado/certificado_form_page.dart';
import 'package:certificados/view/shared_widget/input/input_data_widget.dart';
import 'package:certificados/view/shared_widget/input/input_texto_widget.dart';
import 'package:flutter/material.dart';

class CertificadoPageWidget extends State<CertificadoFormPage> {
  final formKey = GlobalKey<FormState>();
  bool _status = false;

  final CertificadoController controller = CertificadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              inputTitulo(),
              inputDescricao(),
              inputData(),
              inputHoras(),
              inputHorasValidas(),
              certificadoValido(),
              inputCategoria(),
            ],
          ),
        ),
      ),
    );
  }

  InputTextoWidget inputTitulo() {
    return InputTextoWidget(
      labelText: "Titulo",
      paddingBottom: 0,
      maxLength: 50,
      paddingTop: 35,
      isIconDate: true,
      icon: const Icon(
        Icons.text_format,
        color: Colors.black87,
      ),
      controller: controller.tituloController,
      //validator: controller.nomeValidator,
    );
  }

  InputTextoWidget inputDescricao() {
    return InputTextoWidget(
      labelText: "Descrição",
      paddingBottom: 0,
      maxLength: 200,
      paddingTop: 18,
      isIconDate: true,
      icon: const Icon(
        Icons.text_fields,
        color: Colors.black87,
      ),
      controller: controller.descricaoController,
      //validator: controller.nomeValidator,
    );
  }

  InputDataWidget inputData() {
    return InputDataWidget(
      hintText: 'Data emissão',
      paddingBottom: 0,
      paddingTop: 5,
      onChanged: (String? value) {
        setState(
          () {
            if (value != null) {
              controller.dataEmissaoController.text = value;
            }
          },
        );
      },
      controller: controller.dataEmissaoController,
      // validator: controller.dataValidator,
    );
  }

  InputTextoWidget inputHoras() {
    return InputTextoWidget(
      labelText: "Quantidae horas",
      keyboardType: TextInputType.number,
      mask: "####",
      paddingBottom: 0,
      maxLength: 4,
      paddingTop: 5,
      isIconDate: true,
      icon: const Icon(
        Icons.lock_clock,
        color: Colors.black87,
      ),
      controller: controller.quantHorasController,
    );
  }

  InputTextoWidget inputHorasValidas() {
    return InputTextoWidget(
      labelText: "Quantidae horas validadas",
      keyboardType: TextInputType.number,
      mask: "####",
      paddingBottom: 0,
      maxLength: 4,
      paddingTop: 5,
      isIconDate: true,
      icon: const Icon(
        Icons.lock_clock,
        color: Colors.black87,
      ),
      controller: controller.quantHorasValidadasController,
    );
  }

  CustomSwitch certificadoValido() {
    return CustomSwitch(
      paddingTop: 10,
      paddingBottom: 0,
      label: "Certifcado valido",
      value: _status,
      onChanged: (bool value) {
        setState(() {
          _status = value;
          if (value != null) {
            controller.certificadoValidadoController.text = _status.toString();
          }
        });
      },
    );
  }

  InputTextoWidget inputCategoria() {
    return InputTextoWidget(
      labelText: "Categoria",
      paddingBottom: 0,
      maxLength: 50,
      paddingTop: 25,
      isIconDate: true,
      icon: const Icon(
        Icons.category,
        color: Colors.black87,
      ),
      controller: controller.categoriaController,
      //validator: controller.nomeValidator,
    );
  }
}
