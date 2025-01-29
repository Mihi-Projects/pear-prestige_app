import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class AccessoriesCollectionPage extends StatefulWidget {
  const AccessoriesCollectionPage({Key? key}) : super(key: key);

  @override
  _AccessoriesCollectionPageState createState() =>
      _AccessoriesCollectionPageState();
}

class _AccessoriesCollectionPageState extends State<AccessoriesCollectionPage> {
  int _selectedIndex = 1; // Set the default index to Accessories Collection

  final List<Map<String, dynamic>> products = const [
    {
      'id': '1',
      'name': 'Women Wallet',
      'price': 2900.00,
      'image': 'assets/images/women bag.png',
      'description': 'A stunning gold necklace for any formal occasion.',
    },
    {
      'id': '2',
      'name': 'Leather Bag',
      'price': 4580.00,
      'image': 'assets/images/blue bag.png',
      'description': 'A stylish and functional leather bag for everyday wear.',
    },
    {
      'id': '3',
      'name': 'Blue Belt',
      'price': 3600.00,
      'image': 'assets/images/blue belt.png',
      'description': 'Trendy sunglasses for sunny days.',
    },
    {
      'id': '4',
      'name': 'Brown Belt',
      'price': 5150.00,
      'image': 'assets/images/brown belt.png',
      'description': 'A luxurious silk scarf for elegant styling.',
    },
    {
      'id': '5',
      'name': 'Lilly Perfume',
      'price': 4200.00,
      'image': 'assets/images/pink sent.png',
      'description': 'Warm and stylish gloves for winter season.',
    },
    {
      'id': '6',
      'name': 'Lavendra Perfume',
      'price': 3980.00,
      'image': 'assets/images/blue sent.png',
      'description': 'Eye-catching earrings for evening events.',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on selected index
    if (index == 0) {
      // Navigate to Home screen
    } else if (index == 1) {
      // Stay on the Accessories Collection screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, theme),
      body: _buildBody(context, theme),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
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

  AppBar _buildAppBar(BuildContext context, ThemeData theme) {
    return AppBar(
      elevation: 0,
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: const Text(
        'Accessories Collection',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: theme.iconTheme.color),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon:
              Icon(Icons.shopping_cart_outlined, color: theme.iconTheme.color),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, ThemeData theme) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchBar(theme),
          _buildCategoryButtons(),
          _buildProductGrid(context, theme),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: Colors.grey, // Border color
              width: 1.0),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search Products',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon:
                Icon(Icons.search, color: Color.fromARGB(255, 198, 198, 198)),
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ['All Items', 'Necklaces', 'Bags', 'Earrings', 'Gloves']
              .map((category) => _buildCategoryButton(category))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[800],
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Text(category,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(context, theme, products[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, ThemeData theme, Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(product),
            _buildProductInfo(product, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Map<String, dynamic> product) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        child: Stack(
          children: [
            Image.asset(product['image'],
                width: double.infinity, fit: BoxFit.cover),
            Positioned(
              top: 8,
              right: 8,
              child: _buildFavoriteIcon(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteIcon() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2)),
          ]),
      child:
          const Icon(Icons.favorite_border, size: 20, color: Colors.deepOrange),
    );
  }

  Widget _buildProductInfo(Map<String, dynamic> product, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product['name'],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge!.color)),
          const SizedBox(height: 4),
          Text('\$${product['price'].toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.deepOrange)),
        ],
      ),
    );
  }
}
