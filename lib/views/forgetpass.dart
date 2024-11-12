import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1level1/views/otpscreen.dart';

class ForgetScreen extends StatefulWidget {
  ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  bool clrButten = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final key = GlobalKey<FormState>();
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
              side: const BorderSide(width: 0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(90, 90),
            )),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: key,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 30),
                // Title Section
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Instruction Text
                Text(
                  'Please enter your email address. You will receive a link to reset your password via email.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 30),
                // Email TextField
                TextFormField(
                  controller: emailControler,
                  onChanged: (val) {
                    if (val != '') {
                      setState(() {
                        clrButten = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    prefixIcon: const Icon(Icons.email, color: Colors.black),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          emailControler.clear();
                        });
                      },
                      child: const Icon(
                        CupertinoIcons.multiply,
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "You must enter your email";
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return "You must enter vaild email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                // Send Code Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(45),
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
                          builder: (context) => Otpscreen(),
                        ),
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                  child: const Text(
                    'Send Code',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                // OR Divider
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Remember password?'),
                        TextButton(
                          onPressed: () {
                            // You can navigate to the OTP screen here
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
