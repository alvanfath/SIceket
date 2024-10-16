List<Map<String, dynamic>> getTahun(int range) {
  int tahun = DateTime.now().year;
  int tahunMinus = tahun - range;

  final List<Map<String, dynamic>> data = [];

  for (int i = tahun; i >= tahunMinus; i--) {
    data.add({
      'tahun': i.toString(),
    });
  }

  return data;
}
