import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/responsive_breakpoints.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          title,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
              context,
              mobile: 24,
              tablet: 30,
              desktop: 36,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isMobile ? 8 : 10),
        Container(
          width: isMobile
              ? 60
              : isTablet
              ? 80
              : 100,
          height: isMobile ? 3 : 4,
          decoration: BoxDecoration(
            color: AppColors.primaryColorOf(context),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
