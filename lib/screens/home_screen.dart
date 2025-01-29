import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'women_collection_page.dart';
import 'men_collection_page.dart';
import 'accessories_collection_page.dart';
import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'name': 'Monogram Silk',
      'price': 2900.00,
      'image': 'assets/images/Wimg01.png'
    },
    {
      'id': '2',
      'name': 'Tuxedo Jacket',
      'price': 5970.00,
      'image': 'assets/images/Mimg01.png'
    },
    {
      'id': '3',
      'name': 'Leather Tracksuit',
      'price': 3700.00,
      'image': 'assets/images/Mimg02.png'
    },
    {
      'id': '4',
      'name': 'Ruffle Dress',
      'price': 4580.00,
      'image': 'assets/images/Wimg02.png'
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {'name': 'Women', 'image': 'assets/images/WE01.png'},
    {'name': 'Men', 'image': 'assets/images/M01.png'},
    {'name': 'Accessories', 'image': 'assets/images/AC01.png'},
    {'name': 'New Arrivals', 'image': 'assets/images/NEW01.png'},
  ];

  void _navigateToCategoryPage(String categoryName) {
    if (categoryName == 'Women') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WomenCollectionPage()));
    } else if (categoryName == 'Men') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MenCollectionPage()));
    } else if (categoryName == 'Accessories') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AccessoriesCollectionPage()));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on selected index
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else if (index == 1) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WomenCollectionPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Pearl & Prestige',
            style: TextStyle(
                color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        actions: [
          IconButton(
              icon:
                  Icon(Icons.search, color: Theme.of(context).iconTheme.color),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.person_rounded,
                  color: Theme.of(context).iconTheme.color),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTrendingOffer(),
            _buildCategorySection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Arrivals',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color)),
                  TextButton(
                      onPressed: () {},
                      child: Text('View All',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w600))),
                ],
              ),
            ),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTrendingOffer() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5))
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/images/BG0.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Text('Shop Now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => _navigateToCategoryPage(category['name']),
            child: Container(
              width: 100,
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4))
                      ],
                    ),
                    child: ClipOval(
                        child: Image.asset(category['image'],
                            width: 70, height: 70, fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 8),
                  Text(category['name'],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.bodyLarge?.color),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: product)));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Image.asset(product['image'],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['name'],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Text('\$${product['price']}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
