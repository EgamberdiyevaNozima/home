import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/category_button.dart';
import '../widgets/property_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:  CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
               SizedBox(height: 20),
              _buildActionButtons(),
               SizedBox(height: 24),
              _buildRecommendedHeader(),
               SizedBox(height: 12),
              _buildPropertyGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/room.png', height: 32),
         Icon(Icons.notifications_none),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        CategoryButton(icon: 'assets/icons/key.svg', label: 'Покупка'),
        CategoryButton(icon: 'assets/icons/check.svg', label: 'Продажа'),
        CategoryButton(icon: 'assets/icons/time.svg', label: 'Аренда'),
        CategoryButton(icon: 'assets/icons/building.svg', label: 'Сдать'),
      ],
    );
  }

  Widget _buildRecommendedHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          'Рекомендуемые',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'Смотреть все',
          style: TextStyle(color: Colors.orange),
        ),
      ],
    );
  }

  Widget _buildPropertyGrid() {
    return Expanded(
      child: GridView.builder(
        itemCount: 4,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return  PropertyCard();
        },
      ),
    );
  }
}
