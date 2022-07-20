import 'package:flutter/material.dart';

class RecadosCard extends StatelessWidget {
  const RecadosCard({
    Key? key,
    required this.id,
    required this.imagemResponsavel,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.updateHome,
  }) : super(key: key);

  final int id;
  final String imagemResponsavel;
  final String titulo;
  final String descricao;
  final String categoria;
  final void Function() updateHome;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      // backgroundColor: AppColors.amber800,
                      child: Icon(Icons.person),
                      // backgroundImage: NetworkImage(
                      //   imagemResponsavel,
                      // ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 102),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                strutStyle: const StrutStyle(fontSize: 16.0),
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  text: titulo,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                categoria,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          strutStyle: const StrutStyle(fontSize: 14.0),
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.65),
                            ),
                            text: descricao,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                // onTap: () => InformacoesRecadoController.buscarRecadosPorId(
                //   context,
                //   id,
                //   updateHome,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
