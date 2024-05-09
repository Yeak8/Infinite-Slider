// Importa las bibliotecas necesarias para operaciones matemáticas y renderizado de UI
import 'dart:math';
import 'dart:ui';

// Importa la biblioteca de diseño Material de Flutter para construir componentes de UI
import 'package:flutter/material.dart';

// Define un widget personalizado StatefulWidget llamado StickySliverAppBar
class StickySliverAppBar extends StatefulWidget {
  // Constructor para StickySliverAppBar con parámetros opcionales y requeridos
  const StickySliverAppBar({
    // Parámetro opcional: sizePercent, el valor predeterminado es 0
    this.sizePercent = 0,
    // Parámetro requerido: indexNotifier, un ValueNotifier para notificar cambios en el índice
    required this.indexNotifier,
    // Hereda la clave del widget padre
    super.key,
  });

  // Declara una propiedad final para almacenar el porcentaje de tamaño
  final double sizePercent;

  // Declara una propiedad final para almacenar el ValueNotifier para cambios en el índice
  final ValueNotifier<int> indexNotifier;

  // Sobrescribe el método createState para devolver el objeto State correspondiente
  @override
  State<StickySliverAppBar> createState() => _StickySliverAppBarState();
}

class _StickySliverAppBarState extends State<StickySliverAppBar> {
  // El método build se llama cada vez que se necesita reconstruir el widget
  @override
  Widget build(BuildContext context) {
    // Devuelve un SliverAppBar personalizado con las siguientes propiedades:
    return SliverAppBar(
      // El alto de la barra de herramientas se calcula mediante la interpolación
      toolbarHeight: lerpDouble(152, 54, widget.sizePercent)!,
      // El ícono de retroceso se establece en un tamaño mínimo
      leading: const SizedBox.shrink(),
      // El color de fondo se establece en blanco
      backgroundColor: Colors.white,
      // El color del texto se establece en negro
      foregroundColor: Colors.black,
      // La elevación se calcula mediante la interpolación
      elevation: 10 * widget.sizePercent,
      // El color de la sombra se establece en blanco opaco
      shadowColor: Colors.white60,
      // La barra se mantiene fija en la parte superior de la vista
      pinned: true,
      // Acciones de la barra de herramientas
      actions: [
        // Expande el PageView para ocupar todo el ancho disponible
        Expanded(
          child: PageView.builder(
            // Deshabilita el desplazamiento del PageView
            physics: const NeverScrollableScrollPhysics(),
            // Construye cada página del PageView
            itemBuilder: (_, index) => Container(
              // Agrega un gradiente al fondo de cada página
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [
                    Colors.white,
                    Colors.white10,
                  ],
                ),
              ),
              child: Column(
                // Alinea el contenido a lo largo del eje cruzado
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // El número del problema se muestra en la parte superior de la página
                  Flexible(
                    child: FittedBox(
                      // Alinea el texto hacia la izquierda
                      alignment: Alignment(-1 * (1 - widget.sizePercent), 0),
                      child: Text(
                        'ISSUE N',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  // El número de página se muestra en la parte inferior de la página
                  Flexible(
                    flex: 10,
                    child: FittedBox(
                      // Alinea el texto hacia la izquierda
                      alignment: Alignment(-1 * (1 - widget.sizePercent), 0),
                      child: Stack(
                        children: [
                          // El número de página se muestra en la parte inferior de la página
                          Text(
                            '${index < 9 ? '0' : ''}${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // Agrega un divisor inclinado debajo del número de página
                          Positioned.fill(
                            child: Transform.rotate(
                              angle: -pi * .1,
                              child: const Divider(
                                color: Colors.black,
                                thickness: .3,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
