import 'package:flutter/material.dart';
import 'package:task1level1/views/login.dart';

class Passwordchanged extends StatelessWidget {
  const Passwordchanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 200,height: 200,child: Image.asset('images/tru.png'),), 
            SizedBox(height: 20,),
            Align(
                      
                      child: const Text(
                        'Password Changed',
                        style:
                            TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Your password has been changed \n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tsuccessfully.',style: TextStyle(fontSize: 13,color: Colors.grey),),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(45),
                      backgroundColor: 
                           Colors.black
                          ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginScreen(),
                          ),
                        );
                    },
                    child: Text(
                      'Back to Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
         
          ],
        ),
      ),
    );
  }
}