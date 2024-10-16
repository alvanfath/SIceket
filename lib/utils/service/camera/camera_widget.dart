import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:cek_ongkir/utils/utils.dart';

class CameraWidget extends StatefulWidget {
  final CameraType camType;
  final String title;
  final String? subtitle;
  const CameraWidget({
    super.key,
    required this.camType,
    required this.title,
    this.subtitle,
  });

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? controller;
  late Future<void> initializeController;
  bool isReady = false;
  bool isCapture = false;
  String? preview;
  String? errorText;
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    var camera = cameras.first;

    if (widget.camType == CameraType.selfie ||
        widget.camType == CameraType.selfieIdCard ||
        widget.camType == CameraType.selfieGeneral) {
      camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => camera,
      );
    }

    controller = CameraController(
      camera,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
      enableAudio: false,
    );

    try {
      initializeController = controller!.initialize();
      await initializeController;
      if (mounted) {
        print('Akses kamera sukses');
        setState(() {});
      }
    } on CameraException catch (e) {
      if (e.description!.contains('onConfigureFailed')) {
        print('Recreating CameraController due to configuration failure.');
        controller?.dispose();
        await initCamera();
      }
      setState(() {
        errorText = 'Error initializing camera: ${e.description}';
      });
    }
    setState(() {
      isReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appbarCam(context),
      body: previewWidget(context),
      bottomNavigationBar: buttonWidget(context),
    );
  }

  Widget previewWidget(BuildContext context) {
    if (preview != null) {
      return bodyPreview(preview!);
    }
    return bodyBuilder(controller);
  }

  Widget buttonWidget(BuildContext context) {
    if (preview != null) {
      return buttonPreview(preview!);
    }
    return buttonCapture(context);
  }

  Widget buttonCapture(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            if (isCapture == false) {
              setState(() {
                isCapture = true;
              });
              try {
                await initializeController;
                await controller!.setFlashMode(FlashMode.off);
                final picture = await controller!.takePicture();
                final String resizedImagePath = await resizeImage(picture.path);
                setState(() {
                  preview = resizedImagePath;
                });
                print('Gambar diambil: ${picture.path}');
                // Navigator.pop(context, resizedImagePath);
              } catch (e) {
                print("Error saat mengAmbil Foto: $e");
                e.toString().toToastError(context);
                Navigator.pop(context);
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  PreferredSizeWidget appbarCam(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 100,
      leadingWidth: 56,
      leading: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: InkWell(
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 24,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      titleSpacing: 0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: preview != null ? 'Tinjau hasil foto' : widget.title,
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          if (widget.subtitle != null)
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  TextWidget(
                    text: widget.subtitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget bodyPreview(String path) {
    final File file = File(path);
    return Image.file(
      file,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget buttonPreview(String file) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Button(
                  title: 'Ulangi',
                  color: Colors.white,
                  fontSize: Constants.get.sizeMd,
                  fontWeight: FontWeight.w500,
                  titleColor: Constants.get.primaryColor,
                  paddingY: 12.5,
                  onPressed: () {
                    setState(() {
                      preview = null;
                      isCapture = false;
                    });
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Button(
                  title: 'Lanjut',
                  fontSize: Constants.get.sizeMd,
                  fontWeight: FontWeight.w500,
                  paddingY: 12.5,
                  onPressed: () {
                    try {
                      Navigator.pop(context, file);
                    } catch (e) {
                      print("Error saat mengAmbil Foto: $e");
                      e.toString().toToastError(context);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget bodyBuilder(CameraController? camController) {
    if (controller != null &&
        controller!.value.isInitialized &&
        isReady == true) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: cameraBuilder(widget.camType),
      );
    }
    return Center(
      child: TextWidget(
        text: errorText ?? '',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        align: TextAlign.center,
      ),
    );
  }

  Widget cameraBuilder(CameraType camWidget) {
    switch (camWidget) {
      case CameraType.general:
        return CameraPreview(controller!);
      case CameraType.selfieGeneral:
        return CameraPreview(controller!);
      case CameraType.selfie:
        return selfieCam();
      case CameraType.idCard:
        return idCardCam();
      case CameraType.selfieIdCard:
        return selfieIdCard();
      default:
        return CameraPreview(controller!);
    }
  }

  Widget selfieCam() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CameraPreview(controller!),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SizedBox(
            width: 200,
            height: 250,
            child: CustomPaint(
              painter: OvalBorderPainter(),
            ),
          ),
        ),
      ],
    );
  }

  Widget idCardCam() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CameraPreview(controller!),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: MediaQuery.of(context).size.width - 48,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget selfieIdCard() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CameraPreview(controller!),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            width: 200,
            height: 250,
            child: CustomPaint(
              painter: DottedEllipsePainter(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350),
          child: SizedBox(
            width: 200,
            height: 130,
            child: DottedBorder(
              color: Colors.white,
              strokeWidth: 1,
              dashPattern: const [10, 6],
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }

  Future<String> resizeImage(String originalImagePath) async {
    final file = File(originalImagePath);

    final Uint8List? compressedBytes =
        await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 85,
    );
    final String resizedImagePath = originalImagePath.replaceFirst(
      '.jpg',
      '_resized.jpg',
    );
    final File resizedFile = File(resizedImagePath);
    await resizedFile.writeAsBytes(compressedBytes!);

    return resizedImagePath;
  }
}
