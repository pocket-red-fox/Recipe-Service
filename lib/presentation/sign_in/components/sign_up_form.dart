part of '../sign_in_page.dart';

class _SignUpForm extends StatelessWidget {
  final SignInBloc signInBloc;

  const _SignUpForm({
    required this.signInBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              state.authFailureOrSuccessOption.fold(
                () => null,
                (authFailureOrUnit) => authFailureOrUnit.fold(
                  (failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          failure.map<String>(
                            serverError: (_) => 'Server Error',
                            emailAlreadyInUse: (_) => 'This Email Already Exist',
                            invalidEmailOrPassword: (_) => 'Invalid Email Or Password',
                          ),
                        ),
                      ),
                    );
                  },
                  (unit) => null,
                ),
              );
            },
            bloc: signInBloc,
            builder: (context, state) {
              if (state.isSubmitting) {
                return const _LoadingState();
              }

              return Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintText: 'Email',
                        errorText: state.emailAddress.value.fold(
                          (failure) => failure.mapOrNull(invalidEmail: (_) => 'Invalid Email'),
                          (_) => null,
                        ),
                      ),
                      onChanged: (value) {
                        signInBloc.add(
                          SignInEvent.emailChange(value),
                        );
                      },
                    ),
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintText: 'Password',
                        errorText: state.password.value.fold(
                          (failure) => failure.mapOrNull(
                            shortPassword: (_) => 'Password must contain at least 6 symbols',
                          ),
                          (_) => null,
                        ),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        signInBloc.add(
                          SignInEvent.passwordChange(value),
                        );
                      },
                    ),
                    const Spacer(),
                    _GradientButton(
                      onPressed: () {
                        signInBloc.add(
                          const SignInEvent.singUpWithEmailAndPassword(),
                        );
                      },
                      gradient: DefaultGradient(context),
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    FilledButton(
                      onPressed: () {
                        signInBloc.add(
                          const SignInEvent.signInWithGoogle(),
                        );
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Sign in with Google',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
