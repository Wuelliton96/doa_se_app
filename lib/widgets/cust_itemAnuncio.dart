// ignore: file_names
import 'package:flutter/material.dart';

import '../models/inserirAnuncio.dart';

// ignore: must_be_immutable
class ItemAnuncio extends StatelessWidget {
  ItemAnuncio({super.key, required this.anuncio, this.onTapItem});

  Anuncio anuncio;
  VoidCallback? onTapItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // imagem
              SizedBox(
                width: 130,
                height: 140,
                child: Image.network(
                  anuncio.fotos[0],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anuncio.titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        anuncio.descricao,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        anuncio.categoria,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
