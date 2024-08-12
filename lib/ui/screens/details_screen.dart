import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/screens/cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<Map<String, String>> items = [
    {
      "image": "assets/images/bitmap.png",
      "name": "T-shirts with multiple colors\nfor men",
      "discount": "-25%"
    },
    {
      "image": "assets/images/watch.png",
      "name": "Headphones",
      "discount": "-15%"
    },
    {
      "image": "assets/images/laptops.png",
      "name": "Smartphones",
      "discount": "-10%"
    },
    {
      "image": "assets/images/iphone.png",
      "name": "Laptops",
      "discount": "-5%",
    },
    {
      "image": "assets/images/siut.png",
      "name": "Tablets",
      "discount": "-20%",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size,
              height: 305.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bag.png"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const CartScreen();
                  },
                ));
              },
              child: Image.asset("assets/images/details_information.png"),
            ),
            Gap(10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/supplier.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Similar products",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return const DetailsScreen();
                        },
                      ));
                    },
                    child: Container(
                      width: 140.w,
                      height: 180.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 76.w,
                            height: 83.h,
                            child: Image.asset(item["image"].toString()),
                          ),
                          Text(
                            item["name"]!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          Gap(5.h),
                          Card(
                            color: const Color(0xffFFE3E3),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Text(item["discount"]!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
