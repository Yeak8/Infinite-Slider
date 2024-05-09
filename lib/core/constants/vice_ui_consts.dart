import 'package:flutter/material.dart';

import '../core.dart'; // Importa los elementos internos de la aplicación.

class ViceUIConsts {
  ViceUIConsts._(); // Constructor privado para evitar instancias.

  static const BoxDecoration gradientDecoration = BoxDecoration(
    // Decoración de gradiente para el fondo.
    gradient: LinearGradient(
      // Gradiente lineal para el fondo.
      begin: Alignment
          .topCenter, // Posición inicial del gradiente (arriba en el centro).
      end: Alignment
          .bottomCenter, // Posición final del gradiente (abajo en el centro).
      stops: [0.3, 1], // Puntos de parada para el gradiente.
      colors: ViceColors
          .scaffoldColors, // Colores del gradiente definidos en ViceColors.
    ),
  );

  // Método estático para obtener la altura del encabezado en base al porcentaje de la pantalla.
  static double headerHeight(BuildContext context) {
    return MediaQuery.of(context).size.height *
        0.65; // Calcula y devuelve el 65% de la altura de la pantalla.
  }
}
