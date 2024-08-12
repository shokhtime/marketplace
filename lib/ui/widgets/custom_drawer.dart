import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/screens/home_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 35,
                  child: Icon(
                    CupertinoIcons.person_alt,
                    color: Colors.grey,
                    size: 50.sp,
                  ),
                ),
                Gap(10.h),
                Text(
                  'Sign in | Register',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('Home', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_open),
            title: Text('Categories', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: Text('Favorites', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.inventory_2_outlined),
            title: Text('My orders', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('English | USD', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.headset_mic_outlined),
            title: Text('Contact us', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: Text('About', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Text(""),
            title: Text('User agreement', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          ListTile(
            leading: const Text(""),
            title: Text('Partnership', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
          ListTile(
            leading: const Text(""),
            title: Text('Privacy policy', style: GoogleFonts.montserrat()),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
