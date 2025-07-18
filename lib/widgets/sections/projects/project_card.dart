import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/responsive_breakpoints.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color color;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(
          isMobile
              ? 15
              : isTablet
              ? 18
              : 20,
        ), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: isMobile
                  ? 45
                  : isTablet
                  ? 50
                  : 55, // Reduced size
              height: isMobile
                  ? 45
                  : isTablet
                  ? 50
                  : 55, // Reduced size
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12), // Reduced radius
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: isMobile
                      ? 35
                      : isTablet
                      ? 40
                      : 45,
                  height: isMobile
                      ? 35
                      : isTablet
                      ? 40
                      : 45,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to icon if image fails to load
                    return Icon(
                      Icons.apps,
                      size: isMobile
                          ? 20
                          : isTablet
                          ? 22
                          : 25,
                      color: color,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: isMobile ? 12 : 15), // Reduced spacing
            SelectableText(
              title,
              style: GoogleFonts.poppins(
                fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                  context,
                  mobile: 15,
                  tablet: 16,
                  desktop: 17,
                ),
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: isMobile ? 6 : 8), // Reduced spacing
            SelectableText(
              description,
              style: GoogleFonts.poppins(
                fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                  context,
                  mobile: 11,
                  tablet: 12,
                  desktop: 14,
                ),
                height: 1.4, // Reduced line height
                color: Colors.grey[600],
              ),
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
