import 'package:e_commerce_task/features/home/presentation/bloc/product_bloc.dart';
import 'package:e_commerce_task/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce_task/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => sl<ProductBloc>())],
          child: MaterialApp(
            title: 'Task',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
