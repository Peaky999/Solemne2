import 'package:flutter/material.dart';

class TarjetaProducto extends StatelessWidget {
  final String imagenUrl;
  final String nombre;
  final String sku;
  final double precio;

  const TarjetaProducto({
    super.key,
    required this.imagenUrl,
    required this.nombre,
    required this.sku,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    const Color colorCard = Color.fromRGBO(150, 0, 0, 1);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagen del producto
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  imagenUrl,
                  fit: BoxFit.cover,
                ),
              ),

              // Franja inferior con nombre y SKU
              Container(
                color: colorCard,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'SKU: $sku',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Etiqueta de precio en la esquina superior derecha
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: colorCard,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '\$${precio.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}