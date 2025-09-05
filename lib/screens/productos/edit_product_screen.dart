import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/products/form_product.dart';
import 'package:marketsmart/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../services/services.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductoServices>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct!),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  final ProductoServices productService;
  const _ProductScreenBody({super.key, required this.productService});
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 32),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ImageProduct(),
              ],
            ),
            SizedBox(height: 10),
            FormProduct(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.delete_forever),
            onPressed: () async {
              if (!productForm.isValidForm()) return;
              await productService.deleteProduct(productForm.product, context);
            },
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () async {
              if (!productForm.isValidForm()) return;
              await productService.editOrCreateProducts(productForm.product, context);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
