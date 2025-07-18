import 'package:url_launcher/url_launcher.dart';
import '../constants/app_strings.dart';
import 'dart:html' as html;

class UrlLauncherUtils {
  static void launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppStrings.email,
      query: 'subject=Hello Mohammed!',
    );
    await launchUrl(emailUri);
  }

  static void launchLinkedIn() async {
    await launchUrl(
      Uri.parse("https://www.linkedin.com/in/grine-mohammed-205b01238/"),
    );
  }

  static void launchGitHub() async {
    await launchUrl(Uri.parse("https://github.com/MohammedGrineGithub"));
  }

  static void downloadEnglishCV() {
    // For Flutter web: trigger direct download
    final url = 'assets/assets/cv/GRINE_Mohammed_CV_en.pdf';
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'GRINE_Mohammed_CV_en.pdf')
      ..click();
  }

  static void downloadFrenchCV() {
    // For Flutter web: trigger direct download
    final url = 'assets/assets/cv/GRINE_Mohammed_CV_fr.pdf';
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'GRINE_Mohammed_CV_fr.pdf')
      ..click();
  }

  static void viewCV() async {
    // Open CV in new tab for viewing
    await launchUrl(
      Uri.parse('assets/assets/cv/GRINE_Mohammed_CV_en.pdf'),
      mode: LaunchMode.externalApplication,
    );
  }
}
