import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core_needs/theme_data/constants/style_constant.dart';
import '../../theme_data/constants/size_constants.dart';
import '../../theme_data/styles/text_style.dart';
import '../image_corp_view/image_crop_view.dart';
import 'camera_bloc/camera_bloc.dart';



class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // late List<CameraDescription> cameras;
  // late CameraController cameraController;
  // bool loading = true;
  bool isFrontCameraSelected = false;
  // final player = AudioPlayer();

  CameraBloc cameraBloc = CameraBloc();

  @override
  void initState() {
    super.initState();
    initializeParams();
  }
  void initializeParams()async{
    addCameraEventClick(isFront: isFrontCameraSelected);
    // startPlayer();
  }
  // void startPlayer()async {
  //   await player.setAsset("assets/audio/camera_click_audio.wav");
  // }
  // Future<void> _vibrate() async {
  //   if (await Vibration.hasVibrator() ?? false) {
  //     Vibration.vibrate(duration: 50);
  //   }
  // }
  addCameraEventClick({required bool isFront}) {
    cameraBloc.add(CameraEventClick(isFront: isFront));
  }
  addCameraEventLoading({required bool isLoading}){
    cameraBloc.add(CameraEventLoading(isLoading: isLoading));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: BlocBuilder<CameraBloc, CameraState>(
        bloc: cameraBloc,
        builder: (context, state) {
          if (state.cameraStateEnum == CameraStateEnum.loading) {
            return Container(
              color:Colors.grey[500],
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: StyleConstant.mainElevation,
                ),
              ),
            );
          }
          if (state.cameraStateEnum == CameraStateEnum.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Something Went Wrong !",
                    style: MyThemeTextStyle.titleMedium().copyWith(
                      color: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Go Back",
                    ),
                  ),
                ],
              ),
            );
          }
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(sizeConstants.sW01),
              child: Column(
                children: [
                  SizedBox(
                    height: sizeConstants.sH8,
                    width: double.infinity,
                    child: CameraPreview(
                      state.cameraController!,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton.filled(
                        onPressed: () {
                          changeCamera();
                        },
                        icon:  Icon(
                          Icons.cameraswitch_outlined,
                          size: MyFontSize.sizeLarge,
                        ),
                      ),
                      IconButton.filled(
                        onPressed: () async {
                          //startPlayer();
                          // player.play();
                          // _vibrate();
                          addCameraEventLoading(isLoading: true);

                          await takePicture(cameraController: state.cameraController!).then(
                            (file) {
                              cropImage(context: context, path: file.path);
                            },
                          );
                          addCameraEventLoading(isLoading: false);
                          // player.stop();
                          // startPlayer();
                        },
                        icon: Icon(
                          Icons.camera,
                          size: MyFontSize.sizeLarge,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<XFile> takePicture({required CameraController cameraController}) async {
    XFile file = await cameraController.takePicture();
    return file;
  }

  void changeCamera() {
    isFrontCameraSelected = !isFrontCameraSelected;
    addCameraEventClick(isFront: isFrontCameraSelected);
  }
}
