import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Онлайн-кинотеатр',
      home: OnlineCinemaPage(),
    );
  }
}

class OnlineCinemaPage extends StatefulWidget {
  const OnlineCinemaPage({super.key});

  @override
  State<OnlineCinemaPage> createState() => _OnlineCinemaPageState();
}

class _OnlineCinemaPageState extends State<OnlineCinemaPage> {
  // Список изображений
  final List<String> images = [
    'assets/movie1.jpeg',
    'assets/movie2.jpeg',
    'assets/movie3.jpeg',
    'assets/movie4.jpeg',
    'assets/movie5.jpeg',
  ];

  // Индекс текущего изображения
  int currentImageIndex = 0;

  // Переход к следующему изображению
  void changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ОНЛАЙН-КИНОТЕАТР',
          style: TextStyle(
            fontFamily: 'RussoOne',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Заголовок
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              child: const Text(
                'Онлайн-кинотеатр',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Описание
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              child: const Text(
                'Онлайн-кинотеатр — это цифровой сервис, '
                    'который предоставляет пользователям доступ к фильмам, '
                    'сериалам и другому видеоконтенту через интернет. '
                    'Просматривать контент можно на смартфонах, компьютерах, '
                    'планшетах и других устройствах.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 280,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // Область изображения
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),

                      // Нажатие на изображение
                      child: GestureDetector(
                        onTap: changeImage,
                        child: Center(
                          child: Image.asset(
                            images[currentImageIndex],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Список онлайн-кинотеатров
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. Кинопоиск',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 14),
                          Text(
                            '2. Иви',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 14),
                          Text(
                            '3. Okko',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 14),
                          Text(
                            '4. PREMIER',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Кнопка смены изображения
            ElevatedButton(
              onPressed: changeImage,
              child: const Text(
                'Следующий фильм',
              ),
            ),

            const SizedBox(height: 16),

            // Информация о студенте
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    size: 36,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    child: const Text(
                      'ФИО: Козубова Арина\n'
                          'Группа: ИКБО-63-23',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}