import 'package:flutter/material.dart';
import 'package:teach_assist_web/components/app_bar_component.dart';
import 'package:teach_assist_web/components/form_text_field.dart';
import 'package:teach_assist_web/components/main_button_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        leading: false,
        title: '',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo/logo.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormTextField(
                        labelText: 'Usuário ou e-mail',
                        hintText: 'Digite o seu usuário ou e-mail de acesso',
                        textController: _userNameController,
                        inputValidator: (username){
                          if(username == null || username.isEmpty){
                            return 'Por favor, preencha o campo usuário';
                          }
                          return null;
                        },
                      ),
                      FormTextField(
                        labelText: 'Senha',
                        hintText: 'Senha correspondente ao usuário',
                        obscureText: true,
                        textController: _passwordController,
                        inputValidator: (password){
                          if(password == null || password.isEmpty){
                            return 'Por favor, preencha o campo senha';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                mainButton(
                  buttonText: 'Entrar',
                  buttonFunction: (){
                    if(_formKey.currentState!.validate()){

                    }
                  }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
