import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Un widget con estado que muestra una vista de página con una lista de revistas.
///
/// El widget utiliza un `PageView.builder` para mostrar cada revista en una página separada.
/// Cada página contiene un título, una descripción y una imagen de la revista.
class ContentMagazinesPageView extends StatefulWidget {
  /// Crea una instancia del widget ContentMagazinesPageView.
  ///
  /// El parámetro `indexNotifier` se utiliza para actualizar la página actual.
  /// El parámetro `magazines` es una lista de revistas que se mostrarán en la vista de página.
  const ContentMagazinesPageView({
    required this.indexNotifier,
    required this.magazines,
    super.key,
  });

  /// Un `ValueNotifier` que se utiliza para actualizar la página actual.
  final ValueNotifier<int> indexNotifier;

  /// Una lista de revistas que se mostrarán en la vista de página.
  final List<Magazine> magazines;

  @override
  State<ContentMagazinesPageView> createState() =>
      _ContentMagazinesPageViewState();
}

class _ContentMagazinesPageViewState extends State<ContentMagazinesPageView> {
  // Un controlador para la vista de página.
  late final PageController controller;

  // El tamaño del widget.
  Size? sizeWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Establece la altura del widget a la altura de la pantalla o al tamaño del widget si ya se conoce.
      height: sizeWidget?.height ?? MediaQuery.of(context).size.height,
      child: PageView.builder(
        // Desactiva el desplazamiento de la vista de página.
        physics: const NeverScrollableScrollPhysics(),

        // El número de páginas en la vista de página es igual al número de revistas.
        itemCount: widget.magazines.length,

        // Construye cada página en la vista de página.
        itemBuilder: (_, index) {
          final magazine = widget.magazines[index];

          // Una página que contiene un título, una descripción y una imagen de la revista.
          return SingleChildScrollView(
            // Desactiva el desplazamiento de la vista de página.
            physics: const NeverScrollableScrollPhysics(),

            // El relleno horizontal de la página.
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizeNotifierWidget(
              // Llama a este método cuando cambia el tamaño del widget.
              onSizeChange: (value) => setState(() => sizeWidget = value),
              child: Column(
                // Alinea los elementos en el eje horizontal.
                crossAxisAlignment: CrossAxisAlignment.stretch,

                // El tamaño mínimo del widget en el eje vertical.
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Un espacio en blanco de 20 píxeles.
                  SizedBox(height: 20),

                  // Cinco repeticiones de un título, una descripción y una imagen de la revista.
                  for (int x = 0; x < 5; x++) ...[
                    Text(
                      // El título de la revista.
                      'TITLE TEST ${magazine.id}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(letterSpacing: 2),
                    ),
                    SizedBox(height: 12),

                    // La descripción de la revista.
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        magazine.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(letterSpacing: 1),
                      ),
                    ),
                    SizedBox(height: 12),

                    // La descripción de la revista.
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        magazine.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(letterSpacing: 1),
                      ),
                    ),
                    SizedBox(height: 12),

                    // La imagen de la revista.
                    Image.asset(
                      // La ruta de la imagen de la revista.
                      magazine.assetImage,
                      height: 220,
                      // Ajusta la imagen para que ocupe todo el espacio disponible.
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 28),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Un widget con estado que notifica el tamaño de su hijo.
///
/// Cuando el tamaño del widget cambia, se llama al método `onSizeChange` con el nuevo tamaño.
class SizeNotifierWidget extends StatefulWidget {
  /// Crea una instancia del widget SizeNotifierWidget.
  ///
  /// El parámetro `child` es el widget cuyo tamaño se notificará.
  /// El parámetro `onSizeChange` es el método que se llamará cuando cambie el tamaño del widget.
  const SizeNotifierWidget({
    required this.child,
    required this.onSizeChange,
    super.key,
  });

  /// El widget cuyo tamaño se notificará.
  final Widget child;

  /// El método que se llamará cuando cambie el tamaño del widget.
  final ValueChanged<Size> onSizeChange;

  @override
  State<SizeNotifierWidget> createState() => _SizeNotifierWidgetState();
}

class _SizeNotifierWidgetState extends State<SizeNotifierWidget> {
  // Una clave única para el widget.
  final _widgetKey = GlobalKey();

  // El tamaño anterior del widget.
  Size? _oldSize;

  @override
  void initState() {
    // Llama al método `_notifySize` después de que se haya construido el widget.
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Un widget que notifica los cambios de tamaño.
    return NotificationListener<SizeChangedLayoutNotification>(
      // Llama al método `_notifySize` cuando cambia el tamaño del widget.
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
        return true;
      },
      child: SizeChangedLayoutNotifier(
        // El widget cuyo tamaño se notificará.
        child: SizedBox(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }

  // Llama al método `onSizeChange` con el nuevo tamaño del widget.
  void _notifySize() {
    final context = _widgetKey.currentContext;
    if (context == null) return;
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size!);
    }
  }
}
