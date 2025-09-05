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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              'home',
              (route) => false,
            );
          },
        ),
        title: const Text('Categorías'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'create_category');
            },
            icon: const Icon(Icons.add),
            tooltip: 'Agregar categoría',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categoriaServices.categories.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoriaServices.selectedCategory = categoriaServices.categories[index]
                .copy();
            Navigator.pushNamed(context, 'edit_category');
          },
          child: TarjetacategoriaWidget(
            title: categoriaServices.categories[index].categorytName,
            editable: false,
            idCategoriaController: TextEditingController(
              text: categoriaServices.categories[index].categorytId.toString(),
            ),
            nameController: TextEditingController(
              text: categoriaServices.categories[index].categorytName,
            ),
            stateController: TextEditingController(
              text: categoriaServices.categories[index].categorytState,
            ),
          ),
        ),
      ),
    );
  }
}
