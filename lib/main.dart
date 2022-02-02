import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_screen/views/news_screen.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/views/splash_screen.dart';

import 'blocs/news_bloc/bloc/news_bloc.dart';
import 'category/category_bloc/category_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        )
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme(context),
        home: const FullNewsScreen(),
      ),
    );
  }
}
