import 'package:chemist/models/table_models/table_model.dart';
import 'package:chemist/providers/tablepage_provider/tablepage_provider.dart';
import 'package:chemist/screens/home_page.dart';
import 'package:chemist/utils/colors.dart';
import 'package:chemist/utils/helpers.dart';
import 'package:chemist/widgets/global_widgets/my_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChemistDetailsPage extends StatefulWidget {
  const ChemistDetailsPage({super.key});

  @override
  State<ChemistDetailsPage> createState() => _ChemistDetailsPageState();
}

class _ChemistDetailsPageState extends State<ChemistDetailsPage> {
  // List<TableModel> list = [];
  // @override
  // void didChangeDependencies() async {
  //   var provider = Provider.of<TablePageProvider>(context);
  //   list = await provider.getaTableList();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemist Details'),
      ),
      body: Consumer<TablePageProvider>(
        builder: (context, val, child) => SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<TableModel>>(
              future: val.getaTableList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DataTable(
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
                      //           color: Colors.white,
                      //           //fontSize: 10,
                      //         ))),
                    ],
                    rows: List<DataRow>.generate(snapshot.data!.length,
                        (int index) {
                      TableModel e = snapshot.data![index];
                      int count = ++index;
                      return DataRow(
                        cells: [
                          DataCell(Text(
                            count.toString(),
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
                  );
                }
                return const Center(
                  child: MyProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => removePagesAndPush(context, const HomePage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
