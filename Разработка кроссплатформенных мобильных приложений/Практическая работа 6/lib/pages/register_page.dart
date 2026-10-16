import 'package:flutter/material.dart';
import '../user_data.dart';
import '../widgets/text_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      UserData.register(
        userName: _nameController.text.trim(),
        userEmail: _emailController.text.trim(),
        userPassword: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Регистрация выполнена успешно',
          ),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 28),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                  MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context)
                          .padding
                          .bottom,
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    CustomTextFormField(
                      inputType: InputFieldType.name,
                      labelText: 'ФИО',
                      hintText: 'Введите ФИО',
                      prefixIcon: const Icon(
                        Icons.person_outline,
                      ),
                      controller: _nameController,
                      textInputAction:
                      TextInputAction.next,
                      onSubmitted: () =>
                          FocusScope.of(context)
                              .nextFocus(),
                    ),

                    const SizedBox(height: 15),

                    CustomTextFormField(
                      inputType: InputFieldType.email,
                      labelText: 'Email',
                      hintText: 'example@mail.ru',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),
                      controller: _emailController,
                      textInputAction:
                      TextInputAction.next,
                      onSubmitted: () =>
                          FocusScope.of(context)
                              .nextFocus(),
                    ),

                    const SizedBox(height: 15),

                    CustomTextFormField(
                      inputType:
                      InputFieldType.password,
                      labelText: 'Пароль',
                      hintText: 'Введите пароль',
                      prefixIcon:
                      const Icon(Icons.security),
                      controller:
                      _passwordController,
                      textInputAction:
                      TextInputAction.next,
                      onSubmitted: () =>
                          FocusScope.of(context)
                              .nextFocus(),
                    ),

                    const SizedBox(height: 15),

                    CustomTextFormField(
                      inputType:
                      InputFieldType.confirmPassword,
                      labelText: 'Повторите пароль',
                      hintText: 'Повторите пароль',
                      prefixIcon:
                      const Icon(Icons.security),
                      controller:
                      _confirmPasswordController,
                      passwordController:
                      _passwordController,
                      textInputAction:
                      TextInputAction.done,
                      onSubmitted: _register,
                    ),

                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: _register,
                      style:
                      ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Зарегистрироваться',
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Уже есть аккаунт? ',
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Войдите',
                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}