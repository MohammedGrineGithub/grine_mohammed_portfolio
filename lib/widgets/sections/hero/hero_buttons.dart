import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/my_dialogs.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive_breakpoints.dart';

class HeroButtons extends StatelessWidget {
  final VoidCallback onContactPressed;

  const HeroButtons({super.key, required this.onContactPressed});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    return isMobile
        ? Column(
            children: [
              _buildHeroButton(
                context,
                AppStrings.downloadCV,
                Icons.download,
                () => MyDialogs.showDownloadDialog(context),
              ),
              SizedBox(height: 15),
              _buildHeroButton(
                context,
                AppStrings.contactMe,
                Icons.email,
                onContactPressed,
              ),
            ],
          )
        : Wrap(
            spacing: 20,
            runSpacing: 15,
            children: [
              _buildHeroButton(
                context,
                AppStrings.downloadCV,
                Icons.download,
                () => MyDialogs.showDownloadDialog(context),
              ),
              _buildHeroButton(
                context,
                AppStrings.contactMe,
                Icons.email,
                onContactPressed,
              ),
            ],
          );
  }

  Widget _buildHeroButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColorOf(context),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
