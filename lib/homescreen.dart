// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop_app/cart_page.dart';
import 'package:plant_shop_app/details_page.dart';
import 'package:plant_shop_app/plants_tile.dart';
import 'package:plant_shop_app/plants_title2.dart';
import 'package:plant_shop_app/shop.dart';
import 'package:plant_shop_app/viewall.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
    final shop = context.read<Shop>();
    final Plantsmenu = shop.Plantsmenu;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Choose your plants",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
                },
                child: Container(
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle:
                        const TextStyle(fontSize: 15, color: Color(0xFF676767)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF676767),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Get 32% Promo",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            padding: const EdgeInsets.all(20),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Reedem",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        "images/plants22.png",
                        height: 120,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "POPULAR",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Viewall(),
                              ));
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 300,
                    child: Container(
                      height: 1200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Plantsmenu.length,
                        itemBuilder: (context, index) => PlantsTile(
                          platns: Plantsmenu[index],
                          onTap: () => navigateToPlantDeatails(index),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "NEW",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Viewall(),
                              ));
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    height: 1150,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Plantsmenu.length,
                      itemBuilder: (context, index) => PlantsTitle2(
                        platns: Plantsmenu[index],
                        onTap: () => navigateToPlantDeatails(index),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
