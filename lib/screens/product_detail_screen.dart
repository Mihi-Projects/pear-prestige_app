import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = 'M';
  int quantity = 1;
  Color selectedColor = Colors.black;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: isFavorite
                  ? Colors.deepOrange[800]
                  : (isDarkMode ? Colors.grey[400] : Colors.grey[400]),
            ),
            onPressed: () => setState(() => isFavorite = !isFavorite),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined,
                color: isDarkMode ? Colors.white : Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductInfo(isDarkMode),
                  const SizedBox(height: 24),
                  _buildSizeSelector(isDarkMode),
                  const SizedBox(height: 24),
                  _buildDescription(isDarkMode),
                  const SizedBox(height: 24),
                  _buildAddToBagButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Image.asset(
        widget.product['image'],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductInfo(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product['name'],
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '\$${widget.product['price'].toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange[800],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '\$${(widget.product['price'] * 1.2).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.grey[600] : Colors.grey[500],
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeSelector(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: ['XS', 'S', 'M', 'L', 'XL'].map((size) {
            final isSelected = selectedSize == size;
            return Container(
              margin: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () => setState(() => selectedSize = size),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? (isDarkMode ? Colors.white : Colors.black)
                        : (isDarkMode ? Colors.grey[800] : Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isSelected
                          ? Colors.deepOrange[800]!
                          : (isDarkMode
                              ? Colors.grey[700]!
                              : Colors.grey[300]!),
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.deepOrange[800]!.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      size,
                      style: TextStyle(
                        color: isSelected
                            ? (isDarkMode ? Colors.black : Colors.white)
                            : (isDarkMode ? Colors.white : Colors.grey[800]),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDescription(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.product['description'] ?? 'No description available.',
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildAddToBagButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange[800]!.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Add to Cart',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
