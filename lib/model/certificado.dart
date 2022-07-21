class Certificado {
  final int? id;
  final String titulo;
  final String descricao;
  final String dataEmissao;
  final int quantidadeHoras;
  final int quantidadeHorasValidadas;
  final bool validado;
  final String categoria;
  final String? urlImagem;

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
}
