import 'package:flutter/material.dart';

class SeperetedAyahs extends StatefulWidget {
  const SeperetedAyahs({super.key,required this.number});
  final int number;

  @override
  State<SeperetedAyahs> createState() => _SeperetedAyahsState();
}

class _SeperetedAyahsState extends State<SeperetedAyahs> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 36,
              height: 36,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: const Stack(children: [
                Image(image: AssetImage("assets/images/muslim2.png"))
              ]),
            ),
          ),
          Center(
            child: Positioned(
              left: 16,
              top: 7,
              child: Text(
                widget.number.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF230E4E),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
