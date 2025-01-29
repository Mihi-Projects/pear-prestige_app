import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecom_app/main.dart';

void main() {
  testWidgets(
      'HomeScreen displays products and navigates to ProductDetailScreen',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the HomeScreen displays the app bar title.
    expect(find.text('Fashion Store'), findsOneWidget);

    // Verify that the HomeScreen displays at least one product.
    expect(find.text('Red Shirt'), findsOneWidget);
    expect(find.text('Blue Jeans'), findsOneWidget);
    expect(find.text('Black Dress'), findsOneWidget);

    // Tap on the first product (Red Shirt).
    await tester.tap(find.text('Red Shirt'));
    await tester.pumpAndSettle(); // Wait for navigation to complete.

    // Verify that the ProductDetailScreen is displayed with the correct product details.
    expect(
        find.text('Red Shirt'), findsOneWidget); // Product name in the app bar.
    expect(find.text('\$29.99'), findsOneWidget); // Product price.
    expect(
        find.text('This is a beautiful Red Shirt. Perfect for any occasion!'),
        findsOneWidget); // Product description.
  });
}
