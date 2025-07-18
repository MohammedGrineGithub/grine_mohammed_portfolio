import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/responsive_breakpoints.dart';
import 'nav_item.dart';
import 'theme_toggle.dart';
import 'mobile_menu.dart';

class NavBar extends StatelessWidget {
  final Function(GlobalKey) onNavItemPressed;
  final Map<String, GlobalKey> sectionKeys;

  const NavBar({
    super.key,
    required this.onNavItemPressed,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveBreakpoints.getResponsivePadding(context) / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(
            AppStrings.name,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 18,
                tablet: 20,
                desktop: 24,
              ),
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColorOf(context),
            ),
          ),
          if (!isMobile && !isTablet)
            Row(
              children: [
                NavItem(
                  title: AppStrings.home,
                  onPressed: () => onNavItemPressed(sectionKeys['home']!),
                ),
                NavItem(
                  title: AppStrings.about,
                  onPressed: () => onNavItemPressed(sectionKeys['about']!),
                ),
                NavItem(
                  title: AppStrings.experience,
                  onPressed: () => onNavItemPressed(sectionKeys['experience']!),
                ),
                NavItem(
                  title: AppStrings.projects,
                  onPressed: () => onNavItemPressed(sectionKeys['projects']!),
                ),
                NavItem(
                  title: AppStrings.contact,
                  onPressed: () => onNavItemPressed(sectionKeys['contact']!),
                ),
                SizedBox(width: 20),
                ThemeToggle(),
              ],
            )
          else
            Row(
              children: [
                ThemeToggle(),
                SizedBox(width: 10),
                MobileMenu(
                  sectionKeys: sectionKeys,
                  onItemSelected: (value) {
                    switch (value) {
                      case 'home':
                        onNavItemPressed(sectionKeys['home']!);
                        break;
                      case 'about':
                        onNavItemPressed(sectionKeys['about']!);
                        break;
                      case 'experience':
                        onNavItemPressed(sectionKeys['experience']!);
                        break;
                      case 'projects':
                        onNavItemPressed(sectionKeys['projects']!);
                        break;
                      case 'contact':
                        onNavItemPressed(sectionKeys['contact']!);
                        break;
                    }
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
