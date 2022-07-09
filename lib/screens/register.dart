import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
                  child: Column(
                    children: <Widget>[
                      const TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      const TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                      const TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration:
                            InputDecoration(labelText: 'Confirmed Password'),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, '/categories'),
                        },
                        child: const Text('Register'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 36)),
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
            ],
          ),
        ),
      ),
    );
  }
}
