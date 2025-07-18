import 'package:flutter/material.dart';
import '../../../core/constants/responsive_breakpoints.dart';
import 'hero_content.dart';
import 'profile_image.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onContactPressed;

  const HeroSection({
    super.key,
    required this.sectionKey,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Container(
      key: sectionKey,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 80,
      ),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroContent(onContactPressed: onContactPressed),
                SizedBox(height: 40),
                ProfileImage(),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: isTablet ? 1 : 2,
                  child: HeroContent(onContactPressed: onContactPressed),
                ),
                Expanded(flex: 1, child: ProfileImage()),
              ],
            ),
    );
  }
}
