import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MyFunctions {
  static String localDateFormat(DateTime date,
      {String format = "dd.MM.yyyy HH:mm"}) {
    return DateFormat(format).format(date);
  }

  static String parseAndFormatDate(String dateString,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss",
      String outputFormat = "dd.MM.yyyy HH:mm"}) {
    try {
      final inputFormatter = DateFormat(inputFormat);
      final dateTime = inputFormatter.parse(dateString);

      final outputFormatter = DateFormat(outputFormat);
      return outputFormatter.format(dateTime);
    } catch (e) {
      return 'Invalid date format';
    }
  }

  static String getPhone(text) {
    return text
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", "");
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length != 9) {
      throw const FormatException(
          "Phone number should be exactly 9 digits long");
    }

    String areaCode = phoneNumber.substring(0, 2);
    String part1 = phoneNumber.substring(2, 5);
    String part2 = phoneNumber.substring(5, 7);
    String part3 = phoneNumber.substring(7, 9);

    return '($areaCode) $part1-$part2-$part3';
  }

  // Function to dial a phone number
  static dialPhoneNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } on PlatformException catch (e) {
      // Handle exception if the device cannot handle the dialer
      debugPrint('Error launching dialer: $e');
    }
  }

  static launchMyUrl(String url) async {
    final Uri launchUri = Uri(
      path: url,
    );
    try {
      await launchUrl(launchUri);
    } on PlatformException catch (e) {
      // Handle exception if the device cannot handle the dialer
      debugPrint('Error launching : $e');
    }
  }

  static lauchMapOnIOS(
      BuildContext context, double latitude, double longitude) async {
    try {
      final url = Uri.parse('maps:$latitude,$longitude?q=$latitude,$longitude');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (error) {
      if (context.mounted) {
        // Util.showErrorDialog(context: context, error: error.toString());
      }
    }
  }

  static launchMapOnAndroid(
      BuildContext context, double latitude, double longitude) async {
    try {
      const String markerLabel = 'Here';
      final url = Uri.parse(
          'geo:$latitude,$longitude?q=$latitude,$longitude($markerLabel)');
      await launchUrl(url);
    } catch (error) {
      if (context.mounted) {
        // Util.showErrorDialog(context: context, error: error.toString());
      }
    }
  }

  // Function to share information
  static onShareTap(String content) {
    Share.share(content);
  }

  static Future<void> shareImageAndTitle(
      {String? imageUrl, required String title}) async {
    try {
      final cachedFile = await DefaultCacheManager().getSingleFile(imageUrl ?? '');

      if (cachedFile.existsSync()) {
        await Share.shareXFiles(
          [XFile(cachedFile.path)],
          text: title,
        );
      } else {
        debugPrint('No cached image found.');
      }
    } catch (e) {
      debugPrint('Error sharing cached image: $e');
    }
  }
}
