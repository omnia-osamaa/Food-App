import 'package:digitalmenu/Home/Cart.dart';
import 'package:digitalmenu/Home/Fav.dart';
import 'package:digitalmenu/Home/Home.dart';
import 'package:digitalmenu/LoginScreens/LoginScreen.dart';
import 'package:digitalmenu/MenuBar/AboutUs.dart';
import 'package:digitalmenu/MenuBar/Notification.dart';
import 'package:digitalmenu/MenuBar/PaymentDet.dart';
import 'package:digitalmenu/MenuBar/Privacy.dart';
import 'package:digitalmenu/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digitalmenu/Common/Color.dart';
import 'package:digitalmenu/Model/FoodModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Food> favoriteFoods = [];
  int? selectedCategoryIndex;
  String? selectedCategory;

  void toggleFavorite(Food food) {
    setState(() {
      if (favoriteFoods.contains(food)) {
        favoriteFoods.remove(food);
      } else {
        favoriteFoods.add(food);
      }
    });
  }

  void selectCategory(int index, String? category) {
    setState(() {
      selectedCategoryIndex = index;
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeTab(
        favoriteFoods: favoriteFoods,
        onToggleFavorite: toggleFavorite,
        selectedCategoryIndex: selectedCategoryIndex,
        selectedCategory: selectedCategory,
        onCategorySelected: selectCategory,
      ),
      CartScreen(
        cartItems: [],
        onRemoveFromCart: (Food) {},
      ),
      FavoriteTab(
        favoriteFoods: favoriteFoods,
        onToggleFavorite: toggleFavorite,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
          child: Row(
            children: [
              const Text("Shrimp Zone",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif')),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileAndMoreView(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/img/Profile.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: bg,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: primary,
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 16.0, bottom: 20.0),
                child: const Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.info, color: primary),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsView(),
                    ),
                  );
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.notification_add_rounded, color: primary),
                title: const Text('Notifications'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsView(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment_outlined, color: primary),
                title: const Text('Payment'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentDetailsView(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip, color: primary),
                title: const Text('Privacy Policy'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyView(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: primary),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        height: 57.0,
        backgroundColor: Colors.transparent,
        color: primary,
        buttonBackgroundColor: primary,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.favorite_border, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}
