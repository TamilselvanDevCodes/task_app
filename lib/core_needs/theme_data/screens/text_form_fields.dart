import 'package:flutter/material.dart';


class TextFormFieldsForThemeCheck extends StatefulWidget {
  const TextFormFieldsForThemeCheck({super.key});

  @override
  State<TextFormFieldsForThemeCheck> createState() => _TextFormFieldsForThemeCheckState();
}

class _TextFormFieldsForThemeCheckState extends State<TextFormFieldsForThemeCheck> with WidgetsBindingObserver{
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }
  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }
  // @override
  // void didChangeMetrics() {
  //   super.didChangeMetrics();
  //   changeDimension();
  // }
  // void changeDimension()async{
  //   debugPrint("sizeConstants.height : ${sizeConstants.height}, sizeConstants.width : ${sizeConstants.width}");
  //   await Future.delayed(const Duration(seconds: 1));
  //   sizeConstants.setWidthAndHeight(MediaQuery.of(context).size);
  //   debugPrint("sizeConstants.height : ${sizeConstants.height}, sizeConstants.width : ${sizeConstants.width}");
  //   debugPrint("didChangeMetrics called");
  //    MyFontSize().updateParams();
  // }
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: const Text(
            "TextFormFieldsForThemeCheck",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ElevatedButton(onPressed: (){
                  debugPrint("MediaQuery.of(context).size : ${MediaQuery.of(context).size}");
                }, child: const Text("Size"),),
                TextFormField(
                  validator: (value) {
                    print("value :$value");
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  decoration: InputDecoration(
                    // counterText: "counterText",
                    // errorText: "errorText",
                    // helperText: "helperText",
                    hintText: "hintText",
                    labelText: "labelText",
                    prefixText: "prefixText",
                    semanticCounterText: "semanticCounterText",
                    suffixText: "suffixText",
                  ),
                ),
                TextFormField(
                  maxLength: 20,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,

                  ),
                  validator: (value) {
                    print("value :$value");
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    filled: true,
                    hintText: "hintText",
                    labelText: "labelText",
                    prefixText: "prefixText",
                    semanticCounterText: "semanticCounterText",
                    suffixText: "suffixText",
                    counterText: "",
                    fillColor: Colors.green[50],
                  ).applyDefaults(
                    Theme.of(context).inputDecorationTheme,
                  ), // Applying the defaults from the theme
                ),
                TextFormField(
                  maxLines: 150,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          formKey.currentState?.validate();
          setState(() {});
        },
        child: const Text(
          "Validate",
        ),
      ),
    );
  }
}
