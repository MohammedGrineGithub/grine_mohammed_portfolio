import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/my_dialogs.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import '../../../core/utils/url_launcher_utils.dart';
import 'contact_button.dart';

class ContactContent extends StatelessWidget {
  final VoidCallback onContactPressed;

  const ContactContent({super.key, required this.onContactPressed});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          AppStrings.letsWorkTogether,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
              context,
              mobile: 20,
              tablet: 22,
              desktop: 24,
            ),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: isMobile ? 15 : 20),
        SelectableText(
          AppStrings.contactDescription,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
              context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            height: 1.6,
            color: AppColors.grey600,
          ),
        ),
        SizedBox(height: isMobile ? 20 : 30),
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ContactButton(
                          text: AppStrings.viewCV,
                          icon: Icons.visibility,
                          onPressed: () => UrlLauncherUtils.viewCV(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ContactButton(
                          text: AppStrings.downloadCV,
                          icon: Icons.download,
                          onPressed: () => MyDialogs.showDownloadDialog(context),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: isTablet ? 15 : 20,
                    runSpacing: 10,
                    children: [
                      ContactButton(
                        text: AppStrings.viewCV,
                        icon: Icons.visibility,
                        onPressed: () => UrlLauncherUtils.viewCV(),
                      ),
                      ContactButton(
                        text: AppStrings.downloadCV,
                        icon: Icons.download,
                        onPressed: () => MyDialogs.showDownloadDialog(context),
                      ),
                    ],
                  ),
                ],
              ),
      ],
    );
  }
}
