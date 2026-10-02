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

class OnlineCinemaPage extends StatelessWidget {
  const OnlineCinemaPage({super.key});

  // Список изображений
  static const List<String> images = [
    'assets/movie1.jpeg',
    'assets/movie2.jpeg',
    'assets/movie3.jpeg',
    'assets/movie4.jpeg',
    'assets/movie5.jpeg',
  ];

  // Онлайн-кинотеатры
  static const List<Map<String, String>> cinemas = [
    {
      'title': 'Кинопоиск',
      'description': 'Фильмы, сериалы и эксклюзивные проекты',
    },
    {
      'title': 'Иви',
      'description': 'Российский онлайн-кинотеатр с большой библиотекой',
    },
    {
      'title': 'Okko',
      'description': 'Фильмы, сериалы, спорт и телевидение',
    },
    {
      'title': 'PREMIER',
      'description': 'Российские сериалы, шоу и фильмы',
    },
  ];

  void showCinemaSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Выбран онлайн-кинотеатр: $title'),
        duration: const Duration(seconds: 2),
      ),
    );
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

            // Название ПО
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

            // Описание ПО
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

            const SizedBox(height: 20),

            // Горизонтальный ListView с изображениями
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,

                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },

                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),

                    child: Image.asset(
                      images[index],
                      width: 150,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Онлайн-кинотеатры',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Вертикальный ListView с карточками
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cinemas.length,

              itemBuilder: (context, index) {
                final cinema = cinemas[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,

                  child: ListTile(
                    // Иконка перед текстом
                    leading: const Icon(
                      Icons.movie_outlined,
                      color: Colors.blueGrey,
                      size: 32,
                    ),

                    // Название
                    title: Text(
                      cinema['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    // Короткое описание
                    subtitle: Text(
                      cinema['description']!,
                    ),

                    // Иконка после текста
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),

                    // Нажатие на карточку
                    onTap: () {
                      showCinemaSnackBar(
                        context,
                        cinema['title']!,
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}