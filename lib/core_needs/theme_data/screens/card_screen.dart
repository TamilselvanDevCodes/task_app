import 'package:flutter/material.dart';

class CardScreenForThemeCheck extends StatelessWidget {
  const CardScreenForThemeCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CardScreenForThemeCheck"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Card Widget",
                  ),
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
