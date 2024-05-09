class Magazine {
  const Magazine({
    required this.id,
    required this.assetImage,
    required this.description,
  });

  final String id; // Identificador único de la revista.
  final String assetImage; // Ruta de la imagen de la revista.
  final String description; // Descripción detallada de la revista.

  static final List<Magazine> fakeMagazinesValues = List.generate(
    13, // Cantidad de revistas falsas a generar.
    (index) => Magazine(
      id: '$index', // ID único generado para cada revista falsa.
      assetImage:
          'assets/img/vice/vice${index + 1}.png', // Ruta de la imagen simulada.
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting '
          "industry. Lorem Ipsum has been the industry's standard dummy "
          'text ever since the 1500s, when an unknown printer took a galley '
          'of type and scrambled it to make a type specimen book. It has '
          'survived not only five centuries, but also the leap into '
          'electronic typesetting, remaining essentially unchanged. It was '
          'popularised in the 1960s with the release of word set sheets '
          'containing Lorem Ipsum passages, and more recently with desktop '
          'publishing software like Aldus PageMaker including versions of '
          'Lorem Ipsum', // Texto de descripción simulada para cada revista.
    ),
  );
}
