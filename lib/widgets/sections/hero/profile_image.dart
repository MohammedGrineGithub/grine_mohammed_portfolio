import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/responsive_breakpoints.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    double imageSize;
    if (isMobile) {
      imageSize = 200;
    } else if (isTablet) {
      imageSize = 250;
    } else {
      imageSize = 350;
    }

    return Center(
      child: Container(
        width: imageSize,
        height: imageSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [AppColors.primaryColorOf(context), Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.blueShadowColor,
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8), // Border thickness
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile.jpg',
              width: imageSize - 16,
              height: imageSize - 16,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to icon if image fails to load
                return Container(
                  width: imageSize - 16,
                  height: imageSize - 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey300,
                  ),
                  child: Icon(
                    Icons.person,
                    size: (imageSize - 16) * 0.5,
                    color: AppColors.grey600,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
