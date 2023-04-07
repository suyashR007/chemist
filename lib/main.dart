import 'package:chemist/models/product_model/product_model.dart';
import 'package:chemist/models/table_models/table_model.dart';
import 'package:chemist/providers/homepage_provider/homepage_provider.dart';
import 'package:chemist/providers/productpage_provider/productpage_provider.dart';
import 'package:chemist/providers/tablepage_provider/tablepage_provider.dart';
import 'package:chemist/screens/home_page.dart';
import 'package:chemist/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/chemist_model/chemist_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ChemistModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ChemistModel>('chemistList');
  await Hive.openBox<ProductModel>('productList');
  await Hive.openBox<TableModel>('tablelist');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProxyProvider<HomePageProvider, ProductPageProvider>(
          create: (context) => ProductPageProvider(),
          update: (context, value, previous) =>
              ProductPageProvider(productList: value.productList),
        ),
        ChangeNotifierProvider(create: (context) => TablePageProvider()),
      ],
      child: MaterialApp(
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
