// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcont = TextEditingController();
    forgotpassword(String email) async {
      if (email == "") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Enter your email address to reset your password",
        )));
      } else {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email sent Successfully!")));
      }
    }

    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text(
          "Reset Password",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: emailcont,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(40)),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        color: Colors.black38,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    forgotpassword(emailcont.text.toString());
                  },
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
