import 'package:employee_list_app/pages/home_page.dart';
import 'package:employee_list_app/pages/provider/employee_provider.dart';
import 'package:employee_list_app/utils/model_current.dart';
import 'package:employee_list_app/utils/model_previous.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(EmployeeModelCurrentAdapter().typeId)) {
    Hive.registerAdapter(EmployeeModelCurrentAdapter());
  }
  if (!Hive.isAdapterRegistered(EmployeeModelPreviousAdapter().typeId)) {
    Hive.registerAdapter(EmployeeModelPreviousAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EmployeeProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
