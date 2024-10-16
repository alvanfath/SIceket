// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:siceket/core/core.dart';
// import 'package:siceket/utils/utils.dart';

// class OtpWidget extends StatefulWidget {
//   final String titleAppBar;
//   final String noTelp;
//   final int digit;
//   final Function1<String?, void> onChangeOtp;
//   final Function1<String, void> onCompleteOtp;
//   final Function1<String, void> postClick;
//   final Function0<void> resend;
//   final VoidCallback backAction;
//   final String? errorText;
//   const OtpWidget({
//     super.key,
//     required this.titleAppBar,
//     required this.noTelp,
//     required this.digit,
//     required this.onChangeOtp,
//     required this.onCompleteOtp,
//     required this.postClick,
//     required this.resend,
//     required this.backAction,
//     this.errorText,
//   });

//   @override
//   State<OtpWidget> createState() => _OtpWidgetState();
// }

// class _OtpWidgetState extends State<OtpWidget> {
//   String? otpCode;
//   bool otpValid = false;
//   int _totalSeconds = 120;
//   int _minutes = 2;
//   int _seconds = 0;
//   bool _timerEnded = false;

//   void startTimer() {
//     Future.delayed(const Duration(seconds: 1), () {
//       if (_totalSeconds > 0) {
//         setState(() {
//           _totalSeconds--;
//           _minutes = _totalSeconds ~/ 60;
//           _seconds = _totalSeconds % 60;
//         });
//         startTimer();
//       } else {
//         setState(() {
//           _timerEnded = true;
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   Widget resendOtp(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const TextWidget(
//             text: 'Belum menerima kode?',
//             color: Color(0xff71808E),
//             fontSize: 14,
//           ),
//           _timerEnded ? timerEnd(context) : timerNotEnd(context),
//         ],
//       ),
//     );
//   }

//   Widget timerEnd(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 8),
//         InkWell(
//           onTap: () {
//             widget.resend();
//             setState(() {
//               _totalSeconds = 120;
//               _minutes = 2;
//               _seconds = 0;
//               _timerEnded = false;
//               startTimer();
//             });
//           },
//           child: TextWidget(
//             text: 'Kirim Ulang',
//             color: Constants.get.primaryColor,
//             fontSize: Constants.get.sizeMd,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget timerNotEnd(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 8),
//         TextWidget(
//           text:
//               'Kirim ulang ($_minutes:${_seconds.toString().padLeft(2, '0')})',
//           fontSize: Constants.get.sizeMd,
//           color: Constants.get.secondaryColor,
//           fontWeight: FontWeight.w600,
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWidget(
//         context: context,
//         isLeading: true,
//         leadingAction: widget.backAction,
//         actions: const [FaqIcon()],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextWidget(
//               text: 'Masukkan kode OTP',
//               fontSize: Constants.get.size2Xl,
//               fontWeight: FontWeight.w600,
//             ),
//             const SizedBox(height: 12),
//             Text.rich(
//               TextSpan(children: <TextSpan>[
//                 TextSpan(
//                   text:
//                       'Silakan masukkan ${widget.digit} digit OTP yang dikirim ke ',
//                   style: TextStyle(
//                     color: const Color(0xff71808E),
//                     fontSize: Constants.get.sizeMd,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//                 TextSpan(
//                   text: widget.noTelp,
//                   style: TextStyle(
//                     color: const Color(0xff2D3338),
//                     fontSize: Constants.get.sizeMd,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//               ]),
//               textAlign: TextAlign.start,
//             ),
//             const SizedBox(height: 32),
//             otpForm(),
//             const SizedBox(height: 24),
//             resendOtp(context),
//             const SizedBox(height: 56),
//             actionButton(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget otpForm() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: OtpTextField(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             numberOfFields: widget.digit,
//             fieldWidth: MediaQuery.of(context).size.width / (widget.digit + 2),
//             enabledBorderColor: widget.errorText != null
//                 ? Constants.get.errorColor
//                 : const Color(0xffDFE4EA),
//             focusedBorderColor: Constants.get.primaryColor,
//             borderRadius: BorderRadius.circular(8),
//             enabled: true,
//             textStyle: const TextStyle(
//               color: Colors.black,
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//             ),
//             showFieldAsBox: true,
//             borderWidth: 0.8,
//             onCodeChanged: (code) {
//               setState(() {
//                 otpCode = code;
//               });
//               widget.onChangeOtp(null);
//             },
//             onSubmit: (verificationCode) {
//               setState(() {
//                 otpCode = verificationCode;
//               });
//               widget.onCompleteOtp(verificationCode);
//             },
//             inputFormatters: [
//               FilteringTextInputFormatter.digitsOnly,
//             ],
//             keyboardType: TextInputType.number,
//           ),
//         ),
//         const SizedBox(height: 3),
//         if (widget.errorText != null)
//           TextWidget(
//             text: widget.errorText!,
//             color: Constants.get.errorColor,
//             align: TextAlign.center,
//           )
//       ],
//     );
//   }

//   Widget actionButton(BuildContext context) {
//     bool isValid = otpCode?.length == widget.digit && widget.errorText == null;
//     return Button(
//       title: 'Lanjut',
//       color: isValid ? null : Constants.get.secondaryColor,
//       onPressed: () {
//         if (isValid) {
//           widget.postClick(otpCode!);
//         }
//       },
//     );
//   }
// }
