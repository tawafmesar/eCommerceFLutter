import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/auth.dart';
import 'package:untitled1/utilities/ename.dart';
import 'package:untitled1/views/widgets/main_buttom.dart';

import '../../controllers/auth_controller.dart';
import '../../utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFoucusNode = FocusNode();
  final _passwordFoucusNode = FocusNode();

  // var _authType = AuthFormType.login;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      // Navigator.of(context).pop();
      // Navigator.of(context).pushNamed(AppRoutes.landingPageRoute);


    } catch (e) {
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text('Error',style: Theme.of(context).textTheme.titleMedium,),
        content: Text(e.toString(), style: Theme.of(context).textTheme.titleMedium,),
        actions: [
          TextButton(onPressed: ()=> Navigator.of(context).pop(),  child: Text('OK'))
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60.0,
                horizontal: 32.0,
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.authFormType == AuthFormType.login
                            ? 'Login'
                            : 'Register',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 90.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFoucusNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFoucusNode),
                        textInputAction: TextInputAction.next,
                        onChanged: model.updateEmail,
                        validator: (val) =>
                            val!.isEmpty ? 'Pleas enter your email' : null,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFoucusNode,
                        validator: (val) =>
                            val!.isEmpty ? 'Pleas enter your password' : null,
                        onChanged: model.updatePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your email',
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      if (model.authFormType == AuthFormType.login)
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              child: const Text('Forgot your password ?'),
                              onTap: () {}),
                        ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      MainButton(
                          text: model.authFormType == AuthFormType.login
                              ? 'Login'
                              : 'Register',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _submit(model);
                              // Navigator.of(context)
                              //     .pushNamed(AppRoutes.bottomNavRoute);
                            }
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Text(
                            model.authFormType == AuthFormType.login
                                ? 'Dont\'t have an account ? Register'
                                : 'Have ane account ? Login',
                          ),
                          onTap: () {
                            _formKey.currentState!.reset();
                            model.toggleFormType();
                            // setState(() {
                            //   if (_authType == AuthFormType.login) {
                            //     _authType = AuthFormType.register;
                            //   } else {
                            //     _authType = AuthFormType.login;
                            //   }
                            // });
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.14),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.authFormType == AuthFormType.login
                              ? 'or Login with'
                              : 'Or Register with ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.white),
                            child: Icon(Icons.add),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.white),
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
