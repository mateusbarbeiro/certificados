class Certificado {
  Certificado({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.dataEmissao,
    required this.quantidadeHoras,
    this.quantidadeHorasValidadas = 0,
    required this.validado,
    required this.categoria,
    this.urlImagem,
  });
  final int? id;
  final String titulo;
  final String descricao;
  final String dataEmissao;
  final int quantidadeHoras;
  final int quantidadeHorasValidadas;
  final bool validado;
  final String categoria;
  final String? urlImagem;

  // Certificado.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   titulo = json['titulo'];
  //   descricao = json['descricao'];
  //   dataEmissao = json['data_emissao'];
  //   quantidadeHoras = json['quantidade_horas'];
  //   quantidadeHorasValidadas = json['quantidade_horas_validadas'];
  //   validado = json['validado'];
  //   categoria = json['categoria'];
  //   urlImagem = json['urlImagem'];
  // }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['titulo'] = titulo;
  //   _data['descricao'] = descricao;
  //   _data['data_emissao'] = dataEmissao;
  //   _data['quantidade_horas'] = quantidadeHoras;
  //   _data['quantidade_horas_validadas'] = quantidadeHorasValidadas;
  //   _data['validado'] = validado;
  //   _data['categoria'] = categoria;
  //   _data['url_imagem'] = urlImagem;
  //   return _data;
  // }
}
