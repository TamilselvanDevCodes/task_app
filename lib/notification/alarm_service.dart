import 'package:alarm/alarm.dart';
import 'package:task_app/core_needs/constants/notification_constants.dart';

import '../core_needs/constants/audio_constant.dart';

class AlarmService {
  static final AlarmService _instance = AlarmService._internal();

  AlarmService._internal() {
    Alarm.init();
  }

  factory AlarmService() {
    Alarm.init();
    return _instance;
  }

  Future<bool> setAlarm({
    required String title,
    required String body,
    required DateTime alarmDateTime,
    String? stopButtonText,
    String? payload,
    int? id
  }) async{
    final alarmSettings = AlarmSettings(
      volumeSettings: const VolumeSettings.fixed(
        volume: 0.4,
        volumeEnforced: true,

        ///Forces the volume to be applied even if the device is in silent mode.
      ),
      id: id??NotificationIDConstant.nAlarmNotification,
      notificationSettings: NotificationSettings(
        title: title,
        body: body,
        stopButton: stopButtonText,
      ),
      dateTime: alarmDateTime,
      assetAudioPath: AudioConstant.aAlarmSoundHen,
      vibrate: true,
      loopAudio: true,
      allowAlarmOverlap: false,
      androidFullScreenIntent: true,
      ///Enables full-screen alarm UI on Android (like the native alarm app).
      androidStopAlarmOnTermination: true,
      payload:payload,
      warningNotificationOnKill: true,
    );
    return Alarm.set(alarmSettings: alarmSettings);

  }
  void cancelAlarm({int? id}) {
    Alarm.stop(id??NotificationIDConstant.nAlarmNotification);
  }
}
