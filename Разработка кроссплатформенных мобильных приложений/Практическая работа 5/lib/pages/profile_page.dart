import 'package:flutter/material.dart';
import '../user_data.dart';
import '../widgets/text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController
  _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: UserData.name ?? '',
    );

    _emailController = TextEditingController(
      text: UserData.email ?? '',
    );

    _passwordController = TextEditingController(
      text: UserData.password ?? '',
    );

    _confirmPasswordController =
        TextEditingController(
          text: UserData.password ?? '',
        );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _save() {
    if (_formKey.currentState?.validate() ??
        false) {
      FocusScope.of(context).unfocus();

      UserData.register(
        userName: _nameController.text.trim(),
        userEmail: _emailController.text.trim(),
        userPassword: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Данные сохранены',
          ),
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
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),

                      const Expanded(
                        child: Text(
                          'Профиль',
                          textAlign:
                          TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 48),
                    ],
                  ),

                  const SizedBox(height: 20),

                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(22),
                    child: Image.asset(
                      'assets/profile.jpeg',
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomTextFormField(
                    inputType:
                    InputFieldType.name,
                    labelText: 'ФИО',
                    hintText: 'Введите ФИО',
                    prefixIcon: const Icon(
                      Icons.person_outline,
                    ),
                    controller:
                    _nameController,
                    textInputAction:
                    TextInputAction.next,
                    onSubmitted: () =>
                        FocusScope.of(context)
                            .nextFocus(),
                  ),

                  const SizedBox(height: 15),

                  CustomTextFormField(
                    inputType:
                    InputFieldType.email,
                    labelText: 'Email',
                    hintText: 'Введите Email',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    controller:
                    _emailController,
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
                    inputType: InputFieldType
                        .confirmPassword,
                    labelText:
                    'Повторите пароль',
                    hintText:
                    'Повторите пароль',
                    prefixIcon:
                    const Icon(Icons.security),
                    controller:
                    _confirmPasswordController,
                    passwordController:
                    _passwordController,
                    textInputAction:
                    TextInputAction.done,
                    onSubmitted: _save,
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: _save,
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.black,
                      foregroundColor:
                      Colors.white,
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 45,
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
                    child:
                    const Text('Сохранить'),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}