import 'package:chemist/providers/homepage_provider/homepage_provider.dart';
import 'package:chemist/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<HomePageProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Chemist Track'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: TextFormField(
                    decoration: InputDecoration(
                      label: const Text('Search Chemist'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.2,
                      width: screenSize.width * 0.8,
                      child: ListView(
                        children: const [
                          Text('SUyash Rane'),
                          Text('Suaysh Har'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
            //goToPage(context, const AddProductPage());
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'No Chemist Added',
                style: mainStyle,
              ),
            ),
            ElevatedButton(
              child: const Text('Fetch Details'),
              onPressed: () => value.fetchChemistDetail(),
            )
          ],
        ),
      ),
    );
  }
}
