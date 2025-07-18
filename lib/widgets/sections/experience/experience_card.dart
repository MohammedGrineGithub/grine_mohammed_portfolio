import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/responsive_breakpoints.dart';

class ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final List<String> descriptions;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.duration,
    required this.descriptions,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final padding = isMobile ? 20.0 : 30.0;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title,
              style: GoogleFonts.poppins(
                fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                  context,
                  mobile: 18,
                  tablet: 19,
                  desktop: 20,
                ),
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 5),
            SelectableText(
              company,
              style: GoogleFonts.poppins(
                fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                  context,
                  mobile: 14,
                  tablet: 15,
                  desktop: 16,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            SelectableText(
              duration,
              style: GoogleFonts.poppins(
                fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                  context,
                  mobile: 12,
                  tablet: 13,
                  desktop: 14,
                ),
                color: AppColors.grey600,
              ),
            ),
            SizedBox(height: 15),
            ...descriptions.map(
              (desc) => Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ), // Align dot with first line of text
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(child: _buildDescriptionText(context, desc)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionText(BuildContext context, String description) {
    // Split the description at the first colon
    final colonIndex = description.indexOf(':');
    if (colonIndex == -1) {
      // No colon found, return regular text
      return SelectableText(
        description,
        style: GoogleFonts.poppins(
          fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
            context,
            mobile: 12,
            tablet: 13,
            desktop: 14,
          ),
          height: 1.6,
          color: AppColors.grey600,
        ),
      );
    }

    // Split into title and content
    final title = "${description.substring(0, colonIndex + 1)} "; // Include the colon
    final content = description.substring(colonIndex + 1).trim();

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 12,
                tablet: 13,
                desktop: 14,
              ),
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColorOf(context),
            ),
          ),
          TextSpan(
            text: content,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                context,
                mobile: 12,
                tablet: 13,
                desktop: 14,
              ),
              height: 1.6,
              color: AppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }
}
