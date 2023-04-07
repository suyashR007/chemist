import 'package:chemist/providers/homepage_provider/homepage_provider.dart';
import 'package:chemist/utils/helpers.dart';
import 'package:chemist/utils/text_style.dart';
import 'package:chemist/widgets/global_widgets/my_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController searchChemistController;
  bool runOne = true;
  @override
  void initState() {
    searchChemistController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchChemistController.dispose();
    super.dispose();
  }

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
            if (value.chemistListLenght == 0) {
              showMySnackBar(context, 'No Chemist is Added');
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (context, setState) => SimpleDialog(
                      title: TextFormField(
                        onChanged: (element) =>
                            value.runFilter(element, setState),
                        decoration: InputDecoration(
                          label: const Text('Search Chemist'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.3,
                          width: screenSize.width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                            child: ListView.builder(
                              itemCount: value.foundChemist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  key:
                                      ValueKey(value.foundChemist[index].name!),
                                  title: Text(
                                    '${value.foundChemist[index].name!} (${value.foundChemist[index].chemistCode})',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () =>
                                      value.listTileTapFn(index, context),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
              future: value.getTotalChemist(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                      child: Text(
                    '${snapshot.data} Chemist Added',
                    style: mainStyle,
                  ));
                }
                return const Center(
                  child: Text(
                    'No Chemist Added',
                    style: mainStyle,
                  ),
                );
              },
            ),
            ElevatedButton(
              child: (value.isLoading)
                  ? const MyProgressIndicator(
                      size: 20,
                      color: Colors.white,
                    )
                  : const Text('Fetch Details'),
              onPressed: () => value.fetchChemistDetail(),
            ),
          ],
        ),
      ),
    );
  }
}
