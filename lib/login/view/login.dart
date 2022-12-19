

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_add/dashboard/view/dashboard.dart';
import 'package:my_add/home/view/home.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final mailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: lines_longer_than_80_chars
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome Back John!',
                style: TextStyle(
                  color: Color(
                    0xFF0BDA51,
                  ),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign in to continue',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: mailcontroller,
                  cursorColor: const Color(0xFF0BDA51),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Color(0xFF0BDA51),
                    ),
                    fillColor: Colors.grey.shade300,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  cursorColor: const Color(0xFF0BDA51),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF0BDA51),
                    ),
                    fillColor: Colors.grey.shade300,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Forget pasword?',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0BDA51),
                    ),
                    onPressed:signin,
                    child: const Text('Sign in'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Row(
                  children: [
                    const Center(
                      child: Text(
                        'Already have an acount?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mailcontroller.text, password: passwordcontroller.text);

          Navigator.push(context,MaterialPageRoute(builder: (context) => Dashboard(),));
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
