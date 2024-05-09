// ignore: unused_import
import 'dart:math'; // Importa la biblioteca 'dart:math' para usar funciones matemáticas.

import 'package:flutter/material.dart'; // Importa el paquete de Flutter.

import '../../../../core/core.dart'; // Importa paquetes internos de la aplicación.
import '../../../magazines_details/presentation/screens/magazines_details_screen.dart'; // Importa la pantalla de detalles de revistas.
import '../widgets/all_editions_list_view.dart'; // Importa un widget específico.
import '../widgets/infinite_dragable_slider.dart'; // Importa un widget específico.

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key, // Clave de inicialización del widget.
    this.enableEntryAnimation =
        false, // Habilita la animación de entrada (predeterminado: deshabilitada).
    this.initialIndex = 0, // Índice inicial para mostrar (predeterminado: 0).
  });

  final bool
      enableEntryAnimation; // Indica si la animación de entrada está habilitada.
  final int initialIndex; // Índice inicial para mostrar.

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<Magazine> magazines =
      Magazine.fakeMagazinesValues; // Lista de revistas falsas.
  late int currentIndex; // Índice de la revista actual.

  @override
  void initState() {
    currentIndex = widget
        .initialIndex; // Inicializa el índice actual con el valor inicial del widget.
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openMagazineDetail(
      BuildContext context, int index, List<Magazine> magazines) {
    setState(() {
      currentIndex =
          index; // Establece el índice actual al índice seleccionado.
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MagazinesDetailsScreen(
          index: index,
          magazines: magazines,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ViceUIConsts
          .gradientDecoration, // Decoración de gradiente para el fondo.
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // Evita que el contenido se ajuste automáticamente cuando aparece el teclado.
        appBar: _AppBar(), // Barra de aplicación personalizada.
        body: Column(
          children: [
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(ViceIcons
                      .search), // Icono de búsqueda en el campo de texto.
                ),
              ),
            ),
            SizedBox(height: 20),
            const Text(
              'ALBUMS VIP', // Título de sección.
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: InfiniteDragableSlider(
                iteamCount: Magazine.fakeMagazinesValues
                    .length, // Número de elementos en el slider.
                itemBuilder: (context, index) => MagazineCoverImage(
                    magazine: Magazine.fakeMagazinesValues[
                        index]), // Constructor de elementos del slider.
              ),
            ),
            SizedBox(height: 72),
            SizedBox(
              height: 140,
              child: AllEditionsListView(
                  magazines: magazines), // Lista de todas las ediciones.
            ),
            SizedBox(height: 12),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height:
                kToolbarHeight, // Altura de la barra de navegación inferior.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {}, // Función al presionar el botón de inicio.
                  icon: const Icon(ViceIcons.home), // Icono de inicio.
                ),
                IconButton(
                  onPressed:
                      () {}, // Función al presionar el botón de configuración.
                  icon:
                      const Icon(ViceIcons.settings), // Icono de configuración.
                ),
                IconButton(
                  onPressed:
                      () {}, // Función al presionar el botón de compartir.
                  icon: const Icon(ViceIcons.share), // Icono de compartir.
                ),
                IconButton(
                  onPressed:
                      () {}, // Función al presionar el botón de favoritos.
                  icon: const Icon(ViceIcons.heart), // Icono de favoritos.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip
          .none, // Establece el comportamiento de recorte de la barra de aplicación.
      title: Image.asset(
        'assets/img/vice/vice-logo.png', // Ruta de la imagen del logo.
        height: 30, // Altura de la imagen.
        color: Colors.white, // Color de la imagen.
      ),
      actions: [
        const MenuButton(), // Botón de menú en la barra de aplicación.
      ],
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); // Tamaño preferido de la barra de aplicación.
}
