import 'package:flutter/material.dart';

class AppConstant {
  static const String defaultDayNumber = '30';
  static const String emptyData = 'Không có dữ liệu';
  static const String formatDate12h = "hh:mm";
  static const String formatDateYMD = "yyyy.MM.dd";
  static const String formatDateYMDhm = "yyyy-MM-dd hh:mm a";
  static const String idGroup = '01';

  static String historyNotification = 'history_notification';

  static List<IconStatus> iconBottomBars = [
    IconStatus(active: Icons.home, inactive: Icons.home),
    IconStatus(active: Icons.chat, inactive: Icons.chat),
    IconStatus(active: Icons.notifications, inactive: Icons.notifications),
    IconStatus(active: Icons.person, inactive: Icons.person),
  ];

  static List<String> listExtensionMultiFile = [
    '.png',
    '.jpg',
    '.PNG',
    '.JPG',
    '.JPEG',
    '.jpeg',
    '.HEIC',
    '.mp3',
    '.mp4',
    '.MP3',
    '.MP4'
  ];

  static int documentFileMax = 3;
  static int sizeDocumentFileMax = 5;

  static int imageFileMax = 10;
  static int sizeImageFileMax = 2;

  static int imageVideoMax = 1;
  static int sizeVideoMax = 20;

}

class IconStatus {
  IconData? active;
  IconData? inactive;

  IconStatus({
    this.active,
    this.inactive,
  });
}
