import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import '../../common/section_title.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ExperienceSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
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
          SectionTitle(title: AppStrings.professionalExperienceTitle),
          SizedBox(height: 40),
          ExperienceCard(
            title: AppStrings.fullStackMobileDeveloper,
            company: AppStrings.freelancer,
            duration: AppStrings.dec2024Present,
            descriptions: AppStrings.freelancerDescriptions,
          ),
          SizedBox(height: 30),
          ExperienceCard(
            title: AppStrings.backendDeveloperIntern,
            company: AppStrings.maystoDelivery,
            duration: AppStrings.july2024Nov2024,
            descriptions: AppStrings.maystoDescriptions,
          ),
          SizedBox(height: 30),
          ExperienceCard(
            title: AppStrings.flutterDeveloper,
            company: AppStrings.projilicStartup,
            duration: AppStrings.summer2022,
            descriptions: AppStrings.projilicDescriptions,
          ),
          SizedBox(height: 30),
          ExperienceCard(
            title: AppStrings.discoveryInternship,
            company: AppStrings.algerieTelecom,
            duration: AppStrings.week2021,
            descriptions: AppStrings.algerieTelecomDescriptions,
          ),
        ],
      ),
    );
  }
}
