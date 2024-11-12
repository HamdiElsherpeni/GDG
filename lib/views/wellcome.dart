import 'package:flutter/material.dart';
import 'package:task1level1/views/login.dart';
import 'package:task1level1/views/register.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Image(
              image: AssetImage('images/image task1level1.png'),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 380,
                ),
                Container(
                    height: 120,
                    width: 250,
                    child: Image.asset('images/logo.png')),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 310,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 310,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );},
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cotinue as a guset',
                      style: TextStyle(
                          color: Colors.teal,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.teal),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
