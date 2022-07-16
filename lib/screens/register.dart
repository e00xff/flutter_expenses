import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_expenses/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 8,
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            errorMessage = '';
                          }),
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            errorMessage = '';
                          }),
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                        TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passwordController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() => errorMessage = ''),
                          decoration: const InputDecoration(labelText: 'Password'),
                        ),
                        TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passwordConfirmController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Repeat password';
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() => errorMessage = ''),
                          decoration: const InputDecoration(labelText: 'Confirm Password'),
                        ),
                        ElevatedButton(
                          onPressed: () => submit(),
                          child: const Text('Register'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 36)),
                        ),
                        Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: InkWell(
                            onTap: () => {Navigator.pop(context)},
                            child: const Text('Back to Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }

    final AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);
    
    try {
      String token = await provider.register(
          nameController.text,
          emailController.text,
          passwordController.text,
          passwordConfirmController.text,
          'Device name');
      Navigator.pop(context);
    } catch (Exception) {
      setState(() {
        errorMessage = Exception.toString().replaceAll('Exception: ', '');
      });
    }
  }

}
