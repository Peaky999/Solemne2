import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marketsmart/services/services.dart';
import 'package:provider/provider.dart';
import 'package:marketsmart/widgets/widgets.dart';



class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final proveedorServices = Provider.of<ProveedorServices>(context);
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
        itemCount: proveedorServices.provider.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_product');
          },
          child: TarjetaProveedor(
            providerId: proveedorServices.provider[index].providerId ,
            name: proveedorServices.provider[index].providerName,
            lastName: proveedorServices.provider[index].providerLastName,
            mail: proveedorServices.provider[index].providerMail ,
            state: proveedorServices.provider[index].providerState 
          ),
        ),
      ),
    );
  }
}