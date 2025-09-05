import 'package:flutter/material.dart';
import 'package:marketsmart/services/proveedor_services.dart';
import 'package:marketsmart/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:marketsmart/models/proveedor.dart';

class CreateProviderScreen extends StatelessWidget {
  const CreateProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerServices = Provider.of<ProveedorServices>(context, listen: false);
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final mailController = TextEditingController();
    final stateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Proveedor'),        
      ),
      body: TarjetaproveedorcreateWidget(
        title: 'Nuevo Proveedor',
        nameController: nameController,
        lastNameController: lastNameController,
        mailController: mailController,
        stateController: stateController,
        editable: true,
        onSave: (nombre, lastName, mail, estado) async {
          await providerServices.createProvider(
            Listado(
              providerId: 0,
              providerName: nombre,
              providerLastName: lastName,
              providerMail: mail,
              providerState: estado,
            ), context
          );
        }, onDelete: () async { 
          return; 
        },
      ),
    );    
  }
}