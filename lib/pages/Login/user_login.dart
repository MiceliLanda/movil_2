import 'package:flutter/material.dart';
import 'package:mvp_all/pages/Home/home.dart';
import 'package:mvp_all/pages/RecoverPassword/recover.dart';
import 'package:mvp_all/pages/Register/register.dart';
import 'package:mvp_all/styles/colors/colors_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsView.txtheader,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context)
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: ((context) => const Home())))
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsView.barused,
            size: 30,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Iniciar sesión'),
            SizedBox(
              width: 85,
              height: 45,
              child: Image.asset(
                'assets/images/splash.png',
                color: ColorsView.textWhite,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Expanded(
          flex: 3,
          child: Container(
            margin:
                const EdgeInsets.only(top: 35, left: 25, right: 25, bottom: 50),
            width: double.infinity,
            // color: ColorsView.bgEnabled,
            child: Column(
              textDirection: TextDirection.ltr,
              children: [
                const Text(
                  'Inicia sesión con tu cuenta para continuar',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Hack',
                      fontWeight: FontWeight.bold,
                      color: ColorsView.txtheader2),
                ),
                const SizedBox(
                  height: 50,
                ),
                containerText(name: 'Correo Electrónico'),
                _textField(field: 'Email Address'),
                const SizedBox(
                  height: 30,
                ),
                containerText(name: 'Contraseña'),
                _textFieldPassword(field: 'Password'),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    child: const Text('¿Has olvidado tu contraseña?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorsView.barused)),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Recover(),
                        ),
                      )
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorsView.bgEnabled),
                ),
                onPressed: () {},
                child: const Text(
                  'Ingresar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: const Text(
                      '¿Todavía no tienes una cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  InkWell(
                    child: const Text('Regístrate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 20, 96, 1))),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()))
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField _textField({required String field}) {
    return TextField(
      style: _textStyle(bold: false),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: field,
      ),
    );
  }

  TextField _textFieldPassword({required String field}) {
    return TextField(
      obscureText: _isHide,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        suffixIcon: IconButton(
          icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                _isHide = !_isHide;
              },
            );
          },
        ),
      ),
    );
  }

  TextStyle _textStyle({required bool bold}) {
    return TextStyle(
      fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
      fontSize: 15,
      fontFamily: 'Hack',
    );
  }

  Container containerText({required String name}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        name,
        style: _textStyle(bold: true),
      ),
    );
  }
}
