import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/url_launcher_utils.dart';
import '../../../core/constants/app_strings.dart';
import 'contact_info.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactInfo(icon: Icons.email, title: "Email", info: AppStrings.email),
        ContactInfo(icon: Icons.phone, title: "Phone", info: AppStrings.phone),
        InkWell(
          onTap: () => UrlLauncherUtils.launchLinkedIn(),
          child: ContactInfo(
            icon: Icons.work,
            title: "LinkedIn",
            info: AppStrings.linkedin,
            linkToCopy: "https://www.linkedin.com/in/grine-mohammed-205b01238/",
          ),
        ),
        InkWell(
          onTap: () => UrlLauncherUtils.launchGitHub(),
          child: ContactInfo(
            icon: Icons.code, title: "GitHub",
            info: AppStrings.github,
            linkToCopy: "https://github.com/MohammedGrineGithub",
          ),
        ),
      ],
    );
  }
}
