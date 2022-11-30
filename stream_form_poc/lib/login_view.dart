import 'package:flutter/material.dart';
import 'package:stream_form_poc/home_view.dart';
import 'package:stream_form_poc/login_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({
    Key? key,
  }) : super(key: key);

  final LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                  stream: loginViewModel.email$,
                  builder: (context, snapshot) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: 'Input Email',
                        label: const Text('Email'),
                        errorText: snapshot.error as String?,
                      ),
                      onChanged: loginViewModel.email.add,
                    );
                  }),
              const SizedBox(height: 10),
              StreamBuilder<String>(
                  stream: loginViewModel.password$,
                  builder: (context, snapshot) {
                    return TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Input Email',
                          label: const Text('Password'),
                          errorText: snapshot.error as String?),
                      onChanged: loginViewModel.password.add,
                    );
                  }),
              const SizedBox(height: 20),
              StreamBuilder<bool>(
                  stream: loginViewModel.isVaildForm(),
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: snapshot.hasData && snapshot.data!
                            ? () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const HomeView(),
                                  ),
                                  (_) => false,
                                );
                              }
                            : null,
                        child: const Text('Send'),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
