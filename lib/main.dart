// Importa el paquete de Material Design, el cual proporciona un conjunto de widgets de UI preconstruidos
import 'package:flutter/material.dart';

// Importa el paquete de Servicios, el cual proporciona servicios de bajo nivel del sistema
import 'package:flutter/services.dart';

// Importa el módulo ViceApp desde la carpeta core/app
import 'core/app/vice_app.dart';

// La función main es el punto de entrada de la app de Flutter
void main() {
  // Establece el estilo de la superposición de la interfaz de usuario del sistema para hacer la barra de estado transparente
  SystemChrome.setSystemUIOverlayStyle(
    // Crea un objeto SystemUiOverlayStyle con una barra de estado de color transparente
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  // Ejecuta el widget ViceApp como raíz de la app
  runApp(const ViceApp());
}
