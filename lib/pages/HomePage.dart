import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snackfood/models/menu.dart';
import 'package:snackfood/pages/KeranjangPage.dart';
import 'package:snackfood/pages/ProfilPage.dart';
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
              vertical: 22,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Haloo,',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),
                    Image.asset(
                      'assets/icon.png',
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
                Text(user.email!),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Mau makan apa hari ini?',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: blackColor,
                        ),
                      ),
                    ],
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
                    child: Image.network(
                      'https://assets.materialup.com/uploads/45b248c8-e813-4437-8e76-3e54d8621933/preview.jpg',
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
      Keranjangpage(),
      Profilpage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: redCollor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SnackFood'),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_off_outlined),
            )
          ],
        ),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          const TabItem(icon: Icons.home, title: 'Home'),
          const TabItem(icon: Icons.shopping_bag, title: 'Keranjang'),
          const TabItem(icon: Icons.person, title: 'Profil')
        ],
        backgroundColor: redCollor,
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
