import 'package:flutter/material.dart';
import 'package:fraseando/components/decorationRegister.dart';

import 'pageLogin.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObscureText = false;
  bool isObscureconfirmText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.lightBlue,
              Color.fromRGBO(26, 186, 215, 1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 22, 162, 244),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(27, 90, 225, 0.298),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/bebeBaleia.png',
                        height: 70,
                      ),
                      Text(
                        "Cadastre-se no Fraseando",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("Nome:"),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("Email:"),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: isObscureText,
                        onChanged: (value) {},
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        decoration: getPasswordInputRegisterDecoration(
                          "Senha",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            icon: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: isObscureconfirmText,
                        onChanged: (value) {},
                        onTap: () {
                          setState(() {
                            isObscureconfirmText = !isObscureconfirmText;
                          });
                        },
                        decoration: getConfirmPasswordInputRegisterDecoration(
                          "Confirme sua senha",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureconfirmText = !isObscureconfirmText;
                              });
                            },
                            icon: Icon(
                              isObscureconfirmText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () {},
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PageLogin()));
                          },
                          child: Text(
                            "Já tem um login? clique aqui!",
                            style: TextStyle(
                                color: Color.fromARGB(255, 241, 240, 240)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
