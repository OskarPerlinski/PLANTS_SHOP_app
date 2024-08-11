// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop_app/details_page.dart';
import 'package:plant_shop_app/models.dart';
import 'package:plant_shop_app/plants_title3.dart';
import 'package:plant_shop_app/shop.dart';
import 'package:provider/provider.dart';

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  List Plantsmenu = [
    Plants(
        name: "Mae",
        price: "60.00",
        imagePath: "images/mae.png",
        raiting: "4.8"),
    Plants(
        name: "Dracaena",
        price: "25.00",
        imagePath: "images/dracaena2.png",
        raiting: "4.9"),
    Plants(
        name: "Ziggy",
        price: "20.00",
        imagePath: "images/ziggy1.png",
        raiting: "4.7"),
    Plants(
        name: "Chaz",
        price: "19.00",
        imagePath: "images/chaz.png",
        raiting: "4.9"),
    Plants(
        name: "Phoebe",
        price: "30.00",
        imagePath: "images/phoebe.png",
        raiting: "4.6"),
    Plants(
        name: "Wallace",
        price: "35.00",
        imagePath: "images/Wallace.png",
        raiting: "4.9")
  ];
  void navigateToPlantDeatails(int index) {
    final shop = context.read<Shop>();
    final Plantsmenu = shop.Plantsmenu;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(
            plants: Plantsmenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        toolbarHeight: 90,
        centerTitle: true,
        title: Text("All Plants",
            style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1250,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          child: Column(
            children: [
              Container(
                height: 1200,
                child: ListView.builder(
                  itemCount: Plantsmenu.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => PlantsTitle3(
                    plants: Plantsmenu[index],
                    onTap: () => navigateToPlantDeatails(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
