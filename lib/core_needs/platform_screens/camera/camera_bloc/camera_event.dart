part of 'camera_bloc.dart';

 abstract class CameraEvent extends Equatable{

}
final class CameraEventClick extends CameraEvent{
  final bool isFront;
  CameraEventClick({required this.isFront});

 @override
 List<Object?> get props =>[isFront] ;
}
final class CameraEventLoading extends CameraEvent{
   final bool isLoading;
   CameraEventLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];

}
