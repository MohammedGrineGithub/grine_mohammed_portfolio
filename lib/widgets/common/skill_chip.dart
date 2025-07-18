import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/responsive_breakpoints.dart';

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.skillChipBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.skillChipBorder),
      ),
      child: SelectableText(
        skill,
        style: GoogleFonts.poppins(
          fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
            context,
            mobile: 12,
            tablet: 13,
            desktop: 14,
          ),
          color: AppColors.primaryColorOf(context),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
