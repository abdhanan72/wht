import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_add/dashboard/view/dashboard.dart';


import '../bloc/auth_bloc.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final mailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

final _auth = AuthBloc();

class _LoginState extends State<Login> {
  bool _obscuretext = true;
  void _toggle() {
    setState(() {
      _obscuretext = !_obscuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _auth,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSucces) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ));
          } else if (state is LoginFailed) {
            MotionToast(
                    primaryColor: Color(0xFF0BDA51),
                    title: Text(state.message),
                    description: Text(""))
                .show(context);
          }
        },
        child: Scaffold(
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
                        0xFFF50514,
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
                      cursorColor: const Color(0xFFF50514),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Color(0xFFF50514),
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
                      obscureText: _obscuretext,
                      cursorColor: const Color(0xFFF50514),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuretext
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off,color: Color(0xFFF50514),
                          ),
                          onPressed: _toggle,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFFF50514),
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
                          backgroundColor: const Color(0xFFF50514),
                        ),
                        onPressed: () => _auth.add(
                          LoginEvent(
                            Password: passwordcontroller.text,
                            email: mailcontroller.text,
                          ),
                        ),
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
        ),
      ),
    );
  }
}

//   Future signin() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: mailcontroller.text, password: passwordcontroller.text);

//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Dashboard(),
//           ));
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.code)));
//     }
//   }
// }
