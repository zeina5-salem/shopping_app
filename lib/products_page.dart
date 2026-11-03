import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    print("start Products");
  }

  @override
  void dispose() {
    print("finish Products");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Products Page"),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}