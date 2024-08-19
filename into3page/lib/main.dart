import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFF402E7A), // Фон #402E7A
          child: MyPage(),
        ),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<TextEditingController> _codeControllers =
  List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Картинка drizo 2.png
        Positioned(
          top: screenHeight * 0.09, // Позиционируем выше
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Image.asset(
            'images/drizo2.png',
            width: screenWidth * 0.7, // Уменьшенный размер
            height: screenHeight * 0.18, // Уменьшенный размер
            fit: BoxFit.contain,
          ),
        ),

        // Картинка Frame33.png
        Positioned(
          top: screenHeight * 0.26, // Позиционируем чуть выше надписи Ro’yhatdan o’tish
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Image.asset(
            'images/Frame33.png',
            width: screenWidth * 0.1,
            height: screenHeight * 0.1,
            fit: BoxFit.contain,
          ),
        ),

        // Контейнер с текстом Ro’yhatdan o’tish в середине экрана
        Positioned(
          top: screenHeight * 0.35, // Разместить в середине экрана
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.transparent, // Прозрачный фон
            child: Text(
              'Ro’yhatdan o’tish',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 30,
                fontWeight: FontWeight.w800,
                height: 37.8 / 30, // line-height / font-size
                color: Colors.white, // Цвет текста
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // Контейнер с текстом Raqamni tasdiqlash uchun
        // +998 99 888 7777 ga SMS kod yuborildi
        Positioned(
          top: screenHeight * 0.42, // Чуть ниже первой надписи
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.transparent, // Прозрачный фон
            child: Text(
              'Raqamni tasdiqlash uchun\n+998 99 888 7777 ga SMS kod yuborildi',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 28 / 16, // line-height / font-size
                color: Color(0xFF878698), // Цвет текста
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // Прямоугольные объекты для ввода одной цифры
        Positioned(
          top: screenHeight * 0.64, // Смещено на 12% ниже (было 0.52)
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return Container(
                width: screenWidth * 0.12,
                height: screenHeight * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white, // Белый фон прямоугольника
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: TextField(
                    controller: _codeControllers[index],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '', // Убираем счетчик символов
                    ),
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black, // Цвет текста
                    ),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                  ),
                ),
              );
            }),
          ),
        ),

        // Текст SMS qayta yuborish
        Positioned(
          top: screenHeight * 0.74, // Переместил текст ниже на 12%
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Container(
            color: Colors.transparent, // Прозрачный фон
            child: Text(
              'SMS qayta yuborish',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 12, // Исправленный размер шрифта
                fontWeight: FontWeight.w300, // Исправленный вес шрифта
                height: 20.16 / 16, // line-height / font-size
                color: Colors.white, // Цвет текста
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // Кнопка
        Positioned(
          bottom: screenHeight * 0.125  , // Подвинул кнопку ниже (было 0.1)
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.078,
            decoration: BoxDecoration(
              color: Color(0xFFB6BCED), // Фон кнопки
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Tasdiqlash',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  height: 20.16 / 16,
                  color: Colors.white, // Цвет текста кнопки
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
