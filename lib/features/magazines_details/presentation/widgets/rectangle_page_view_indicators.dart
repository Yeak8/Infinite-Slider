import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/core.dart'; // Importa la biblioteca core

// Define un widget personalizado StatelessWidget llamado RectanglePageViewIndicators
class RectanglePageViewIndicators extends StatelessWidget {
  // Constructor para RectanglePageViewIndicators con parámetros opcionales y requeridos
  const RectanglePageViewIndicators({
    // Parámetro opcional: percent, el valor predeterminado es 0
    required this.percent,
    // Parámetro requerido: indexNotifier, un ValueNotifier para notificar cambios en el índice
    required this.indexNotifier,
    // Parámetro requerido: length, la longitud de los indicadores
    required this.length,
    super.key,
  });

  // Declara una propiedad final para almacenar el porcentaje de posición
  final double percent;

  // Declara una propiedad final para almacenar el ValueNotifier para cambios en el índice
  final ValueNotifier<int> indexNotifier;

  // Declara una propiedad final para almacenar la longitud de los indicadores
  final int length;

  // Sobrescribe el método build para devolver el objeto Widget correspondiente
  @override
  Widget build(BuildContext context) {
    // Positioned.fill rellena el espacio disponible en el eje principal y cruzado
    return Positioned.fill(
      // Establece el valor superior en null
      top: null,
      // Calcula la posición inferior mediante la interpolación
      bottom: lerpDouble(.05 * MediaQuery.of(context).size.height,
          -ViceUIConsts.headerHeight(context), percent),
      // Agrega un ValueListenableBuilder para actualizar los indicadores cuando cambia el índice
      child: ValueListenableBuilder<int>(
        // Configura el ValueNotifier para el índice
        valueListenable: indexNotifier,
        // Construye los indicadores según el índice actual
        builder: (__, value, _) => Row(
          // Alinea los indicadores en el centro
          mainAxisAlignment: MainAxisAlignment.center,
          // Alinea los indicadores en la parte inferior
          crossAxisAlignment: CrossAxisAlignment.end,
          // Genera los indicadores según la longitud
          children: List.generate(
            length,
            (index) {
              // Determina si el indicador está seleccionado
              final isSelected = index == value;
              // Devuelve un AnimatedContainer para el indicador
              return AnimatedContainer(
                // Establece la duración de la animación
                duration: kThemeAnimationDuration,
                // Agrega un margen derecho a todos los indicadores excepto al último
                margin:
                    index != (length - 1) ? EdgeInsets.only(right: 4) : null,
                // Establece el alto y ancho del indicador según si está seleccionado o no
                height: isSelected ? 6 : 4,
                width: isSelected ? 12 : 8,
                // Establece el color del indicador según si está seleccionado o no
                color: isSelected ? Colors.white : Colors.white38,
              );
            },
          ),
        ),
      ),
    );
  }
}
