import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/colouring_provider.dart';
class ColouringScreen extends StatelessWidget {
  const ColouringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('biii');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ColouringProvider>(builder: (context,value,child){
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val){
                  value.setValue(val);
                });
          }),
          Consumer<ColouringProvider>(builder: (context,value,child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(value.value),
                    ),
                  ),
                ),
              ],
            );
          }),

        ],
      ),
    );
  }
}
