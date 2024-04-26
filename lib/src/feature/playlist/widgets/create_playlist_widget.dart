import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePlaylistWidget extends StatelessWidget {
  CreatePlaylistWidget({super.key, this.onPressed});
  final Function(String value)? onPressed;
  final txtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.9,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: txtCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (onPressed != null) {
                          onPressed!(txtCtrl.text);
                        }
                      },
                      child: Text("create".toUpperCase()))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
