// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop_app/models.dart';

class PlantsTitle3 extends StatelessWidget {
  final Plants plants;
  final void Function()? onTap;

  const PlantsTitle3({super.key, required this.plants, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3),
              ),
            ]),
        margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        padding: const EdgeInsets.all(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              plants.imagePath,
              height: 120,
            ),
            const SizedBox(
              width: 50,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    plants.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                  ),
                  Text(
                    "\$" + plants.price,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        plants.raiting,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
