part of 'camera_bloc.dart';

enum CameraStateEnum {
  loading,
  done,
  error,
}

class CameraState extends Equatable {
  final CameraStateEnum cameraStateEnum;
  final CameraController? cameraController;

  const CameraState({required this.cameraStateEnum,this.cameraController});

  @override
  List<Object?> get props => [cameraStateEnum,cameraController];

  CameraState copyWith({
    CameraStateEnum? cameraStateEnum,
    CameraController? cameraController,
  }) {
    return CameraState(
      cameraStateEnum: cameraStateEnum ?? this.cameraStateEnum,
      cameraController: cameraController ?? this.cameraController,
    );
  }
}
