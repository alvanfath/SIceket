import 'dart:ui';

class Constants {
  Constants._();
  static Constants get = Constants._();

  String appName = 'Smart Finance';

  String errorTitle504 = 'Koneksi Terputus';
  String errorSubtitle504 =
      'Ups! Sepertinya koneksi internet Anda terputus. Periksa jaringan dan coba lagi.';

  String errorTitleGeneral = 'Sepertinya terjadi kesalahan';

  String errorSubtitleGeneral = 'Mohon maaf sepertinya ada kesalahan teknis';

  String errorTitle500 = 'Sedang dalam gangguan';
  String errorSubtitle500 =
      'Maaf, aplikasi sedang sedikit bermasalah. Kami sedang berusaha memperbaikinya dan akan segera kembali normal.';
  Color primaryColor = const Color(0xff56a3db);
  Color secondaryColor = const Color(0xffa6cae4);
  Color errorColor = const Color(0xffEF402B);
  Color textPrimary = const Color(0xff2D3338);
  Color textSecondary = const Color(0xff71808E);
  Color textBody = const Color(0xff71808E);
  Color dark4 = const Color(0xff9BA6AF);

  //size font
  double sizeXs = 11;
  double sizeSm = 12;
  double sizeMd = 14;
  double sizeLg = 16;
  double sizeXl = 18;
  double size2Xl = 24;

  List<dynamic> listCourier = [
    {
      'code': 'jne',
      'name': 'JNE Express',
    },
    {
      'code': 'pos',
      'name': 'Pos Indonesia',
    },
    {
      'code': 'tiki',
      'name': 'TIKI',
    },
  ];
}
