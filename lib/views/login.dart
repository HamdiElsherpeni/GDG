import 'package:flutter/material.dart';
import 'package:task1level1/views/forgetpass.dart';
import 'package:task1level1/views/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers to track the input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final Key = GlobalKey<FormState>();
  late String password;

  // To toggle password visibility
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined),
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(90, 90),
            )),
      )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: Key,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 100),
                  // Styled Image Container
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Wellcome back! Glad\n to see you, Again!',
                      style:
                          TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Email TextField
                  TextFormField(
                    controller: emailController, // Attach controller
                    keyboardType: TextInputType
                        .emailAddress, // Set keyboard type to email
                    autofillHints: const [
                      AutofillHints.email
                    ], // Enable auto-fill for email
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                      prefixIcon: const Icon(Icons.email, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: FormValidator.validateEmail,
                  ),
                  const SizedBox(height: 20),
                  // Password TextField
                  TextFormField(
                    onChanged: (value) {
                      print('the pass = $value');
                    },
                    onSaved: (value) {
                      print('saved pass $value');
                      password = value ?? '';
                    },
                    onFieldSubmitted: (value) {
                      print('Submet = $value');
                    },
                    controller: passwordController, // Attach controller
                    obscureText:
                        obscureText, // Hide or show password based on state
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon:
                          const Icon(Icons.lock_rounded, color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText =
                                !obscureText; // Toggle password visibility
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: FormValidator.validatePass,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetScreen(),
                        ),
                      );},
                      child: const Text(
                        'Forget Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Login Button
                 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Check if fields are empty
                      if (Key.currentState!.validate()) {
                        
                        Key.currentState!.save();
                        debugPrint(password);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        "Other Long whith",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.g_mobiledata,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.apple,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't Have an Account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
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

class FormValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "You must enter your email";
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return "You must enter vaild email";
    }
    return null;
  }

  static String? validatePass(String? value) {
    if (value == null || value.isEmpty) {
      return "You must enter your pass";
    } else if (value.length < 8) {
      return "u must enter at least 8 char";
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$')
        .hasMatch(value)) {
      return "a password that must contain both letters and numbers";
    }
    return null;
  }
}
