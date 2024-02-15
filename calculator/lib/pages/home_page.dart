import 'package:flutter/material.dart';
import '/functions/button_pressed.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen();
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late double _deviceWidth, _deviceHeight;
  String output = '0';

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(37, 37, 49, 1),
        toolbarHeight: _deviceHeight * 0.1,
      ),
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          color: const Color.fromRGBO(37, 37, 49, 1),
          child: Column(
            children: [
              _displayOperation(),
              _displayButtonOpt(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayOperation() {
    return Container(
      height: _deviceHeight * 0.30,
      width: _deviceWidth,
      decoration: const BoxDecoration(
        color: const Color.fromRGBO(37, 37, 49, 1),
      ),
      alignment: Alignment.bottomRight,
      padding:
          EdgeInsets.symmetric(vertical: 30, horizontal: _deviceHeight * 0.01),
      child: Column(
        children: [
          _question(),
          // _question(),
        ],
      ),
    );
  }

  Widget _question() {
    return Text(
      output,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _displayButtonOpt() {
    return Container(
      height: _deviceHeight * 0.572,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(51, 53, 74, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buttonRow(
              'C',
              '/',
              '*',
              'del',
              Colors.white,
              Color.fromRGBO(73, 77, 110, 1),
              Colors.amber,
              Color.fromRGBO(73, 77, 110, 1),
              Colors.amber,
              0.11,
              0.244),
          _buttonRow(
              '7',
              '8',
              '9',
              '-',
              Colors.white,
              Color.fromRGBO(58, 58, 80, 1),
              Colors.white,
              Color.fromRGBO(73, 77, 110, 1),
              '',
              0.11,
              0.244),
          _buttonRow(
              '4',
              '5',
              '6',
              '+',
              Colors.white,
              Color.fromRGBO(58, 58, 80, 1),
              Colors.white,
              Color.fromRGBO(73, 77, 110, 1),
              '',
              0.11,
              0.244),
          Row(
            children: [
              Column(
                children: [
                  _buttonRow2(
                      '1',
                      '2',
                      '3',
                      Colors.white,
                      Color.fromRGBO(58, 58, 80, 1),
                      Colors.white,
                      Colors.amber,
                      Colors.white,
                      0.11,
                      0.244),
                  _buttonRow2(
                      '%',
                      '.',
                      '0',
                      Colors.white,
                      Color.fromRGBO(58, 58, 80, 1),
                      Colors.white,
                      Colors.amber,
                      Colors.white,
                      0.11,
                      0.244),
                ],
              ),
              _answerBtn(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _displayBtn(
    String buttonText,
    double buttonWidth,
    double buttonHeight,
    Color foreColor,
    backColor,
  ) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: foreColor,
        backgroundColor: backColor,
        minimumSize: Size(buttonWidth, buttonHeight),
        // padding: EdgeInsets.symmetric(horizontal: 303),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      ),
      onPressed: () => buttonPressed(buttonText, updateOutput),
      child: Text(buttonText),
    );
  }

  Widget _buttonRow(
      String operation1,
      operation2,
      operation3,
      operation4,
      foreground,
      background,
      operationforeColor,
      operationBackColor,
      optional,
      double Btnheight,
      Btnwidth) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1, vertical: 1), // Adjust margin as needed
          child: _displayBtn(
            operation1,
            _deviceWidth * Btnwidth,
            _deviceHeight * Btnheight,
            foreground,
            background,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1), // Adjust margin as needed
          child: _displayBtn(
            operation2,
            _deviceWidth * Btnwidth,
            _deviceHeight * Btnheight,
            optional == '' ? foreground : optional,
            background,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1), // Adjust margin as needed
          child: _displayBtn(
            operation3,
            _deviceWidth * Btnwidth,
            _deviceHeight * Btnheight,
            optional == '' ? operationforeColor : optional,
            background,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1), // Adjust margin as needed
          child: _displayBtn(
            operation4,
            _deviceWidth * Btnwidth,
            operation4 == '='
                ? _deviceHeight * 0.23
                : _deviceHeight * Btnheight,
            optional == '' ? Colors.amber : optional,
            operationBackColor,
          ),
        ),
      ],
    );
  }

  Widget _buttonRow2(
      String operation1,
      operation2,
      operation3,
      foreground,
      background,
      operationforeColor,
      operationBackColor,
      optional,
      double Btnheight,
      Btnwidth) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1, vertical: 1), // Adjust margin as needed
          child: _displayBtn(
            operation1,
            _deviceWidth * Btnwidth,
            _deviceHeight * Btnheight,
            foreground,
            background,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1), // Adjust margin as needed
          child: _displayBtn(
            operation2,
            _deviceWidth * Btnwidth,
            _deviceHeight * Btnheight,
            optional == '' ? foreground : optional,
            background,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1), // Adjust margin as needed
          child: _displayBtn(
            operation3,
            _deviceWidth * Btnwidth,
            _deviceHeight * Btnheight,
            optional == '' ? operationforeColor : optional,
            background,
          ),
        ),
      ],
    );
  }

  Widget _answerBtn() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1, vertical: 1), // Adjust margin as needed
          child: _displayBtn(
            '=',
            _deviceWidth * 0.247,
            _deviceHeight * 0.224,
            Colors.white,
            Colors.amber,
          ),
        ),
      ],
    );
  }

  void updateOutput(String newOutput) {
    setState(() {
      output = newOutput;
    });
  }
}
