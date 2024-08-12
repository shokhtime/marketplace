import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/screens/itemlist_screen.dart';
import 'package:marketplace/ui/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> categories = [
    "All category",
    "Gadgets",
    "Clocthes",
    "Access",
    "Watches",
    "Phones",
  ];

  final List<String> times = [
    " 13\nHour",
    " 34\nMin",
    " 56\nSec",
  ];

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/siut.png",
      "name": "Smart watches",
      "discount": "-25%"
    },
    {
      "image": "assets/images/airpods.png",
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
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 50,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/cart.svg"),
            Gap(5.h),
            Text(
              "Brand",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff8CB7F5),
              ),
            )
          ],
        ),
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const ItemlistScreen();
                    },
                  ));
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIconColor: Colors.grey,
                  filled: true,
                  fillColor: Colors.grey[100],
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: categories.map((category) {
                    return Card(
                      margin: const EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: const Color(0xffeff2f4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category,
                          style: const TextStyle(
                            color: Color(0xff0D6EFD),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Gap(5.h),
            Container(
              width: size,
              height: 180.h,
              decoration: const BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage("assets/images/laptop.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest tranding",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Electronic items",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(20.h),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Learn more",
                          style: TextStyle(
                            color: Color(0xff0D6EFD),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deals and offers",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Electronic equipments",
                        style: GoogleFonts.inter(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: times.map((time) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 45.w,
                          height: 44.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300],
                          ),
                          child: Center(
                              child: Text(
                            time,
                            style: const TextStyle(color: Colors.grey),
                          )),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return Container(
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
                        Text(item["name"]!),
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
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Home and outdoor",
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

                  return Container(
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
                        Text(item["name"]!),
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
                  );
                },
              ),
            ),
            Container(
              width: size,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Source now",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff0D6EFD),
                      ),
                    ),
                    Gap(5.w),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      color: Color(0xff0D6EFD),
                    ),
                  ],
                ),
              ),
            ),
            Gap(10.h),
            Container(
              width: size,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[200]!,
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Consumer electronics",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
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

                  return Container(
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
                        Text(item["name"]!),
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
                  );
                },
              ),
            ),
          
          
            Container(
              width: size,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Source now",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff0D6EFD),
                      ),
                    ),
                    Gap(5.w),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      color: Color(0xff0D6EFD),
                    ),
                  ],
                ),
              ),
            ),
            Gap(10.h),
            Container(
              width: size,
              height: 150.h,
              decoration: const BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage("assets/images/laptop.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "An easy way to send\nrequests to all suppliers",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Gap(20.h),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: const Color(0xff0D6EFD),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Send inquiry",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recommended items",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset("assets/images/product_images.png"),
          ],
        ),
      ),
    );
  }
}
