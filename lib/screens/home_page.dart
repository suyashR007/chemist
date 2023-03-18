import 'package:chemist/screens/add_product.dart';
import 'package:chemist/utils/helpers.dart';
import 'package:chemist/utils/text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemist Track'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToPage(context, const AddProductPage());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'No Chemist Added',
              style: mainStyle,
            ),
          ),
          ElevatedButton(
            child: const Text('Fetch Details'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
