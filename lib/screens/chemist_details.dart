import 'package:chemist/models/table_models/table_model.dart';
import 'package:chemist/providers/tablepage_provider/tablepage_provider.dart';
import 'package:chemist/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChemistDetailsPage extends StatefulWidget {
  const ChemistDetailsPage({super.key});

  @override
  State<ChemistDetailsPage> createState() => _ChemistDetailsPageState();
}

class _ChemistDetailsPageState extends State<ChemistDetailsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemist Details'),
      ),
      body: Consumer<TablePageProvider>(
        builder: (context, val, child) => Container(
          margin: const EdgeInsets.all(8),
          child: Table(
            border: TableBorder.all(color: kPrimary),
            children: [
              const TableRow(
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
              for (TableModel mod in val.models)
                TableRow(children: [
                  TableCell(
                    child: Text(val.models.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                  TableCell(
                      child: Text(mod.dateTime!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ))),
                  TableCell(
                      child: Text(mod.orderNo!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ))),
                  TableCell(
                      child: Text(mod.chemistName!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ))),
                  TableCell(
                      child: Text(mod.productDetails!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ))),
                  TableCell(
                      child: Text(mod.status!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ))),
                ]),
            ],
          ),
        ),
      ),
    );
  }
}
