import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../variables/global_variables.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraState(cameraStateEnum: CameraStateEnum.loading)) {
    on<CameraEventClick>(cameraEventClick);
    on<CameraEventLoading>(cameraEventLoading);
  }

  cameraEventClick(CameraEventClick cameraEventClick, Emitter<CameraState> emitter) async {
    emitter(state.copyWith(cameraStateEnum: CameraStateEnum.loading));
    CameraController? cameraController;
    try{
      List<CameraDescription> cameras = await availableCameras();
      cameraController = CameraController(
        cameras[cameraEventClick.isFront ? 1 : 0],
        ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.jpeg,

      );
      await cameraController.initialize();
      emitter(state.copyWith(cameraStateEnum: CameraStateEnum.done,cameraController: cameraController,));
    }catch (error, stackTrace) {
      logger.e("Error in ${runtimeType.toString()} : $error\nStack Trace : $stackTrace");
      emitter(state.copyWith(cameraStateEnum: CameraStateEnum.error,cameraController:null,));

    }
  }
  cameraEventLoading(CameraEventLoading cameraEventLoading, Emitter<CameraState> emitter) async {
   if(cameraEventLoading.isLoading){
     emitter(state.copyWith(cameraStateEnum: CameraStateEnum.loading));
   }
   else{
     emitter(state.copyWith(cameraStateEnum: CameraStateEnum.done));
   }
  }
}
