import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:bottom_picker/bottom_picker.dart';

import 'package:cek_ongkir/utils/utils.dart';

class DateForm extends StatelessWidget {
  final String? data;
  final String? hint;
  final Function1<dynamic, void> onSelect;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  final String format;
  final String placeHolder;
  const DateForm({
    super.key,
    this.data,
    required this.onSelect,
    this.minDateTime,
    this.maxDateTime,
    this.hint,
    this.format = 'd/M/yyyy',
    required this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    final date = data ?? DateTime.now().toString();
    final dateFormat = dateSurvey(date, format);
    DateTime now = DateTime.now();
    DateTime todayMidnight = DateTime(now.year, now.month, now.day);
    final widget = data != null
        ? TextWidget(
            text: dateFormat,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          )
        : TextWidget(
            text: placeHolder,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff71808E),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hint != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: hint!,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 8),
            ],
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            BottomPicker.date(
              dateOrder: DatePickerDateOrder.dmy,
              buttonWidth: MediaQuery.of(context).size.width - 80,
              buttonContent: const TextWidget(
                text: 'Pilih',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                align: TextAlign.center,
              ),
              titlePadding: const EdgeInsets.symmetric(vertical: 12),
              titleAlignment: Alignment.center,
              buttonStyle: BoxDecoration(
                color: Constants.get.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              initialDateTime: data != null ? DateTime.parse(data!) : null,
              minDateTime: minDateTime ?? todayMidnight,
              maxDateTime: maxDateTime,
              onSubmit: onSelect,
              pickerTitle: Container(),
            ).show(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: const Color(0xffDFE4EA),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget,
                const HeroIcon(
                  HeroIcons.calendarDays,
                  size: 16,
                  color: Color(0xff71808E),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String dateSurvey(String inputDate, String format) {
  try {
    final parsedDate = DateTime.parse(inputDate).toLocal();
    final formatter = DateFormat(format, 'id_ID');
    final formattedDate = formatter.format(parsedDate);
    return formattedDate;
  } catch (e) {
    return 'Tanggal tidak valid';
  }
}

class TimeForm extends StatelessWidget {
  final String? data;
  final String? hint;
  final Function1<dynamic, void> onSelect;

  const TimeForm({
    super.key,
    this.data,
    required this.onSelect,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final date = data ?? DateTime.now().toString();
    final d = DateTime.parse(date);

    final dateFormat = timeSurvey(d);
    final widget = data != null
        ? TextWidget(
            text: dateFormat,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          )
        : const TextWidget(
            text: 'hh:mm',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff71808E),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hint != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: hint!,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 8),
            ],
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            BottomPicker.time(
              use24hFormat: true,
              buttonWidth: MediaQuery.of(context).size.width - 80,
              buttonContent: const TextWidget(
                text: 'Pilih',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                align: TextAlign.center,
              ),
              minTime: Time(hours: 8, minutes: 30),
              maxTime: Time(hours: 17, minutes: 0),
              titleAlignment: Alignment.center,
              titlePadding: const EdgeInsets.symmetric(vertical: 12),
              buttonStyle: BoxDecoration(
                color: Constants.get.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              initialTime: timeBuilder(d),
              onSubmit: onSelect,
              pickerTitle: Container(),
            ).show(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: const Color(0xffDFE4EA),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget,
                const Icon(
                  Icons.access_time,
                  size: 16,
                  color: Color(0xff71808E),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Time timeBuilder(DateTime d) {
    if (d.hour >= 17) {
      return Time(hours: 17, minutes: 0);
    }
    if (d.hour <= 8) {
      return Time(hours: 8, minutes: 30);
    }
    return Time(hours: d.hour, minutes: d.minute);
  }

  String timeSurvey(DateTime date) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }
}
