import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marketsmart/services/services.dart';
import 'package:marketsmart/widgets/providers/TarjetaproveedorCreate_widget.dart';
import '../../models/proveedor.dart';
import 'package:marketsmart/widgets/widgets.dart';

class EditProviderScreen extends StatelessWidget {
  const EditProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerServices = Provider.of<ProveedorServices>(
      context,
      listen: false,
    );
    final selectedProvider = providerServices.selectedProvider;   
    if (selectedProvider == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Editar Proveedor')),
        body: const Center(child: Text('No hay Proveedor seleccionado')),
      );
    }

    final nameController = TextEditingController(
      text: selectedProvider.providerName,
    );
    final lastNameController = TextEditingController(
      text: selectedProvider.providerLastName,
    );
    final mailController = TextEditingController(
      text: selectedProvider.providerMail,
    );
    final stateController = TextEditingController(
      text: selectedProvider.providerState,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Proveedor'),
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
      body: TarjetaproveedorcreateWidget(
        title: 'Editar Proveedor',
        nameController: nameController,
        lastNameController: lastNameController,
        mailController: mailController,
        stateController: stateController,
        editable: true,
        onDelete: () async {
          providerServices.deleteProvider(selectedProvider, context);
        },
        onSave: (nombre, lastName, mail, estado) async {
          await providerServices.editProvider(
            Listado(
              providerId: selectedProvider.providerId,
              providerName: nombre,
              providerLastName: lastName,
              providerMail: mail,
              providerState: estado,
            ), context
          );
        },
      ),
    );
  }
}
