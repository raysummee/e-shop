import 'package:eshop/features/authentication/data/repository/authentication_repository.dart';
import 'package:eshop/features/authentication/domain/repository/authentication_repository.dart';
import 'package:eshop/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:eshop/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:eshop/features/authentication/presentation/bloc/select_login_signup/select_login_signup_cubit.dart';
import 'package:eshop/features/authentication/presentation/components/login_textfield.dart';
import 'package:eshop/features/shared/presentation/components/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => SelectLoginSignupCubit()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(context.read<AuthenticationRepositoryImpl>()),
        ),
      ],
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(245, 249, 253, 1),
      body: SafeArea(
        child: CustomScrollView(//expanded can be used with this scroll
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is AuthenticationSuccess) {
                      Navigator.of(context).pushNamedAndRemoveUntil("/home",(Route<dynamic> route) => false);
                    }
                  },
                  child: BlocBuilder<SelectLoginSignupCubit, SelectLoginSignupState>(
                    builder: (context, state) {
                      bool isLogin = state is SelectLogin;
                      return BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if(state is LoginValidate){
                            if(state.isLoading){
                              LoadingDialog.show(context);
                            }else{
                              LoadingDialog.close();
                            }
                            if (state.error.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error))
                              );
                            } else if (state.isLoginValidateFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Login was not successfull")));
                            }
                          } else if (state is LoginSuccess) {
                            context.read<AuthenticationBloc>().add(AuthenticationStarted());
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "e-Shop",
                                style: TextStyle(
                                  color: Color.fromRGBO(12, 84, 190, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 150,
                              ),
                              !isLogin?
                                LoginTextField(
                                  hint: "Name",
                                  onChanged: (name) {
                                    context.read<LoginBloc>().add(NameChanged(name));
                                  },
                                  error: state is! LoginValidate||state.isNameValid? 
                                    null: 
                                    "Invalid name",
                                ): 
                                const SizedBox(),
                              LoginTextField(
                                hint: "Email",
                                onChanged: (email) {
                                  context.read<LoginBloc>().add(EmailChanged(email));
                                },
                                error: state is! LoginValidate||state.isEmailValid? 
                                  null: 
                                  "Invalid email",
                              ),
                              LoginTextField(
                                hint: "Password",
                                onChanged: (password) {
                                  context.read<LoginBloc>().add(PasswordChanged(password));
                                },
                                error: state is! LoginValidate||state.isPasswordValid? 
                                  null: 
                                  "password length should be greater than 8",
                              ),
                              const Expanded(child: SizedBox()),
                              Center(
                                child: ElevatedButton(
                                  onPressed: (){
                                    if(isLogin){
                                      context.read<LoginBloc>().add(FormLogin());
                                    }else{
                                      context.read<LoginBloc>().add(FormSignup());
                                    }
                                  }, 
                                  child: Text(
                                    isLogin? 
                                      "Login":
                                      "Signup",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16
                                    ),
                                  )
                                ),
                              ),
                              const SizedBox(
                                height: 5 // 13 - 8 (8 is minus for the textbutton height),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      if(isLogin){
                                        context.read<SelectLoginSignupCubit>().selectSignup();
                                      }else{
                                        context.read<SelectLoginSignupCubit>().selectLogin();
                                      }
                                    }, 
                                    child: Text(
                                      !isLogin? 
                                        "Login":
                                        "Signup"
                                    )
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 51,
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}