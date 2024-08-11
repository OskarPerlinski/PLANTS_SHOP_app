import 'package:flutter/material.dart';
import 'package:plant_shop_app/login.dart';
import 'package:plant_shop_app/signup.dart';

class Loginoption extends StatefulWidget {
  const Loginoption({super.key});

  @override
  State<Loginoption> createState() => _LoginoptionState();
}

class _LoginoptionState extends State<Loginoption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Container(
        padding:
            const EdgeInsets.only(top: 150, bottom: 90, left: 30, right: 30),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "images/plantsbg.png",
                width: 400,
                height: 400,
              ),
              const SizedBox(
                height: 30,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ));
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
