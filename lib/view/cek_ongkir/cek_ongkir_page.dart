import 'package:siceket/core/core.dart';
import 'package:siceket/route.dart';
import 'package:siceket/utils/utils.dart';
import 'package:siceket/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CekOngkirPage extends StatefulWidget {
  static const routeName = '/cek_ongkir';
  const CekOngkirPage({super.key});

  @override
  State<CekOngkirPage> createState() => _CekOngkirPageState();
}

class _CekOngkirPageState extends State<CekOngkirPage> {
  final weightController = TextEditingController();
  Map<String, dynamic>? courier;
  Map<String, dynamic>? provinceOrigin;
  Map<String, dynamic>? cityOrigin;
  Map<String, dynamic>? provinceDestination;
  Map<String, dynamic>? cityDestination;
  int? weight;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CekOngkirCubit>();
    return BlocListener<CekOngkirCubit, CekOngkirState>(
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
            Navigator.push(
              context,
              CustomPageTransition(
                page: ResultOngkirPage(data: data),
                direction: AxisDirection.left,
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBarWidget(
          context: context,
          isLeading: true,
          title: 'Cek Ongkir',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const TitleWidget(
                title: 'Cek Ongkir',
                subtitle:
                    'Inout tempat asal dan tempat tujuan untuk mendapatkan harga ongkir',
              ),
              const SizedBox(height: 24),
              courierWidget(cubit),
              const SizedBox(height: 16),
              weightWidget(cubit),
              const SizedBox(height: 16),
              listProvinceOrigin(cubit),
              const SizedBox(height: 16),
              listKotaOrigin(cubit),
              const SizedBox(height: 16),
              listProvinceDestination(cubit),
              const SizedBox(height: 16),
              listKotaDestination(cubit),
              const SizedBox(height: 32),
              buttonWidget(cubit),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget courierWidget(CekOngkirCubit cubit) {
    return TextFormSelect(
      dataSelected: courier,
      textDisplay: 'name',
      placeHolder: 'Pilih layanan',
      label: 'Layanan',
      onSelect: (value) {
        setState(() {
          courier = value;
        });
      },
      idDisplay: 'code',
      listData: Constants.get.listCourier,
    );
  }

  Widget weightWidget(CekOngkirCubit cubit) {
    return TextF(
      controller: weightController,
      hint: 'Berat (gram)',
      hintText: 'Ketik berat paket disini',
      inputFormatter: [
        FilteringTextInputFormatter.digitsOnly,
        NoLeadingSpaceFormatter(),
        NoZeroSpaceFormatter(),
        RupiahNoSymbolFormatter(),
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            weight = null;
          } else {
            final val = value.replaceAll('.', '');
            weight = int.tryParse(val);
          }
        });
      },
    );
  }

  Widget listProvinceOrigin(CekOngkirCubit cubit) {
    return StreamBuilder<List<dynamic>?>(
      stream: cubit.listProvinsi.stream,
      builder: (context, snapshot) {
        final listData = snapshot.data ?? [];
        return TextFormSelectSearch(
          label: 'Provinsi asal',
          dataSelected: provinceOrigin,
          textDisplay: 'province',
          idDisplay: 'province_id',
          placeHolder: 'Pilih provinsi asal',
          listData: listData,
          searchPlaceholder: 'Cari provinsi',
          onSelect: (value) {
            if (value['province_id'] != (provinceOrigin ?? {}['province_id'])) {
              setState(() {
                provinceOrigin = value;
                cityOrigin = null;
              });
              cubit.getCity(
                tipe: PlaceType.origin,
                idProvinsi: value['province_id'],
              );
            }
          },
        );
      },
    );
  }

  Widget listKotaOrigin(CekOngkirCubit cubit) {
    return StreamBuilder<List<dynamic>?>(
      stream: cubit.listKotaOrigin.stream,
      builder: (context, snapshot) {
        final listData = snapshot.data ?? [];
        return TextFormSelectSearch(
          label: 'Kota asal',
          dataSelected: cityOrigin,
          textDisplay: 'city_name',
          textAdditional: 'type',
          idDisplay: 'city_id',
          placeHolder: 'Pilih kota/kabupaten asal',
          listData: listData,
          searchPlaceholder: 'Cari kota/kabupaten',
          onSelect: (value) {
            if (value['city_id'] != (cityOrigin ?? {}['city_id'])) {
              setState(() {
                cityOrigin = value;
              });
            }
          },
        );
      },
    );
  }

  Widget listProvinceDestination(CekOngkirCubit cubit) {
    return StreamBuilder<List<dynamic>?>(
      stream: cubit.listProvinsi.stream,
      builder: (context, snapshot) {
        final listData = snapshot.data ?? [];
        return TextFormSelectSearch(
          label: 'Provinsi tujuan',
          dataSelected: provinceDestination,
          textDisplay: 'province',
          idDisplay: 'province_id',
          placeHolder: 'Pilih provinsi tujuan',
          listData: listData,
          searchPlaceholder: 'Cari provinsi',
          onSelect: (value) {
            if (value['province_id'] !=
                (provinceDestination ?? {}['province_id'])) {
              setState(() {
                provinceDestination = value;
                cityDestination = null;
              });
              cubit.getCity(
                tipe: PlaceType.destination,
                idProvinsi: value['province_id'],
              );
            }
          },
        );
      },
    );
  }

  Widget listKotaDestination(CekOngkirCubit cubit) {
    return StreamBuilder<List<dynamic>?>(
      stream: cubit.listKotaDestination.stream,
      builder: (context, snapshot) {
        final listData = snapshot.data ?? [];
        return TextFormSelectSearch(
          label: 'Kota tujuan',
          dataSelected: cityDestination,
          textDisplay: 'city_name',
          textAdditional: 'type',
          idDisplay: 'city_id',
          placeHolder: 'Pilih kota/kabupaten tujuan',
          listData: listData,
          searchPlaceholder: 'Cari kota/kabupaten',
          onSelect: (value) {
            if (value['city_id'] != (cityDestination ?? {}['city_id'])) {
              setState(() {
                cityDestination = value;
              });
            }
          },
        );
      },
    );
  }

  Widget buttonWidget(CekOngkirCubit cubit) {
    final bool isValid = courier != null &&
        provinceOrigin != null &&
        cityOrigin != null &&
        provinceDestination != null &&
        cityDestination != null &&
        weight != null;
    return Button(
      title: 'Cek Ongkir',
      color: isValid ? null : Constants.get.secondaryColor,
      onPressed: () {
        if (isValid) {
          cubit.cekOngkir({
            "origin": cityOrigin!['city_id'],
            "destination": cityDestination!['city_id'],
            "weight": weight,
            "courier": courier!['code']
          });
        }
      },
    );
  }
}
