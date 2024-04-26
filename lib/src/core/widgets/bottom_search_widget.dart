import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/core/debouncer.dart';

class Searching {
  static final instance = Searching();

  show(Function(String value) action, {Widget? child}) async {
    return await Get.bottomSheet(
      BottomSearchWidget(
        action: action,
        child: child,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade900,
    );
  }
}

class BottomSearchWidget extends StatelessWidget {
  BottomSearchWidget({super.key, this.action, this.child});
  final Function(String value)? action;
  final _debouncer = Debouncer(milliseconds: 1000);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.9,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 30,
                )),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // controller: txtCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                _debouncer.run(() {
                  if (action != null) {
                    action!(value);
                  }
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            child ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
