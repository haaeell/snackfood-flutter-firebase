import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snackfood/models/menu.dart';
import 'package:snackfood/theme.dart';
import 'package:snackfood/widgets/MenuCard.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    List<Widget> widgets = [
      SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Haloo,' + user.email!,
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Selamat datang di Snackfood',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: greyColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(64),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(64),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/thumbnail.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  'Recomended Menu',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 22),
                StreamBuilder<QuerySnapshot>(
                    stream:
                        products.orderBy('id', descending: false).snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          // ignore: unnecessary_cast
                          children: (snapshot.data! as QuerySnapshot)
                              .docs
                              .map(
                                (e) => MenuCard(
                                  Menu(
                                    id: e['id'],
                                    image: e['image'],
                                    name: e['name'],
                                    price: e['price'],
                                    pricePromo: e['pricePromo'],
                                    note: e['note'],
                                    isPromo: e['isPromo'],
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
      Center(
        child: Text('keranjang'),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.redAccent,
              child: Text(
                'LOGOUT',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          const TabItem(icon: Icons.home, title: 'Home'),
          const TabItem(icon: Icons.shopping_bag, title: 'Keranjang'),
          const TabItem(icon: Icons.person, title: 'Profil')
        ],
        backgroundColor: Colors.redAccent,
        color: Colors.white,
        height: 50,
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
