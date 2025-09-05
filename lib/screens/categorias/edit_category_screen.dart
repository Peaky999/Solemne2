import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marketsmart/services/services.dart';
import 'package:marketsmart/widgets/categories/TarjetacategoriaCreate_widget.dart';
import '../../models/categorias.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaServices = Provider.of<CategoriaServices>(
      context,
      listen: false,
    );
    final selectedCategory = categoriaServices.selectedCategory;

    // Si no hay categoría seleccionada, muestra un mensaje
    if (selectedCategory == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Editar Categoría')),
        body: const Center(child: Text('No hay categoría seleccionada')),
      );
    }

    final nameController = TextEditingController(
      text: selectedCategory.categorytName,
    );
    final stateController = TextEditingController(
      text: selectedCategory.categorytState,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Categoría'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              'home',
              (route) => false,
            );
          },
        ),
      ),
      body: TarjetacategoriacreateWidget(
        title: 'Editar Categoría',
        nameController: nameController,
        stateController: stateController,
        editable: true,
        onDelete: () async {
          categoriaServices.deleteCategory(selectedCategory, context);
        },
        onSave: (nombre, estado) async {
          await categoriaServices.editCategory(
            Listado(
              categorytId: selectedCategory.categorytId,
              categorytName: nombre,
              categorytState: estado,
            ),
            context,
          );
        },
      ),
    );
  }
}
