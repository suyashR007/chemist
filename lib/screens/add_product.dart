import 'package:chemist/utils/colors.dart';
import 'package:chemist/utils/text_style.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  int quantityCount = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chemist',
              style: mainTextStyleB500,
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(12),
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'suyash',
                    child: Text('Suyash'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: screenSize.height * 0.06),
            const Text(
              'Products',
              style: mainTextStyleB500,
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(12),
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'suyash',
                    child: Text('Suyash'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: screenSize.height * 0.04),
            const Center(
              child: Text(
                'Quantity',
                style: mainTextStyleB500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.add),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                    child: Text(
                      quantityCount.toString(),
                      style: mainTextStyleB500,
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.04),
            const Text(
              'Add Image',
              style: mainTextStyleB500,
            ),
            SizedBox(height: screenSize.height * 0.01),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: screenSize.height * 0.04,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'View Image',
                    style: mainTextStyleB500.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.08),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 28)),
                onPressed: () {},
                child: const Text(
                  'Save Details',
                  style: mainTextStyleB500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
