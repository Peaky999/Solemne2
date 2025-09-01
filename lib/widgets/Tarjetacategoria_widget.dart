import 'package:flutter/material.dart';

class TarjetacategoriaWidget extends StatelessWidget {
  final String title;
  final TextEditingController idCategoriaController;
  final TextEditingController nameController;
  final TextEditingController stateController;
  final bool editable;

  const TarjetacategoriaWidget({
    super.key,
    required this.title,
    required this.idCategoriaController,
    required this.nameController,
    required this.stateController,
    this.editable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildInputRow('ID Categoría', idCategoriaController),
            _buildInputRow('Nombre', nameController),
            _buildInputRow('Estado', stateController),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (editable) ...[
                  ElevatedButton.icon(
                    onPressed: () {
                      debugPrint(
                        'Guardar categoría: ${nameController.text}, Estado: ${stateController.text}',
                      );
                    },
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: const Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(150, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      debugPrint(
                        'Eliminar categoría: ${idCategoriaController.text}',
                      );
                    },
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(150, 0, 0, 1),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: !editable,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
