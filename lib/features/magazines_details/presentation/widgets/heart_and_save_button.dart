import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Un widget sin estado que extiende de `StatelessWidget`.
///
/// Este widget representa dos botones: un botón de corazón y un botón de guardar.
/// Los botones se posicionan en la parte inferior derecha de la pantalla y
/// su posición vertical se calcula en función del parámetro `movePercent`.
class HeartAndSaveButtons extends StatelessWidget {
  /// Crea una instancia del widget HeartAndSaveButtons.
  ///
  /// El parámetro `movePercent` determina la posición vertical de los botones.
  /// Un valor de 0 significa que los botones están en la parte inferior de la pantalla,
  /// mientras que un valor de 1 significa que los botones están en la parte superior de la pantalla.
  const HeartAndSaveButtons({
    this.movePercent = 0,
    super.key,
  });

  /// El porcentaje por el cual se deben mover los botones verticalmente.
  final double movePercent;

  @override
  Widget build(BuildContext context) {
    // Calcula la altura y el ancho de cada botón.
    final double height = 48;
    final double width = 48;

    // Calcula la posición inferior de los botones cuando están en la parte inferior de la pantalla.
    final double bottom =
        MediaQuery.of(context).size.height - ViceUIConsts.headerHeight(context);

    // Posiciona los botones en la parte inferior derecha de la pantalla,
    // con su posición vertical determinada por el parámetro `movePercent`.
    return Positioned(
      bottom: ui.lerpDouble(bottom - height, height, movePercent),
      right: 24,
      child: Column(
        children: [
          // El botón de corazón.
          SizedBox(
            height: height,
            width: width,
            child: ColoredBox(
              color: Colors.black, // El color de fondo del botón.
              child: FittedBox(
                child: IconButton(
                  // El botón se activa cuando se presiona.
                  onPressed: () {},
                  icon: const Icon(ViceIcons.heart,
                      color: Colors.white), // El icono mostrado en el botón.
                ),
              ),
            ),
          ),
          // El botón de guardar.
          SizedBox(
            height: height,
            width: width,
            child: ColoredBox(
              color: Colors.green.shade500, // El color de fondo del botón.
              child: FittedBox(
                child: IconButton(
                  // El botón se activa cuando se presiona.
                  onPressed: () {},
                  icon: const Icon(ViceIcons.save,
                      color: Colors.white), // El icono mostrado en el botón.
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
