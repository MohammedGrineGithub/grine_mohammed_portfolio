import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          AppStrings.aboutMeFirstParagraph,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
              context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            height: 1.8,
            color: AppColors.grey600,
          ),
        ),
        SizedBox(height: 20),
        SelectableText(
          AppStrings.aboutMeSecondParagraph,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
              context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            height: 1.8,
            color: AppColors.grey600,
          ),
        ),
        SizedBox(height: 20),
        SelectableText(
          AppStrings.aboutMeThirdParagraph,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
              context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            height: 1.8,
            color: AppColors.grey600,
          ),
        ),
      ],
    );
  }
}
