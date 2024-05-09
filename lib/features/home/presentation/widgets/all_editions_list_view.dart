import 'package:flutter/material.dart';

import '../../../../core/shared/domain/entities/magazine.dart';

class AllEditionsListView extends StatelessWidget {
  const AllEditionsListView({
    required this.magazines,
    super.key,
  });

  final List<Magazine> magazines; // Lista de revistas a mostrar.

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'TODAS LAS EDICIONES',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 4),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: magazines.length, // Cantidad de revistas.
            scrollDirection:
                Axis.horizontal, // Dirección de desplazamiento horizontal.
            itemBuilder: (context, index) {
              final magazine = magazines[index]; // Obtiene la revista actual.
              return Padding(
                padding: EdgeInsets.only(
                    right: 12), // Espaciado a la derecha entre elementos.
                child: AspectRatio(
                  aspectRatio:
                      1, // Relación de aspecto cuadrada (1:1) para la imagen.
                  child: Image.asset(
                    magazine.assetImage, // Ruta de la imagen de la revista.
                    fit: BoxFit
                        .cover, // Ajuste de la imagen para cubrir el espacio disponible.
                    alignment: Alignment
                        .topCenter, // Alineación de la imagen en la parte superior.
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
