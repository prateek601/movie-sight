import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trending_movies/app/data/values/env.dart';
import 'package:trending_movies/app/modules/home/cubit/movie_data_cubit.dart';
import 'package:trending_movies/app/modules/home/home_view.dart';
import 'package:trending_movies/app/modules/internet/cubit/internet_cubit.dart';

import 'utils/toast/toast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());
  HydratedBlocOverrides.runZoned(
        () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Env.title,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xff0e0f15)),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieDataCubit>(
            create: (context) => MovieDataCubit(),
          ),
          BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(),
          )
        ],
        child: BlocListener<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is Disconnected) {
                Toast.showToast(context: context, message: 'Disconnected');
              } else if (state is Connected) {
                Toast.showToast(context: context, message: 'Connected');
              }
            },
            child: const HomeView()),
      ),
    );
  }
}
