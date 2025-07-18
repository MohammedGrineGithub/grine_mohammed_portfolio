import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';

class MobileMenu extends StatelessWidget {
  final Function(String) onItemSelected;
  final Map<String, GlobalKey> sectionKeys;

  const MobileMenu({
    super.key,
    required this.onItemSelected,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu),
      onSelected: onItemSelected,
      itemBuilder: (context) => [
        PopupMenuItem(value: 'home', child: Text(AppStrings.home)),
        PopupMenuItem(value: 'about', child: Text(AppStrings.about)),
        PopupMenuItem(
          value: 'experience',
          child: Text(AppStrings.experience),
        ),
        PopupMenuItem(
          value: 'projects',
          child: Text(AppStrings.projects),
        ),
        PopupMenuItem(
          value: 'contact',
          child: Text(AppStrings.contact),
        ),
      ],
    );
  }
}
