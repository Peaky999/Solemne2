import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/widgets.dart';

class CreateProviderScreen extends StatelessWidget {
  const CreateProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = ['Proveedor 1'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Proveedor'),        
      ),
      body: ListView.builder(
        itemCount: provider.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(          
          child: TarjetaproveedorcreateWidget(
            title: provider[index],
            editable: true,
            nameController: TextEditingController(text: provider[index]),
            lastNameController: TextEditingController(text: "LastName"),
            mailController: TextEditingController(text: "mail"),
            stateController: TextEditingController(text: 'Activa'),
          ), //informacion de producto
        ),
      ),
    );    
  }
}