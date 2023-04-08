import 'package:chemist/providers/tablepage_provider/tablepage_provider.dart';
import 'package:chemist/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<TablePageProvider>(
        builder: (context, val, child) => Container(
            margin: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              child: DataTable(
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => kPrimary),
                columns: const [
                  DataColumn(
                    label: Text('Sr. No',
                        style: TextStyle(color: Colors.white
                            //fontSize: 10,
                            )),
                  ),
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(
                            color: Colors.white,
                            //fontSize: 10,
                          ))),
                  DataColumn(
                      label: Text(
                    'Order No.',
                    style: TextStyle(
                      color: Colors.white,
                      //fontSize: 10,
                    ),
                  )),
                  DataColumn(
                      label: Text('Chemist Name',
                          style: TextStyle(
                            color: Colors.white,
                            //fontSize: 10,
                          ))),
                  DataColumn(
                      label: Text('Product Details',
                          style: TextStyle(
                            color: Colors.white,

                            // fontSize: 10,
                          ))),
                  // DataColumn(
                  //     label: Text('Status',
                  //         style: TextStyle(

                  //             //fontSize: 10,
                  //             ))),
                ],
                rows: val.models.map((e) {
                  return DataRow(
                    cells: [
                      DataCell(Text(
                        e.status!,
                        style: const TextStyle(),
                      )),
                      DataCell(Text(
                        DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse(e.dateTime!)),
                        style: const TextStyle(),
                      )),
                      DataCell(Text(
                        e.orderNo!,
                        style: const TextStyle(),
                      )),
                      DataCell(Text(
                        e.chemistName!,
                        style: const TextStyle(),
                      )),
                      DataCell(Text(
                        e.productDetails!,
                      )),
                    ],
                  );
                }).toList(),
              ),
            )),
      ),
    );
  }
}
