import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/widgets.dart';



class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = [
      'Proveedor 1',
      
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Proveedores'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: provider.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_provider');
          },
          child: TarjetaproveedorWidget(
            title: provider[index],
            editable: false,
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