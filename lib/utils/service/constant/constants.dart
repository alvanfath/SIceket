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

  List<dynamic> onboardingList = [
    {
      "idMasterOnboarding": 1,
      "img":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/%3Ajenis%2Ffile-2024-08-13-12-24-06b88051f60641477e9187679f91aba756.png?Expires=7723526646&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=bHCdkyCq86CzhnvO%2FEYi9nUP11g%3D",
      "noUrut": 1,
      "header": "Selamat datang diSmartFin",
      "deskripsi":
          "Dari kebutuhan sehari-hari sampai modal usaha, kami selalu hadir menemani untuk setiap #LangkahBijak.",
      "isActive": 1
    },
    {
      "idMasterOnboarding": 2,
      "img":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/%3Ajenis%2Ffile-2024-08-13-12-24-06b88051f60641477e9187679f91aba756.png?Expires=7723526646&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=bHCdkyCq86CzhnvO%2FEYi9nUP11g%3D",
      "noUrut": 2,
      "header": "Satu Jaminan Banyak Manfaat",
      "deskripsi":
          "Dapatkan dana untuk berbagai kebutuhan hanya dengan BPKB kendaraan #LangkahBijak",
      "isActive": 1
    },
    {
      "idMasterOnboarding": 3,
      "img":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/%3Ajenis%2Ffile-2024-08-13-12-24-06b88051f60641477e9187679f91aba756.png?Expires=7723526646&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=bHCdkyCq86CzhnvO%2FEYi9nUP11g%3D",
      "noUrut": 3,
      "header": "Hadir di berbagai kota, menjangkau lebih luas",
      "deskripsi":
          "Kami terus memastikan akses layanan yang mudah dan terjangkau untuk semua",
      "isActive": 1
    }
  ];

  String linkImage =
      'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/%3Ajenis%2Ffile-2024-08-13-12-24-06b88051f60641477e9187679f91aba756.png?Expires=7723526646&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=bHCdkyCq86CzhnvO%2FEYi9nUP11g%3D';

  List<dynamic> infoPromoList = [
    {
      "id": 1,
      "urut": 1,
      "linkImage":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/aset-smf%2Ffile-2024-08-12-03-24-130fb479701af04fb0bd90813eb78847ae.png?Expires=7723407853&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=keDuKjQt0kqLQ8NogpdpG1%2BR50I%3D",
      "url": "",
    },
    {
      "id": 2,
      "urut": 2,
      "linkImage":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/aset-smf%2Ffile-2024-08-12-03-24-130fb479701af04fb0bd90813eb78847ae.png?Expires=7723407853&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=keDuKjQt0kqLQ8NogpdpG1%2BR50I%3D",
      "url": "",
    },
    {
      "id": 3,
      "urut": 3,
      "linkImage":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/aset-smf%2Ffile-2024-08-12-03-24-130fb479701af04fb0bd90813eb78847ae.png?Expires=7723407853&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=keDuKjQt0kqLQ8NogpdpG1%2BR50I%3D",
      "url": "",
    },
  ];

  List<dynamic> jenisKelamin = [
    {'id': 1, 'nama': 'Laki-laki'},
    {'id': 2, 'nama': 'Perempuan'},
  ];
  List<dynamic> statusKawinList = [
    {'id': 1, 'nama': 'BELUM KAWIN'},
    {'id': 2, 'nama': 'KAWIN'},
    {'id': 3, 'nama': 'DUDA'},
    {'id': 4, 'nama': 'JANDA'}
  ];

  String imageMobil =
      'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-38-05da43598e27b844428bd57350f302095c.png?Expires=7724308685&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=uS%2FRE1SmZYmNwc%2BDkYMgIBW4I8c%3D';
  String imageMotor =
      'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D';

  List<dynamic> listTransaksiAktif = [
    {
      'nomorPengajuan': '123123123123123',
      'idPengajuan': 1,
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'statusString': 'Aktif',
      'status': 'Aktif',
      'nominal': 2500000,
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISSasdasdasdasdasdas',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-38-05da43598e27b844428bd57350f302095c.png?Expires=7724308685&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=uS%2FRE1SmZYmNwc%2BDkYMgIBW4I8c%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'idPengajuan': 2,
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'statusString': 'Aktif',
      'status': 'Aktif',
      'nominal': 2500000000,
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-38-05da43598e27b844428bd57350f302095c.png?Expires=7724308685&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=uS%2FRE1SmZYmNwc%2BDkYMgIBW4I8c%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'statusString': 'Aktif',
      'status': 'Aktif',
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'angsuranTerbayar': 3,
      'statusString': 'Aktif',
      'status': 'Aktif',
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'angsuranTerbayar': 3,
      'statusString': 'Aktif',
      'status': 'Aktif',
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'angsuranTerbayar': 3,
      'statusString': 'Aktif',
      'status': 'Aktif',
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'angsuranTerbayar': 3,
      'statusString': 'Aktif',
      'status': 'Aktif',
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'angsuranTerbayar': 3,
      'statusString': 'Telat 5 hari',
      'status': 'terlambat',
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
  ];

  List<dynamic> listTransaksiSelesai = [
    {
      'nomorPengajuan': '123123123123123',
      'idPengajuan': 1,
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'statusString': 'Lunas',
      'status': 'Lunas',
      'nominal': 2500000,
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISSasdasdasdasdasdas',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-38-05da43598e27b844428bd57350f302095c.png?Expires=7724308685&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=uS%2FRE1SmZYmNwc%2BDkYMgIBW4I8c%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'idPengajuan': 2,
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'statusString': 'Gagal bayar',
      'status': 'Gagal bayar',
      'nominal': 2500000000,
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-38-05da43598e27b844428bd57350f302095c.png?Expires=7724308685&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=uS%2FRE1SmZYmNwc%2BDkYMgIBW4I8c%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 3,
      'statusString': 'Ditolak',
      'status': 'Ditolak',
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 4,
      'statusString': 'Lunas',
      'status': 'Lunas',
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
    {
      'nomorPengajuan': '123123123123123',
      'jatuhTempo': '2024-08-22 13:28:00',
      'tanggalLunas': '2024-08-22 13:28:00',
      'tglPengajuan': '2024-08-22 13:28:00',
      'nominal': 2500000000,
      'idPengajuan': 5,
      'statusString': 'Lunas',
      'status': 'Lunas',
      'angsuranTerbayar': 3,
      'tenor': 12,
      'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
      'gambar':
          'http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-37-285e8f3071a6e94c85bf92f15520dd0e42.png?Expires=7724308648&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=Y5Vznp%2BwmCgS1XJF2m1hlmge9bM%3D',
    },
  ];
  List<dynamic> jkList = [
    {
      "IdJenisKendaraan": 2,
      "NamaJenisKendaraan": "Motor",
      "image":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/aset-smf%2Ffile-2024-08-16-01-09-389b5266d369e340d6b7d5c4b12d5e2829.png?Expires=7723745378&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=7JskQuTjJDhoQKeEnmyZa4rHhOc%3D",
      "bgColor": "0xffEAF3EC",
      "primaryColor": "0xff308D42"
    },
    {
      "IdJenisKendaraan": 5,
      "NamaJenisKendaraan": "Mobil",
      "image":
          "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/aset-smf%2Ffile-2024-08-16-01-10-12f811c40c1cd4474b84326d7e7aa8cff0.png?Expires=7723745412&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=HJrAUZO82durgyUZuLexoM%2Fes7E%3D",
      "bgColor": "0xffFEF7E7",
      "primaryColor": "0xffF7B417"
    },
  ];

  Map<String, dynamic> pengajuanDetail = {
    'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
    'noPengajuan': '12312asdasdhb12',
    "image":
        "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-38-05da43598e27b844428bd57350f302095c.png?Expires=7724308685&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=uS%2FRE1SmZYmNwc%2BDkYMgIBW4I8c%3D",
    'informasiPinjaman': {
      'nilaiPengajuan': 1000000,
      'jenisJaminan': 'BPKB Vincent',
      'tglPengajuan': '2024-08-22 13:28:00',
      'jadwalSurvey': '2024-08-22 13:28:00',
      'tenor': 12,
      'alamatSurvey':
          'membuka jalan sendiri dengan modal nekat dan keberanian, tidak meminta bantuan bapak'
    },
    'informasiSurveyor': {
      'namaSurveyor': 'Azzam Pangarep',
      'idSurveyor': '1a2b3c4d5e6f',
    },
    'prosesPengajuan': {
      'Pengajuan': {
        'isStatus': 1,
        // ''
      }
    }
  };
  Map<String, dynamic> kontrakDetail = {
    'namaKendaraan': 'Honda - Beat - Beat ESP CBS ISS',
    'noPengajuan': '12312asdasdhb12',
    'status': 'Aktif',
    "image":
        "http://register-borrower.oss-ap-southeast-5.aliyuncs.com/smf-asset%2Ffile-2024-08-22-13-38-05da43598e27b844428bd57350f302095c.png?Expires=7724308685&OSSAccessKeyId=LTAI5tL6WektQo3e62QSosiw&Signature=uS%2FRE1SmZYmNwc%2BDkYMgIBW4I8c%3D",
    'informasiPinjaman': {
      'nilaiPengajuan': 1000000,
      'sisaAngsuran': 1000000,
      'jenisJaminan': 'BPKB Vincent',
      'tenor': 12,
      'tglPengajuan': '2024-08-22 13:28:00',
      'tglLunas': '2024-08-22 13:28:00',
      'jadwalSurvey': '2024-08-22 13:28:00',
      'jatuhTempoAkhir': '2024-08-22 13:28:00',
      'alamatSurvey':
          'membuka jalan sendiri dengan modal nekat dan keberanian, tidak meminta bantuan bapak'
    },
    'angsuranData': {
      'angsuranTerbayar': 11,
      'tenor': 12,
    },
    'jatuhtempoSelanjutnya': {
      'tanggalJt': '2024-08-22 13:28:00',
      'angsuran': 100000,
      'denda': 0,
    },
    'angsuranDetail': [
      {
        'idAgreement': 5,
        'nourut': 1,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'tanggalBayar': '2024-08-22 13:28:00',
        'status': 'Dibayar',
        'statusString': 'Dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 2,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Terlambat',
        'statusString': 'Telat 5 hari',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 3,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 4,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 5,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 6,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 7,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 8,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 9,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 10,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 11,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
      {
        'idAgreement': 5,
        'nourut': 12,
        'nominal': 200000000,
        'denda': 0,
        'tanggalJt': '2024-08-22 13:28:00',
        'status': 'Belum dibayar',
        'statusString': 'Belum dibayar',
        'total': 200000000,
      },
    ],
    'informasiSurveyor': {
      'namaSurveyor': 'Azzam Pangarep',
      'idSurveyor': '1a2b3c4d5e6f',
    },
  };

  List<dynamic> tenorList = [
    {
      'id': 6,
      'nama': '6 bulan',
    },
    {
      'id': 12,
      'nama': '12 bulan',
    },
    {
      'id': 24,
      'nama': '24 bulan',
    },
  ];
  List<dynamic> listCodeSelesai = [
    {
      'code': 'all',
      'nama': 'Semua',
    },
    {
      'code': 'lunas',
      'nama': 'Lunas',
    },
    {
      'code': 'tolak',
      'nama': 'Ditolak',
    },
    {
      'code': 'galbay',
      'nama': 'Gagal Bayar',
    },
  ];
}
