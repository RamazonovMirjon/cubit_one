import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr/views/auth/cubit/auth_cubit.dart';
import 'package:pr/views/auth/state/auth_state.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: myScaffold(context),
    );
  }

  Scaffold myScaffold(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication Page"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            mySnackbar(context, state);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is AuthInitial) {
            return Center(
              child: ElevatedButton(
                child: Text("Sign In"),
                onPressed: () {
                  context.read<AuthCubit>().signIn();
                },
              ),
            );
          } else if (state is AuthComplete) {
            return Center(
              child: Text(state.user['token'] ?? "token ??"),
            );
          } else {
            return mySnackbar(context, state);
          }
        },
      ),
    );
  }

  mySnackbar(context, state) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text((state as AuthError).msg),
        ),
      );
}