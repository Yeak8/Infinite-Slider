import 'package:flutter/material.dart';

import '../core.dart'; // Importa los elementos internos de la aplicación.

class ViceTheme {
  const ViceTheme._(); // Constructor privado para evitar instancias.

  static ThemeData get theme => ThemeData(
        // Obtiene el tema de la aplicación.
        primarySwatch: Colors.purple, // Color principal del tema.
        primaryColor: ViceColors.purple, // Color primario personalizado.
        scaffoldBackgroundColor:
            Colors.transparent, // Color de fondo del scaffold transparente.
        appBarTheme: const AppBarTheme(
          // Tema personalizado para la barra de aplicación.
          backgroundColor: Colors.transparent, // Fondo transparente.
          elevation: 0, // Sin elevación.
          centerTitle: true, // Título centrado.
        ),
        inputDecorationTheme: InputDecorationTheme(
          // Tema para los campos de entrada.
          filled: true, // Relleno activado.
          fillColor: Colors.white54, // Color de relleno para el campo.
          contentPadding: EdgeInsets.all(10), // Relleno interior del campo.
          border: OutlineInputBorder(
            // Estilo del borde del campo.
            borderRadius: BorderRadius.all(
                Radius.circular(10)), // Radio de borde redondeado.
            borderSide: BorderSide.none, // Borde sin línea.
          ),
        ),
      );
}
