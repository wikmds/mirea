import 'package:flutter/material.dart';
import '../user_data.dart';
import '../widgets/text_field.dart';
import 'cinema_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    FocusScope.of(context).unfocus();

    if (!UserData.isRegistered) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Сначала зарегистрируйтесь'),
        ),
      );
      return;
    }

    final success = UserData.login(
      userEmail: _emailController.text.trim(),
      userPassword: _passwordController.text,
    );

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnlineCinemaPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Неверный Email или пароль'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Добро пожаловать!\n'
                      'Войдите в свой аккаунт\n'
                      'Или создайте новый',
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 40),

                CustomTextFormField(
                  inputType: InputFieldType.email,
                  labelText: 'Email',
                  hintText: 'Введите Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  onSubmitted: () =>
                      FocusScope.of(context).nextFocus(),
                ),

                const SizedBox(height: 15),

                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: 'Пароль',
                  hintText: 'Введите пароль',
                  prefixIcon: const Icon(Icons.security),
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: _login,
                ),

                const SizedBox(height: 8),

                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Забыли пароль?',
                    style: TextStyle(fontSize: 13),
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text('Войти'),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Нет аккаунта? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Зарегистрируйтесь',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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