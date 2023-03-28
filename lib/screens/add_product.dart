import 'package:chemist/models/chemist_model/chemist_model.dart';
import 'package:chemist/models/product_model/product_model.dart';
import 'package:chemist/providers/homepage_provider/homepage_provider.dart';
import 'package:chemist/providers/productpage_provider/productpage_provider.dart';
import 'package:chemist/screens/chemist_details.dart';
import 'package:chemist/utils/colors.dart';
import 'package:chemist/utils/text_style.dart';
import 'package:chemist/widgets/global_widgets/my_progress_indicator.dart';
import 'package:chemist/widgets/productpage_widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chemist/utils/helpers.dart';

class AddProductPage extends StatefulWidget {
  final ChemistModel model;
  const AddProductPage({
    required this.model,
    super.key,
  });

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<ProductPageProvider>(
      builder: (context, productPageProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Products'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
          child: SingleChildScrollView(
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
                  width: screenSize.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${widget.model.name!} (${widget.model.chemistCode})',
                    style: mainTextStyleB500,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.06),
                const Text(
                  'Products',
                  style: mainTextStyleB500,
                ),
                SizedBox(height: screenSize.height * 0.01),
                Consumer<HomePageProvider>(
                  builder: (context, value, child) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButton(
                      value: productPageProvider.selectedModel,
                      borderRadius: BorderRadius.circular(12),
                      isExpanded: true,
                      menuMaxHeight: screenSize.height * 0.5,
                      items: value.productList
                          .map<DropdownMenuItem<ProductModel>>((e) {
                        // if (e.itemsModel != null || e.itemsModel!.isNotEmpty) {
                        //   return e.itemsModel!.map((item) {
                        //     return DropdownMenuItem(
                        //       value: item!.productName,
                        //       child: Text(item.productName!),
                        //     );
                        //   }).toList();
                        // }
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.brandName!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        productPageProvider.changeSelectedModel(value!);
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.04),
                const Center(
                  child: Text(
                    'Quantity',
                    style: mainTextStyleB500,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.005),
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
                        onTap: () => productPageProvider.counterAdd(),
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
                          productPageProvider.counter.toString(),
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
                        onTap: () => productPageProvider.counterSub(),
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
                  onTap: () {
                    (productPageProvider.imageFile == null)
                        ? productPageProvider.pickImage(context)
                        : goToPage(context,
                            ImageViewer(file: productPageProvider.imageFile!));
                  },
                  child: Container(
                    width: double.infinity,
                    height: screenSize.height * 0.04,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: (productPageProvider.isLoading == true)
                          ? const MyProgressIndicator(
                              color: Colors.white,
                              size: 10,
                            )
                          : Text(
                              'View Image',
                              style: mainTextStyleB500.copyWith(
                                  color: Colors.white),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.08),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 28)),
                    onPressed: () {
                      goToPage(context, const ChemistDetailsPage());
                    },
                    child: const Text(
                      'Save Details',
                      style: mainTextStyleB500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
