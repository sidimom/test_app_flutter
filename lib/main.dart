import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return CounterState();
  }

}

class CounterState extends State<MyApp>{

  int colorValue = 0xFF000000;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(colorValue),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              //устанавливаем цвет фона
              colorValue = getColorValue(colorValue);
            });
          },
          child: Text(
            "Hey there",
            style: TextStyle(
              //цвет текста белый по умолчанию
              color: Color(0xFFFFFFFF),
              fontSize: 32.0
            ),
            textDirection: TextDirection.ltr
          ),
        ),
      ),
    );
  }

  //использую линейный конгруэнтный метод
  //для вычисления случайного числа
  int getColorValue(int colorValue) {
    //для вычисления беру секунды и количество миллисекунд с 01.01.1970
    DateTime currentTimeDate = DateTime.now();
    int currentSecond = currentTimeDate.second;
    int currentTimeSinceEpoch = currentTimeDate.millisecondsSinceEpoch;
    int maxColorValue = 0xFFFFFFFF;

    return (currentSecond * colorValue + currentTimeSinceEpoch) % maxColorValue;

  }
}