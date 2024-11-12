import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1level1/views/otpscreen.dart';
import 'package:task1level1/views/passwordchanged.dart';

class Changepass extends StatefulWidget {
  Changepass({super.key});

  @override
  State<Changepass> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<Changepass> {
  bool clrButten = false;
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  
  final key = GlobalKey<FormState>();
  late String password;
  late String confirm_password;

  // To toggle password visibility
  bool obscureText = false;
  bool obscureText2 = false;

  TextEditingController emailControler = TextEditingController();

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: key,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 30),
                // Title Section
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create New Password',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Instruction Text
                Text(
                  'Your new password must be unique from those\n previously used.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 30),
                // Email TextField
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    onSaved: (value) {
                      print('saved pass $value');
                      password = value ?? '';
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
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    onSaved: (value) {
                      print('saved pass $value');
                      confirm_password = value ?? '';
                    },

                    // Attach controller
                    obscureText:
                        obscureText2, // Hide or show password based on state
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon:
                          const Icon(Icons.lock_rounded, color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText2
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText2 =
                                !obscureText2; // Toggle password visibility
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "You must enter your pass";
                      } else if (value.length < 8) {
                        return "u must enter at least 8 char";
                      } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$')
                          .hasMatch(value)) {
                        return "a password that must contain both letters and numbers";
                      } else if (password != value) {
                        return "Password does not match";
                      }

                      return null;
                    },
                  ),

                SizedBox(height: 40),
                // Send Code Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(45),
                    backgroundColor: clrButten
                        ? Colors.black
                        : Colors.black.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    
                      if (key.currentState!.validate()) {
                        key.currentState!.save();
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Passwordchanged(),
                        ),
                      );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    
                  },
                  child: Text(
                    'Rest Password',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class FormValidator {
  

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
