import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 100),
              duration: Duration(seconds: 1),
              builder: (context, double value, child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.blue,
                );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
