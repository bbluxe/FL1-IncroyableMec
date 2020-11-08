import 'package:flutter/material.dart';
import 'package:smoothit/Screens/Common/components/screen_title.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('bananas.png', width: 40),
                          Image.asset('apple.png', width: 40),
                          Image.asset('watermelon.png', width: 40),
                          Image.asset('coconut.png', width: 40)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('blueberry.png', width: 40),
                          ScreenTitle(title: "Smooth'IT"),
                          Image.asset('mango.png', width: 40),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('strawberry.png', width: 40),
                          Image.asset('pear.png', width: 40),
                          Image.asset('pineapple.png', width: 40),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              child,
            ],
          )),
    );
  }
}
