import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/components/error_boxes/error_boxes.dart';
import 'package:xlo/screens/login_screen/login_screen.dart';
import 'package:xlo/stores/signup_store.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import 'components/field_title.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final SignupStore _signupStore = SignupStore();
  final TextEditingController _controller = TextEditingController(
    text: 'renatofss16@gamil.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        title: Text('Cadastro', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32),

            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Observer(
                    builder: (_) {
                      return ErrorBoxes(message: _signupStore.errorParse);
                    },
                  ),
                  FieldTitle(
                    title: 'Apelido',
                    subTitle: 'nome que vai aparecer nos seus anuncios',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !_signupStore.loading,
                        decoration: InputDecoration(
                          label: Text('Apelido'),
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: João da Silva',
                          errorText: _signupStore.nameError,
                        ),
                        onChanged: _signupStore.setName,
                      );
                    },
                  ),
                  FieldTitle(
                    title: 'E-mail',
                    subTitle: 'Enviaremos um email de confimacao',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        controller: _controller,
                        enabled: !_signupStore.loading,
                        onChanged: _signupStore.setEmail,
                        decoration: InputDecoration(
                          label: Text('E-mail'),
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: exemplo@gmail.com',
                          errorText: _signupStore.emailError,
                        ),
                        keyboardType: TextInputType.text,
                      );
                    },
                  ),
                  FieldTitle(title: 'Celular', subTitle: 'Proteja sua conta'),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !_signupStore.loading,
                        decoration: InputDecoration(
                          label: Text('Celular'),
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: '(99) 9999-9999',
                          errorText: _signupStore.phoneError,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: _signupStore.setPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      );
                    },
                  ),
                  FieldTitle(title: 'Senha', subTitle: 'Use letras e numeros'),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !_signupStore.loading,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Senha'),
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: _signupStore.passwordError,
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: _signupStore.setPassword,
                      );
                    },
                  ),
                  FieldTitle(
                    title: 'Confirma a senha',
                    subTitle: 'Repita a senha',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !_signupStore.loading,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Confirma a senha'),
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: _signupStore.password2Error,
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: _signupStore.setPassword2,
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  Observer(
                    builder: (_) {
                      return ElevatedButton(
                        onPressed:
                            (_signupStore.isFormValid && !_signupStore.loading)
                                ? _signupStore.signUp
                                : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child:
                            _signupStore.loading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  'Cadastrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                      );
                    },
                  ),
                  Divider(color: Colors.black87),
                  Row(
                    children: [
                      Text(
                        'Ja tem conta?',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Entrar',
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
      ),
    );
  }
}
