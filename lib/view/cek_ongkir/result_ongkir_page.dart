import 'package:siceket/core/core.dart';
import 'package:siceket/utils/helper/helper.dart';
import 'package:siceket/utils/service/constant/constants.dart';
import 'package:flutter/material.dart';

class ResultOngkirPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ResultOngkirPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> query = data['query'] ?? {};
    final Map<String, dynamic> origin = data['origin_details'] ?? {};
    final Map<String, dynamic> destination = data['destination_details'] ?? {};
    final List<dynamic> results = data['results'] ?? [];
    final Map<String, dynamic> dataKurir = results[0];
    final List<dynamic> costs = dataKurir['costs'] ?? [];
    return Scaffold(
      appBar: AppBarWidget(
        context: context,
        isLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            detailPaket(
              query: query,
              origin: origin,
              destination: destination,
              dataKurir: dataKurir,
            ),
            const SizedBox(height: 16),
            listLayanan(costs: costs),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget detailPaket({
    required Map<String, dynamic> query,
    required Map<String, dynamic> origin,
    required Map<String, dynamic> destination,
    required Map<String, dynamic> dataKurir,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Keterangan paket',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        KeyValH(
          title: 'Berat',
          subtitle: '${numberFormat(number: query['weight'] ?? 0)} (gram)',
        ),
        const SizedBox(height: 8),
        KeyValH(
          title: 'Layanan',
          subtitle: dataKurir['name'],
        ),
        const SizedBox(height: 8),
        KeyValH(
          title: 'Provinsi asal',
          subtitle: origin['province'],
        ),
        const SizedBox(height: 8),
        KeyValH(
          title: 'Kota/kabupaten asal',
          subtitle: '${origin['type']} ${origin['city_name']}',
        ),
        const SizedBox(height: 8),
        KeyValH(
          title: 'Provinsi tujuan',
          subtitle: destination['province'],
        ),
        const SizedBox(height: 8),
        KeyValH(
          title: 'Kota/kabupaten tujuan',
          subtitle: '${destination['type']} ${destination['city_name']}',
        ),
      ],
    );
  }

  Widget listLayanan({
    required List<dynamic> costs,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: costs.map((e) {
        final dataCost = e['cost'][0];
        return LayananCard(
          service: e['service'] ?? '',
          deskripsi: e['description'] ?? '',
          harga: dataCost['value'] ?? 0,
          estimasi: dataCost['etd'] ?? '',
        );
      }).toList(),
    );
  }
}

class LayananCard extends StatelessWidget {
  final String service;
  final String deskripsi;
  final num harga;
  final String estimasi;
  const LayananCard({
    super.key,
    required this.service,
    required this.deskripsi,
    required this.harga,
    required this.estimasi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: service,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Constants.get.primaryColor,
              ),
              TextWidget(
                text: rupiahFormat(harga),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Constants.get.primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: deskripsi,
            fontSize: 14,
            color: Constants.get.textSecondary,
          ),
          const SizedBox(height: 8),
          TextWidget(
            text:
                'Estimasi : ${estimasi.toLowerCase().replaceAll('hari', '').replaceAll(' ', '')} hari',
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
