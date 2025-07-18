import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import '../../common/section_title.dart';
import 'about_content.dart';
import 'skills_section.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final padding = ResponsiveBreakpoints.getResponsivePadding(context);

    return Container(
      key: sectionKey,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: AppStrings.aboutMeTitle),
          SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    AboutContent(),
                    SizedBox(height: 40),
                    SkillsSection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: AboutContent()),
                    SizedBox(width: 50),
                    Expanded(flex: 2, child: SkillsSection()),
                  ],
                ),
        ],
      ),
    );
  }
}
