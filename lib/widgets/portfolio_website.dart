import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import 'navigation/nav_bar.dart';
import 'sections/hero/hero_section.dart';
import 'sections/about/about_section.dart';
import 'sections/experience/experience_section.dart';
import 'sections/projects/projects_section.dart';
import 'sections/contact/contact_section.dart';

class PortfolioWebsite extends StatefulWidget {
  const PortfolioWebsite({super.key});

  @override
  State<PortfolioWebsite> createState() => _PortfolioWebsiteState();
}

class _PortfolioWebsiteState extends State<PortfolioWebsite> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Map<String, GlobalKey> get sectionKeys => {
    'home': _homeKey,
    'about': _aboutKey,
    'experience': _experienceKey,
    'projects': _projectsKey,
    'contact': _contactKey,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(onNavItemPressed: _scrollToSection, sectionKeys: sectionKeys),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    sectionKey: _homeKey,
                    onContactPressed: () => _scrollToSection(_contactKey),
                  ),
                  AboutSection(sectionKey: _aboutKey),
                  ExperienceSection(sectionKey: _experienceKey),
                  ProjectsSection(sectionKey: _projectsKey),
                  ContactSection(
                    sectionKey: _contactKey,
                    onContactPressed: () => _scrollToSection(_contactKey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scrollToSection(_homeKey),
        backgroundColor: AppColors.primaryColorOf(context),
        tooltip: 'Back to top',
        child: Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}
