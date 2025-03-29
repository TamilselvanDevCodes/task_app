import 'package:flutter_gemini/flutter_gemini.dart';

import '../model/task_model.dart';

class GeminiService  {
  static const String _apiKey = "AIzaSyA_DTCuIGKOvYphlVRATSPOPEsGEq1J9K4";
  GeminiService() {
    Gemini.init(apiKey: _apiKey);
  }

  Future<String> generateTaskReminder({TaskModel? taskModel}) async {
    String prompt;
    if (taskModel != null) {
      prompt = "Given the following pending task: ${taskModel.toMap()}, generate a motivational reminder (max 20 words)";

    } else {
      prompt = "Remind the user to add a task since no pending tasks are available.";
    }

    try {
      final Candidates? response = await Gemini.instance.prompt(parts: [Part.text(prompt)]);
      return response?.output ?? "Don't forget to complete your pending tasks!";
    } catch (error) {
      return "Error generating task reminder. Stay productive!";
    }
  }
}