import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import 'hero_buttons.dart';

class HeroContent extends StatelessWidget {
  final VoidCallback onContactPressed;

  const HeroContent({super.key, required this.onContactPressed});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final padding = ResponsiveBreakpoints.getResponsivePadding(context);

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          SelectableText(
            "Hi, I'm",
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 16,
                tablet: 20,
                desktop: 24,
              ),
              color: AppColors.grey600,
            ),
          ),
          SizedBox(height: 10),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                AppStrings.name,
                textStyle: GoogleFonts.poppins(
                  fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                    context,
                    mobile: 28,
                    tablet: 36,
                    desktop: 48,
                  ),
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                speed: Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 2,
          ),
          SizedBox(height: 20),
          SelectableText(
            AppStrings.title,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 18,
                tablet: 24,
                desktop: 32,
              ),
              fontWeight: FontWeight.w600,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          SizedBox(height: 10),
          SelectableText(
            AppStrings.experienceSubtitle,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
              color: AppColors.grey600,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          SizedBox(height: 10),
          SelectableText(
            AppStrings.subtitle,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 20,
              ),
              color: AppColors.grey600,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          SizedBox(height: 40),
          HeroButtons(onContactPressed: onContactPressed),
        ],
      ),
    );
  }
}
