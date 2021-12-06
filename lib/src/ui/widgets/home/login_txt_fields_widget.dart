import 'package:flutter/material.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final _keyForm = GlobalKey<FormState>();
  bool _value = false;
  bool _obscureTxt = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            _userField(),
            const SizedBox(height: 30.0),
            _passwordField(),
            const SizedBox(height: 10.0),
            _showPassword(),
            const SizedBox(height: 5.0),
            loginBtn(),
          ],
        ),
      ),
    );
  }

  Widget _showPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          activeColor: Colors.orange,
          checkColor: lightRed,
          value: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
              _value == false ? _obscureTxt = true : _obscureTxt = false;
            });
          },
        ),
        const Text('Show Password'),
      ],
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required Field!';
            }

            if (value != 'Mv0Oj8' && value != 'admin') {
              // password only for employees who have employees under their care
              return 'Wrong Password';
            }
          },
          decoration: inputDecoration('''password is 'admin' '''),
          obscureText: _obscureTxt,
        ),
      ],
    );
  }

  Widget _userField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ID',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextFormField(
          validator: (value) {
            String user1 = '2';
            String user2 = '90';
            String user3 = '45';
            String user4 = '555';

            if (value!.isEmpty) {
              return 'Empty Field!';
            }

            if (value != user1 &&
                value != user2 &&
                value != user3 &&
                value != user4 &&
                value != 'admin') {
              return 'Invalid User ';
            }

            return null;
          },
          decoration: inputDecoration('''ID is 'admin' '''),
        ),
      ],
    );
  }

  InputDecoration inputDecoration(String? hintTxt) {
    return InputDecoration(
      hintText: hintTxt,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
      isDense: true,
    );
  }

  Widget loginBtn() {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ElevatedButton(
          onPressed: () {
            if (_keyForm.currentState!.validate()) {
              Navigator.pushNamed(
                context,
                'employees',
              );
            } else {
              print('Error');
            }
          },
          child: const Text('LOGIN'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
      ),
    );
  }
}
