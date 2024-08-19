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
  final TextEditingController _phoneController = TextEditingController();
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Картинка drizo 2.png
        Positioned(
          top: screenHeight * 0.08, // Позиционируем выше
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Image.asset(
            'images/drizo2.png',
            width: screenWidth * 0.7, // Примерный размер
            height: screenHeight * 0.2, // Примерный размер
            fit: BoxFit.contain,
          ),
        ),

        // Картинка Frame33.png
        Positioned(
          top: screenHeight * 0.26, // Позиционируем чуть выше надписи Ro’yhatdan o’tish
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Image.asset(
            'assets/images/Frame33.png',
            width: screenWidth * 0.1,
            height: screenHeight * 0.1,
            fit: BoxFit.contain,
          ),
        ),

        // Контейнер с текстом Ro’yhatdan o’tish в середине экрана
        Positioned(
          top: screenHeight * 0.36, // Разместить в середине экрана
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

        // Контейнер с текстом Hisobingizni tasdiqlash uchun
        Positioned(
          top: screenHeight * 0.43, // Чуть ниже первой надписи
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.transparent, // Прозрачный фон
            child: Text(
              'Hisobingizni tasdiqlash uchun\ntelefon raqamingizga SMS yuboriladi',
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

        // Контейнер с текстом Telefon raqamingiz
        Positioned(
          top: screenHeight * 0.635, // Над серым объектом
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.transparent, // Прозрачный фон
            child: Text(
              'Telefon raqamingiz',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 20.16 / 16, // line-height / font-size
                color: Colors.white, // Цвет текста
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),

        // Объект для ввода телефона
        Positioned(
          bottom: screenHeight * 0.22,
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.078,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
            decoration: BoxDecoration(
              color: Color(0xFF878698), // Фон объекта
              borderRadius: BorderRadius.circular(50),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: _phoneController,
                onChanged: (text) {
                  setState(() {
                    _isEditing = text.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: _isEditing ? null : '+998 Telefon raqamingizni kiriting',
                  hintStyle: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 20.16 / 16,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  contentPadding: EdgeInsets.only(left: screenWidth * 0.07),
                  isDense: true,
                  alignLabelWithHint: true,
                ),
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white, // Цвет текста
                ),
                cursorColor: Colors.white,
              ),
            ),
          ),
        ),

        // Кнопка
        Positioned(
          bottom: screenHeight * 0.12,
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
                'SMS yuborish',
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
