import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inklink/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:inklink/core/theme/theme.dart';
import 'package:inklink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:inklink/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:inklink/features/auth/presentation/pages/login_page.dart';
import 'package:inklink/init_dependencies.dart';
import 'package:inklink/features/blog/presentation/pages/blog_page.dart';

void main() async {
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<
            AuthBloc>(), //Dependecy Injection (see init_dependencies.dart)
      ),
      BlocProvider(
        create: (_) => serviceLocator<
            BlogBloc>(), //Dependecy Injection (see init_dependencies.dart)
      ),
       
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InkLink',
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        //only to catch 1 state in AppUserCubit
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const BlogPage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
