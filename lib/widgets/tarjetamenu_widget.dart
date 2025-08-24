import 'package:flutter/material.dart';

class TarjetamenuWidget extends StatelessWidget {
  final String rutaRedireccion;
  final String imagenUrl;
  final String titulo;
  //final String categoria;

  const TarjetamenuWidget({
    super.key,
    required this.rutaRedireccion,
    required this.imagenUrl,
    required this.titulo,
    //required this.categoria,
  });

    @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, rutaRedireccion);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imagenUrl),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Título
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                titulo,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}