import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/widgets.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final category = ['Categoria 1'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Categoria'),        
      ),
      body: ListView.builder(
        itemCount: category.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(          
          child: TarjetacategoriacreateWidget(
            title: category[index],
            editable: true,            
            nameController: TextEditingController(text: category[index]),
            stateController: TextEditingController(text: 'Activa'),
          ),
        ),
      ),
    );
  }
}