import 'package:chemist/utils/colors.dart';
import 'package:flutter/material.dart';

class ChemistDetailsPage extends StatefulWidget {
  const ChemistDetailsPage({super.key});

  @override
  State<ChemistDetailsPage> createState() => _ChemistDetailsPageState();
}

class _ChemistDetailsPageState extends State<ChemistDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemist Details'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Table(
          border: TableBorder.all(color: kPrimary),
          children: const [
            TableRow(
              decoration: BoxDecoration(
                color: kPrimary,
              ),
              children: [
                TableCell(
                  child: Text('Sr. No',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ),
                TableCell(
                    child: Text('Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ))),
                TableCell(
                    child: Text('Order No.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ))),
                TableCell(
                    child: Text('Chemist Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ))),
                TableCell(
                    child: Text('Product Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ))),
                TableCell(
                    child: Text('Status',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
