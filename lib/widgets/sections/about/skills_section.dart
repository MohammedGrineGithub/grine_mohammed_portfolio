import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import '../../common/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkillCategory(
          AppStrings.technologiesTitle,
          AppStrings.technologies,
        ),
        _buildSkillCategory(
          AppStrings.stateManagementTitle,
          AppStrings.stateManagement,
        ),
        _buildSkillCategory(AppStrings.databasesTitle, AppStrings.databases),
        _buildSkillCategory(
          AppStrings.baasPlatformsTitle,
          AppStrings.baasTools,
        ),
        _buildSkillCategory(AppStrings.deploymentTitle, AppStrings.deployment),
        _buildSkillCategory(AppStrings.toolsTitle, AppStrings.tools),
        _buildSkillCategory(
          AppStrings.otherSkillsTitle,
          AppStrings.otherSkills,
        ),
      ],
    );
  }

  Widget _buildSkillCategory(String title, List<String> skills) {
    return Builder(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            title,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 16,
                tablet: 17,
                desktop: 18,
              ),
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) => SkillChip(skill: skill)).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
