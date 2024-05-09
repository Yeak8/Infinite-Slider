import 'package:flutter/material.dart';

import '../../features/home/presentation/screens/home_screen.dart'; // Importa la pantalla principal de la aplicación.
import '../core.dart'; // Importa los elementos internos de la aplicación.

class ViceApp extends StatelessWidget {
  const ViceApp({super.key}); // Constructor de la aplicación.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Deshabilita la marca de modo de depuración en la esquina de la pantalla.
      title: 'Albums VIP', // Título de la aplicación.
      theme: ViceTheme.theme, // Configuración del tema de la aplicación.
      home: HomeScreen(), // Pantalla de inicio de la aplicación.
    );
  }
}
