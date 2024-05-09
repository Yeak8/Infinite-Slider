import 'package:flutter/material.dart';

import '../../../../core/core.dart'; // Importa paquetes internos de la aplicación.
import '../widgets/content_magazines_page_view.dart'; // Importa un widget específico.
import '../widgets/heart_and_save_button.dart'; // Importa un widget específico.
import '../widgets/sticky_sliver_app_bar.dart'; // Importa un widget específico.

class MagazinesDetailsScreen extends StatefulWidget {
  const MagazinesDetailsScreen({
    required this.index, // Índice de la revista actual.
    required this.magazines, // Lista de revistas.
    super.key, // Clave de inicialización del widget.
  });

  final int index; // Índice de la revista actual.
  final List<Magazine> magazines; // Lista de revistas.

  // Método estático para navegar a esta pantalla.
  static void push(
    BuildContext context, {
    required int index,
    required List<Magazine> magazines,
  }) =>
      Navigator.push<int>(
        context,
        PageRouteBuilder(
          pageBuilder: (_, animation, __) => FadeTransition(
            opacity: animation,
            child: MagazinesDetailsScreen(
              index: index,
              magazines: magazines,
            ),
          ),
        ),
      );

  @override
  State<MagazinesDetailsScreen> createState() => _MagazinesDetailsScreenState();
}

class _MagazinesDetailsScreenState extends State<MagazinesDetailsScreen> {
  late final ScrollController
      scrollController; // Controlador de desplazamiento para la lista.
  late ValueNotifier<int> indexNotifier; // Notificador de cambios en el índice.
  double headerPercent = 0; // Porcentaje para el encabezado.

  @override
  void initState() {
    scrollController =
        ScrollController(); // Inicializa el controlador de desplazamiento.
    indexNotifier = ValueNotifier(
        widget.index); // Inicializa el notificador con el índice inicial.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color de fondo de la pantalla.
      body: Stack(
        children: [
          CustomScrollView(
            physics:
                const BouncingScrollPhysics(), // Físicas de desplazamiento con rebote.
            controller:
                scrollController, // Asigna el controlador de desplazamiento.
            slivers: [
              // TODO: Cube 3D PageView
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.65, // Altura del contenedor.
                  child: Center(
                    child: Text(
                      "TODO: Cube 3D PageView", // Texto temporal.
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge, // Estilo del texto desde el tema actual.
                    ),
                  ),
                ),
              ),
              StickySliverAppBar(
                  indexNotifier: indexNotifier), // Encabezado pegajoso.
              SliverToBoxAdapter(
                child: ContentMagazinesPageView(
                  indexNotifier:
                      indexNotifier, // Notificador de cambio de índice.
                  magazines: widget.magazines, // Lista de revistas.
                ),
              ),
            ],
          ),
          HeartAndSaveButtons(), // Botones de corazón y guardar.
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Color.lerp(
                    Colors.white60, // Color inicial.
                    Colors.black, // Color final.
                    headerPercent, // Porcentaje para interpolar entre los colores.
                  ),
                  onPressed:
                      () {}, // Función al presionar el botón (vacía en este caso).
                  icon: const Icon(ViceIcons.close), // Icono para cerrar.
                ),
                MenuButton(
                  color: Color.lerp(
                    Colors.white60, // Color inicial.
                    Colors.black, // Color final.
                    headerPercent, // Porcentaje para interpolar entre los colores.
                  )!, // Forzamos a que el color no sea nulo.
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
