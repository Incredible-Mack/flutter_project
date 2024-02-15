import 'package:flutter/material.dart';

String _output = "";
String _currentNumber = "";
String _operand = "";
bool _operandPressed = false;
String lastCharacter = '';
bool lastCharacterValue = false;
String answer = '';

List<String> tokens = [];
List<String> tokenAnswer = [];
String currentToken = '';

int i = 0;

bool isOperand(String char) {
  return char == '+' || char == '-' || char == '*' || char == '/';
}

void buttonPressed(String buttonText, Function(String) setStateCallback) {
  if (buttonText == 'C') {
    _output = '';
    _operand = "";
    _operandPressed = false;
    setStateCallback('0');
  } else if (buttonText == '+' ||
      buttonText == '-' ||
      buttonText == '/' ||
      buttonText == '*') {
    _operand = buttonText;
    _operandPressed = true;
    _output += buttonText;
    setStateCallback(_output);
  } else if (buttonText == 'del') {
    if (_output.isNotEmpty) {
      _output = _output.substring(0, _output.length - 1);
      tokenAnswer = tokenizeExpression(_output);
      tokens = [];
      setStateCallback(_output);
      print(tokenAnswer);
      print(calculate(tokenAnswer));
    } else {
      setStateCallback('0');
    }
  } else if (buttonText == '=') {
    print(_output);
    tokenAnswer = tokenizeExpression(_output);
    tokens = [];
    setStateCallback(_output);

    print(tokenAnswer);
    print(calculate(tokenAnswer));
  } else {
    _output += buttonText;
    setStateCallback(_output);
  }
}

List<String> tokenizeExpression(String output) {
  for (i = 0; i < _output.length; i++) {
    String char = _output[i];
    if (isOperand(char)) {
      tokens.add(char);
    } else {
      currentToken += char;
      // Check if the next character is an operand or if we have reached the end of the expression
      if (i == _output.length - 1 || isOperand(_output[i + 1])) {
        tokens.add(currentToken);
        currentToken = '';
      }
    }
  }
  return tokens;
}

double calculate(List<String> tokens) {
  double result =
      double.parse(tokens[0]); // Initialize result with the first number

  for (int i = 1; i < tokens.length - 1; i += 2) {
    // Operator is at odd indices, numbers are at even indices
    String operator = tokens[i];
    double nextNumber = double.parse(tokens[i + 1]);

    switch (operator) {
      case '+':
        result += nextNumber;
        break;
      case '-':
        result -= nextNumber;
        break;
      case '*':
        result *= nextNumber;
        break;
      case '/':
        if (nextNumber != 0) {
          result /= nextNumber;
        } else {
          // Handle division by zero error
          print("Error: Division by zero");
          return double.nan;
        }
        break;
      default:
        // Handle unrecognized operator
        print("Error: Unrecognized operator '$operator'");
        return double.nan;
    }
  }

  return result;
}
