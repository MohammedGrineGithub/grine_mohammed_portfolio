import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/responsive_breakpoints.dart';

class ContactInfo extends StatefulWidget {
  final IconData icon;
  final String title;
  final String info;
  final String? linkToCopy;

  const ContactInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.info,
    this.linkToCopy
  });

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  bool _copied = false;
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 15 : 20),
      child: Row(
        children: [
          Container(
            width: isMobile
                ? 40
                : isTablet
                ? 45
                : 50,
            height: isMobile
                ? 40
                : isTablet
                ? 45
                : 50,
            decoration: BoxDecoration(
              color: AppColors.skillChipBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              widget.icon,
              color: AppColors.primaryColor,
              size: isMobile
                  ? 18
                  : isTablet
                  ? 20
                  : 22,
            ),
          ),
          SizedBox(width: isMobile ? 10 : 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                      context,
                      mobile: 14,
                      tablet: 15,
                      desktop: 16,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _copied
                        ? Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.grey300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.copied,
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        ResponsiveBreakpoints.getResponsiveFontSize(
                                          context,
                                          mobile: 12,
                                          tablet: 13,
                                          desktop: 14,
                                        ),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Icon(Icons.check)
                              ],
                            ),
                          )
                        : IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(
                                  text: (widget.linkToCopy != null) ? widget.linkToCopy! : widget.info
                                ),
                              );
                              setState(() => _copied = true);
                              Future.delayed(Duration(seconds: 5), () {
                                if (mounted) setState(() => _copied = false);
                              });
                            },
                            icon: Icon(Icons.copy, color: AppColors.grey600),
                          ),
                    _copied ? const SizedBox(width: 10) : const SizedBox(),
                    Expanded(
                      child: Text(
                        widget.info,
                        style: GoogleFonts.poppins(
                          fontSize: ResponsiveBreakpoints.getResponsiveFontSize(
                            context,
                            mobile: 12,
                            tablet: 13,
                            desktop: 14,
                          ),
                          color: AppColors.grey600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
