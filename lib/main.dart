import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;
import 'package:websocket_assignment/blocs/add_watch_list/add_watch_list_bloc.dart';
import 'package:websocket_assignment/blocs/symbols_and_close_price/symbols_and_close_price_bloc.dart';
import 'package:websocket_assignment/pages/home/home_page.dart';
import 'package:websocket_assignment/resources/theme_manger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SymbolsAndClosePriceBloc>(
              create: (context) => SymbolsAndClosePriceBloc()
                ..add(const FetchSymbolsAndUpdateClosePriceEvent()),
            ),
            BlocProvider<AddWatchListBloc>(
              create: (context) => AddWatchListBloc(),
            ),
          ],
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Websocket Assignment',
              theme: getApplicationTheme(context),
              home: const HomePage(),
            ),
          ),
        );
      },
    );
  }
}
