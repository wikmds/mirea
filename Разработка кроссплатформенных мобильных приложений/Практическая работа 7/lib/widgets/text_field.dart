import 'package:flutter/material.dart';

enum InputFieldType {
  name,
  email,
  password,
  confirmPassword,
}

class CustomTextFormField
    extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final TextEditingController?
  passwordController;
  final TextInputAction? textInputAction;
  final VoidCallback? onSubmitted;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.passwordController,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  State<CustomTextFormField>
  createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends State<CustomTextFormField> {
  bool _hidePassword = true;

  String? _validator(String? value) {
    if (value == null ||
        value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }

    switch (widget.inputType) {
      case InputFieldType.name:
        final reg = RegExp(
          r'^[A-Za-zА-Яа-яЁё\s]+$',
        );

        if (!reg.hasMatch(value)) {
          return 'ФИО должно содержать только буквы и пробелы';
        }

        break;

      case InputFieldType.email:
        final reg = RegExp(
          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
        );

        if (!reg.hasMatch(value)) {
          return 'Введите корректный Email';
        }

        break;

      case InputFieldType.password:
        final reg = RegExp(
          r'^(?=.*[A-Za-zА-Яа-я])(?=.*\d)(?=.*[+_-]).{6,}$',
        );

        if (!reg.hasMatch(value)) {
          return 'Минимум 6 символов: буквы, цифры и + _ -';
        }

        break;

      case InputFieldType.confirmPassword:
        if (value !=
            widget.passwordController?.text) {
          return 'Пароли не совпадают';
        }

        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword =
        widget.inputType ==
            InputFieldType.password ||
            widget.inputType ==
                InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,

      obscureText:
      isPassword && _hidePassword,

      keyboardType:
      widget.inputType ==
          InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,

      textInputAction:
      widget.textInputAction,

      onFieldSubmitted: (_) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!();
        }
      },

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,

        prefixIcon: widget.prefixIcon,

        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _hidePassword
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _hidePassword =
              !_hidePassword;
            });
          },
        )
            : null,

        contentPadding:
        const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
          borderSide:
          const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
          borderSide:
          const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
          borderSide:
          const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
          borderSide:
          const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),

        focusedErrorBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
          borderSide:
          const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),

      validator: _validator,
    );
  }
}