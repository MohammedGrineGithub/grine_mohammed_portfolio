import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import '../../common/section_title.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveBreakpoints.getResponsivePadding(context);

    return Container(
      key: sectionKey,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: AppStrings.personalProjectsTitle),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 20,
                children: [
                  Expanded(
                    child: ProjectCard(
                      title: AppStrings.remindMeTitle,
                      description: AppStrings.remindMeDescription,
                      imagePath: 'assets/images/remindme.png',
                      color: AppColors.orange,
                    ),
                  ),
                  Expanded(
                    child: ProjectCard(
                      title: AppStrings.maklaExpressTitle,
                      description: AppStrings.maklaExpressDescription,
                      imagePath: 'assets/images/maklaexpress.png',
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 20,
                children: [
                  Expanded(
                    child: ProjectCard(
                      title: AppStrings.nrohoTitle,
                      description: AppStrings.nrohoDescription,
                      imagePath: 'assets/images/nroho.png',
                      color: AppColors.green,
                    ),
                  ),
                  Expanded(
                    child: ProjectCard(
                      title: AppStrings.yallaBinaTitle,
                      description: AppStrings.yallaBinaDescription,
                      imagePath: 'assets/images/yallabina.png',
                      color: AppColors.purple,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 20,
                children: [
                  Expanded(
                    child: ProjectCard(
                      title: AppStrings.oilSurveyTitle,
                      description: AppStrings.oilSurveyDescription,
                      imagePath: 'assets/images/oilsurvery.png',
                      color: AppColors.brown,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink())
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
