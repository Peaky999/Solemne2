import 'package:flutter/material.dart';
import 'package:marketsmart/services/services.dart';
import 'package:marketsmart/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoriaServices = Provider.of<CategoriaServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
        actions: [
          IconButton(
            onPressed: () {
              // Acción para agregar nueva categoría
              Navigator.pushNamed(context, 'create_category');
            },
            icon: const Icon(Icons.add),
            tooltip: 'Agregar categoría',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categoriaServices.category.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_category');
          },
          child: TarjetacategoriaWidget(
            title: categoriaServices.category[index].categorytName,
            editable: false,
            idCategoriaController: TextEditingController(
              text: categoriaServices.category[index].categorytId.toString(),
            ),
            nameController: TextEditingController(
              text: categoriaServices.category[index].categorytName,
            ),
            stateController: TextEditingController(
              text: categoriaServices.category[index].categorytState,
            ),
          ),
        ),
      ),
    );
  }
}
