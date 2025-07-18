import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import '../../common/section_title.dart';
import 'contact_content.dart';
import 'contact_info_section.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onContactPressed;

  const ContactSection({
    super.key,
    required this.sectionKey,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);
    final padding = ResponsiveBreakpoints.getResponsivePadding(context);

    return Container(
      key: sectionKey,
      padding: EdgeInsets.all(padding),
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.grey900
          : AppColors.grey50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: AppStrings.getInTouchTitle),
          SizedBox(height: isMobile ? 30 : 40),
          isMobile
              ? Column(
                  children: [
                    ContactContent(onContactPressed: onContactPressed),
                    SizedBox(height: 30),
                    ContactInfoSection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ContactContent(onContactPressed: onContactPressed),
                    ),
                    SizedBox(width: isTablet ? 30 : 50),
                    Expanded(child: ContactInfoSection()),
                  ],
                ),
        ],
      ),
    );
  }
}
