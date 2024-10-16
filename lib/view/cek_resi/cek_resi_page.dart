import 'package:siceket/core/core.dart';
import 'package:siceket/utils/utils.dart';
import 'package:siceket/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CekResiPage extends StatefulWidget {
  static const routeName = '/cek_resi';
  const CekResiPage({super.key});

  @override
  State<CekResiPage> createState() => _CekResiPageState();
}

class _CekResiPageState extends State<CekResiPage> {
  final resiController = TextEditingController();
  bool isUnnable = true;
  String? resi;
  Map<String, dynamic>? packageData;
  Map<String, dynamic>? courierSelected;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CekResiCubit>();
    return BlocListener<CekResiCubit, CekResiState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => context.showLoading(),
          error: (error) {
            context.dismiss();
            showErrorBottom(context: context, error: error);
          },
          failure: (left) {
            context.dismiss();
            failureGenerator(context, left);
          },
          initial: () => context.dismiss(),
          success: (data) {
            context.dismiss();
            setState(() {
              packageData = data;
              isUnnable = false;
            });
          },
        );
      },
      child: Scaffold(
        appBar: AppBarWidget(
          context: context,
          isLeading: true,
          title: 'Cek Resi',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const TitleWidget(
                title: 'Cek Resi',
                subtitle:
                    'Masukkan nomor resi anda dan pilih layanan yang dipakai',
              ),
              const SizedBox(height: 16),
              listLayananWidget(cubit),
              const SizedBox(height: 16),
              noResiWidget(cubit),
              const SizedBox(height: 24),
              buttonWidget(cubit),
              const SizedBox(height: 24),
              packageWidget(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget listLayananWidget(CekResiCubit cubit) {
    return StreamBuilder<List<dynamic>?>(
      stream: cubit.listCourir.stream,
      builder: (context, snapshot) {
        final listData = snapshot.data ?? [];
        return TextFormSelectSearch(
          dataSelected: courierSelected,
          textDisplay: 'description',
          idDisplay: 'code',
          placeHolder: 'Pilih layanan',
          listData: listData,
          searchPlaceholder: 'Cari layanan',
          onSelect: (value) {
            setState(() {
              courierSelected = value;
            });
          },
          label: 'Layanan',
        );
      },
    );
  }

  Widget noResiWidget(CekResiCubit cubit) {
    return TextF(
      controller: resiController,
      hint: 'Nomor resi',
      hintText: 'Ketik nomor resi disini',
      inputFormatter: [
        NoLeadingSpaceFormatter(),
        UpperCaseTextFormatter(),
      ],
      onChanged: (value) {
        setState(() {
          isUnnable = true;
          if (value.isEmpty) {
            resi = null;
          } else {
            resi = value;
          }
        });
      },
    );
  }

  Widget buttonWidget(CekResiCubit cubit) {
    final bool isValid = resi != null && courierSelected != null && isUnnable;
    return Button(
      title: 'Cari Paket',
      color: isValid ? null : Constants.get.secondaryColor,
      onPressed: () {
        if (isValid) {
          setState(() {
            packageData = null;
          });
          cubit.cekResi(
            noResi: resi!,
            code: courierSelected!['code'] ?? '',
          );
        }
      },
    );
  }

  Widget packageWidget(BuildContext context) {
    if (packageData != null) {
      final Map<String, dynamic> summary = packageData!['summary'] ?? {};
      final Map<String, dynamic> detail = packageData!['detail'] ?? {};
      final List<dynamic> history = packageData!['history'] ?? [];
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
            title: 'No resi',
            subtitle: summary['awb'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Jenis kurir',
            subtitle: summary['courier'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Jenis pengiriman',
            subtitle: summary['service'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Status pengiriman',
            subtitle: summary['status'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Deskripsi paket',
            subtitle: summary['desc'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Berat paket',
            subtitle: summary['weight'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Tanggal diterima',
            subtitle: dateFormat(
              tanggal: summary['date'],
            ),
          ),
          const SizedBox(height: 16),
          const TextWidget(
            text: 'Detail pengiriman paket',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Tempat asal',
            subtitle: detail['origin'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Tempat tujuan',
            subtitle: detail['destination'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Pengirim',
            subtitle: detail['shipper'],
          ),
          const SizedBox(height: 8),
          KeyValH(
            title: 'Penerima',
            subtitle: detail['receiver'],
          ),
          const SizedBox(height: 16),
          listHistory(history.reversed.toList()),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget listHistory(List<dynamic> history) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Riwayat tracking paket',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: history.map((e) {
            return Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 14,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: e['desc'],
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 2),
                        TextWidget(
                          text: dateFormat(tanggal: e['date']),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
