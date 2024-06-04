import 'package:flutter/material.dart';
import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/Provider/UsuarioProvider.dart';
import 'package:project/View/Screems/LoginForm.dart';
import 'package:project/View/Screems/MyHomePage.dart';
import 'package:project/View/components/MyButton.dart';
import 'package:project/View/components/MyTextField.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static const String nombre = 'login';
  final prefs = PrefernciaUsuario();

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(BuildContext context) async {
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    try {
      await usuarioProvider.login(
          usernameController.text, passwordController.text);
      prefs.usuario = usernameController.text;
      Navigator.of(context).pushNamed(MyHomePage.nombre);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrecto'),
        ),
      );
    }
  }

  void navigateToRegisterPage(BuildContext context) {
    Navigator.of(context).pushNamed(LoginForm.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 0),

              // logo
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.black,
              ),

              const SizedBox(height: 20),

              // welcome back
              Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),

              const SizedBox(height: 15),

              MyButton(
                onTap: () {
                  signUserIn(context);
                },
              ),

              const SizedBox(height: 20),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              InkWell(
                onTap: () {
                  navigateToRegisterPage(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
