import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/components/custom_drawer/custom_drawer.dart';
import 'package:xlo/screens/signup_screen/signup_screen.dart';
import 'package:xlo/stores/login_store.dart';

import '../../components/error_boxes/error_boxes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginStore _loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 32),

          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              shrinkWrap: true,
              children: [
                Observer(builder: (_){
                  return ErrorBoxes(message: _loginStore.errorParse,);
                }),
                ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), child: Text('Facebook',style: TextStyle(color: Colors.white),),),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Text(
                      'Ou',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[900]),

                    ),
                    Expanded(child: Divider(color: Colors.grey))
                  ],
                ),
                SizedBox(height: 16,),
                Text(
                  'Acessar com E-mail',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
                Text(
                  'E-mail',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
                Observer(builder: (_){
                  return                 TextField(
                    onChanged: _loginStore.setEmail,
                    enabled: !_loginStore.loading,
                    decoration: InputDecoration(
                      errorText: _loginStore.emailError,
                      label: Text('E-mail'),
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  );
                }),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Senha',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Esqueceu sua senha?',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16, color: Colors.purple),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Observer(builder: (_){
                  return TextField(
                    enabled: !_loginStore.loading,
                    onChanged: _loginStore.setPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: _loginStore.passwordError,
                      label: Text('password'),
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                    keyboardType: TextInputType.text,
                  );
                }),
                SizedBox(height: 16),
                Observer(builder: (_){
                  return ElevatedButton(
                    onPressed: (_loginStore.isFormValid && !_loginStore.loading)? _loginStore.login :null,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: _loginStore.loading? CircularProgressIndicator(color: Colors.white,):Text('Entrar', style: TextStyle(color: Colors.white)),
                  );
                }),
                SizedBox(height: 16),
                Divider(color: Colors.grey),
                Row(
                  children: [
                    Text(
                      'Nao tem conta?',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignupScreen()),
                        );
                      },
                      child: Text(
                        'Cadastre-se',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 16, color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
