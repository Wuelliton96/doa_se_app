import 'package:flutter/material.dart';

import '../models/inserirAnuncio.dart';

// ignore: must_be_immutable
class ItemAnuncioUsuario extends StatelessWidget {
  ItemAnuncioUsuario(
      {super.key,
      required this.anuncio,
      this.onTapItem,
      this.onPressedRemover});

  Anuncio anuncio;
  VoidCallback? onTapItem;
  VoidCallback? onPressedRemover;

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
                        anuncio.categoria,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              // botão remover
              if (onPressedRemover != null)
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: onPressedRemover,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
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
