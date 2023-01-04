import 'package:eshop/features/authentication/presentation/bloc/select_login_signup/select_login_signup_cubit.dart';
import 'package:eshop/features/authentication/presentation/components/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => SelectLoginSignupCubit()),
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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: BlocBuilder<SelectLoginSignupCubit, SelectLoginSignupState>(
                  builder: (context, state) {
                    bool isLogin = state is SelectLogin;
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
                          const LoginTextField(hint: "Name"): 
                          const SizedBox(),
                        const LoginTextField(hint: "Email"),
                        const LoginTextField(hint: "Password"),
                        const Expanded(child: SizedBox()),
                        Center(
                          child: ElevatedButton(
                            onPressed: (){}, 
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
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}