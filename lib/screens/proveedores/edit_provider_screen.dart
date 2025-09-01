import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/widgets.dart';



class EditProviderScreen extends StatelessWidget {
  const EditProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = ['proveedor 1'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedore'),
       
      ),
      body: ListView.builder(
        itemCount: provider.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(          
          child: TarjetaproveedorWidget(
            title: provider[index],
            editable: true,
            idProveedorController: TextEditingController(
              text: 'CAT-${index + 1}',
            ),
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