import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/screens/details_screen.dart';

class ItemlistScreen extends StatefulWidget {
  const ItemlistScreen({super.key});

  @override
  State<ItemlistScreen> createState() => _ItemlistScreenState();
}

class _ItemlistScreenState extends State<ItemlistScreen> {
  final List<String> categories = [
    "Tablets",
    "Phones",
    "Ipads",
    "Ipod",
    "Jackaets",
    "Phones",
  ];

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/bag.png",
      "name": "Smart watches",
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text(
          "Mobile accessory ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
            Image.asset("assets/images/filter.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 32,
                child: Image.asset("assets/images/model.png"),
              ),
            ),
            Image.asset("assets/images/itemlist_images.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You may also like",
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
