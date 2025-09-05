import 'package:flutter/material.dart';
import 'package:marketsmart/services/services.dart';
import 'package:marketsmart/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerServices = Provider.of<ProveedorServices>(context);
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
        title: const Text('Proveedores'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'create_provider');
            },
            icon: const Icon(Icons.add),
            tooltip: 'Agregar proveedor',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: providerServices.providers.length,
        itemBuilder: (BuildContext context, index) {
          final proveedor = providerServices.providers[index];
          return GestureDetector(
            onTap: () {
            providerServices.selectedProvider = providerServices.providers[index]
                .copy();
            Navigator.pushNamed(context, 'edit_provider');
          },
            child: TarjetaProveedor(
              editable: false,
              providerId: providerServices.providers[index].providerId,
              name: providerServices.providers[index].providerName,
              lastName: providerServices.providers[index].providerLastName,
              mail: providerServices.providers[index].providerMail,
              state: providerServices.providers[index].providerState,
            ),
          );
        },
      ),
    );
  }
}
