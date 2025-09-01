import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/widgets.dart';



class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final category = ['Categoria 1'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),        
      ),
      body: ListView.builder(
        itemCount: category.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(          
          child: TarjetacategoriaWidget(
            title: category[index],
            editable: true,
            idCategoriaController: TextEditingController(
              text: 'CAT-${index + 1}',
            ),
            nameController: TextEditingController(text: category[index]),
            stateController: TextEditingController(text: 'Activa'),
          ),
        ),
      ),
    );
  }
}