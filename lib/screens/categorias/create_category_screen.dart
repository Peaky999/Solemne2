import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marketsmart/services/services.dart';
import 'package:marketsmart/widgets/categories/TarjetacategoriaCreate_widget.dart';
import '../../models/categorias.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoriaServices = Provider.of<CategoriaServices>(context, listen: false);
    final nameController = TextEditingController();
    final stateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Categoria'),        
      ),
      body: TarjetacategoriacreateWidget(
        title: 'Nueva Categoría',
        nameController: nameController,
        stateController: stateController,
        editable: true,
        onSave: (nombre, estado) async {
          await categoriaServices.createCategory(
            Listado(
              categorytId: 0,
              categorytName: nombre,
              categorytState: estado,
            ), context
          );
        }, onDelete: () async { 
          return; 
        },
      ),
    );
  }
}