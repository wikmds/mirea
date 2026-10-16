
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'profile_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Список изображений из практической №4
  static const List<String> images = [
    'assets/movie1.jpeg',
    'assets/movie2.jpeg',
    'assets/movie3.jpeg',
    'assets/movie4.jpeg',
    'assets/movie5.jpeg',
  ];

  // Список онлайн-кинотеатров
  static const List<Map<String, String>> cinemas = [
    {
      'title': 'Кинопоиск',
      'description': 'Фильмы, сериалы и эксклюзивные проекты',
    },
    {
      'title': 'Иви',
      'description':
      'Российский онлайн-кинотеатр с большой библиотекой',
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

  // Переход на экран детализации
  void openDetail(Map<String, String> cinema) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          title: cinema['title']!,
          description: cinema['description']!,
          onOpenProfile: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
        ),
      ),
    );
  }

  // Основное содержимое главного экрана
  Widget buildHomeContent() {
    final width = MediaQuery.sizeOf(context).width;

    // При ширине больше 600 используем два столбца
    final isWide = width > 600;

    // Определяем компьютерную или веб-платформу
    final isDesktop = kIsWeb ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux;

    // Вертикальные отступы
    final verticalSpacing = isDesktop ? 30.0 : 16.0;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 40 : 16,
        vertical: verticalSpacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Название приложения
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

          SizedBox(height: verticalSpacing),

          // Описание приложения
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
                  'который предоставляет пользователям доступ '
                  'к фильмам, сериалам и другому видеоконтенту '
                  'через интернет. Просматривать контент можно '
                  'на смартфонах, компьютерах, планшетах '
                  'и других устройствах.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),
          ),

          SizedBox(height: verticalSpacing),

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

          SizedBox(height: verticalSpacing),

          const Text(
            'Онлайн-кинотеатры',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Адаптивное отображение карточек
          isWide
              ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cinemas.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 110,
            ),
            itemBuilder: (context, index) {
              return buildCinemaCard(cinemas[index]);
            },
          )
              : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cinemas.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: buildCinemaCard(cinemas[index]),
              );
            },
          ),

          SizedBox(height: verticalSpacing),

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
    );
  }

  // Карточка онлайн-кинотеатра
  Widget buildCinemaCard(Map<String, String> cinema) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: const Icon(
          Icons.movie_outlined,
          color: Colors.blueGrey,
          size: 32,
        ),
        title: Text(
          cinema['title']!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(cinema['description']!),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: () => openDetail(cinema),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Не показываем стрелку возврата
        automaticallyImplyLeading: false,
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

      // Переключение между главной и профилем
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          buildHomeContent(),
          const ProfilePage(),
        ],
      ),

      // Нижняя панель навигации
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
