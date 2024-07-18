import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mania/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_mania/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_mania/constants/colors.dart';
import 'package:pizza_mania/screens/authentication/views/welcome_screen.dart';
import 'package:pizza_mania/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_mania/screens/home/views/home_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pizza Mania",
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: lightgreyColor,
          onBackground: blackColor,
          primary: blueColor,
          onPrimary: whiteColor,
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                      context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider(
                  create: (context) =>
                      GetPizzaBloc(FirebasePizzaRepo())..add(GetPizza()),
                ),
              ],
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        }),
      ),
    );
  }
}
