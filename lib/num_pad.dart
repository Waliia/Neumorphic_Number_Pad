import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final double btnSize;
  // final Color btnColor;
  final Color iconColor;
  final Function delete;
  final Function submit;
  final TextEditingController controlller;

  const NumPad(
      {Key? key,
      required this.delete,
      required this.submit,
      this.btnSize = 70,
      //this.btnColor = Colors.indigo,
      this.iconColor = Colors.amber,
      required this.controlller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                  size: btnSize,
                  number: 1,
                  //color: btnColor,
                  controller: controlller),
              NumberButton(
                  size: btnSize,
                  number: 2,
                  //color: btnColor,
                  controller: controlller),
              NumberButton(
                  size: btnSize,
                  number: 3,
                  //color: btnColor,
                  controller: controlller)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                  size: btnSize,
                  number: 4,
                  //color: btnColor,
                  controller: controlller),
              NumberButton(
                  size: btnSize,
                  number: 5,
                  // color: btnColor,
                  controller: controlller),
              NumberButton(
                  size: btnSize,
                  number: 6,
                  //color: btnColor,
                  controller: controlller)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                  size: btnSize,
                  number: 7,
                  // color: btnColor,
                  controller: controlller),
              NumberButton(
                  size: btnSize,
                  number: 8,
                  //   color: btnColor,
                  controller: controlller),
              NumberButton(
                  size: btnSize,
                  number: 9,
                  // color: btnColor,
                  controller: controlller)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => delete(),
                icon: Icon(
                  Icons.backspace,
                  color: iconColor,
                  //  size: btnSize,
                ),
                iconSize: btnSize,
              ),
              NumberButton(
                  size: btnSize,
                  number: 0,
                  // color: btnColor,
                  controller: controlller),
              IconButton(
                onPressed: () => submit(),
                icon: Icon(
                  Icons.done_rounded,
                  color: iconColor,
                  // size: btnSize,
                ),
                iconSize: btnSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final double size;
  final int number;
  // final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.size,
    required this.number,
    //  required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: GestureDetector(
        onTap: () {
          controller.text += number.toString();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade300,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurple.shade700,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1),
                BoxShadow(
                  color: Colors.deepPurple.shade200,
                  offset: const Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ],
              gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade200,
                    Colors.deepPurple.shade400
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.9])),
          child: Center(
              child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
