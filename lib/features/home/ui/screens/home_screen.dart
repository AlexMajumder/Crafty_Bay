import 'package:crafty_bay/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/product_search_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:   SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              ProductSearchBar(searchTEController: _searchBarController ,),
            ],

          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions:  [
        AppBerIconButton(icon: Icons.person_outline, onTap:(){},),
        const SizedBox(width: 6,),
        AppBerIconButton(icon: Icons.call, onTap:(){},),
        const SizedBox(width: 6,),
        AppBerIconButton(icon: Icons.notifications, onTap:(){},),
        const SizedBox(width: 6,),

      ],
    );
  }
}



