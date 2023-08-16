import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GestureContainer(),
      ),
    );
  }
}

class GestureContainer extends StatefulWidget {
  const GestureContainer({
    super.key,
  });

  @override
  State<GestureContainer> createState() => _GestureContainerState();
}

class _GestureContainerState extends State<GestureContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  // Ключ виджета для перетаскивания
  final _widgetDraggableKey = GlobalKey();

  // Размер виджета для перетаскивания
  final _draggableWidgetSize = const Size(150, 150);

  // Позиция виджета для перетаскивания по оси x
  late double _posX =
      MediaQuery.of(context).size.width / 2 - _draggableWidgetSize.width / 2;
  // Позиция виджета для перетаскивания по оси y
  late double _posY =
      MediaQuery.of(context).size.height / 2 - _draggableWidgetSize.height;

  // Список цветов фона
  final _backgroundColors = <Color>[
    Colors.blue.shade50,
    Colors.blue.shade100,
    Colors.blue.shade200,
    Colors.blue.shade300,
  ];

  late Color _currentBackgroundColor;

  @override
  void initState() {
    super.initState();
    // Инициализация контроллера для анимации
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    // Инициализация анимации
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );
    // Исходный цвет фона
    _currentBackgroundColor = _backgroundColors[0];
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _changeBackgroundColor() {
    int currentIndex = _backgroundColors.indexOf(_currentBackgroundColor);
    if (currentIndex < _backgroundColors.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }

    setState(() {
      _currentBackgroundColor = _backgroundColors[currentIndex];
    });
  }

  void _changePositionOnScreen(DragUpdateDetails details) {
    final renderDraggableObj =
        _widgetDraggableKey.currentContext?.findRenderObject() as RenderBox;

    final sizeDraggableObj = renderDraggableObj.size;
    final sizeScreen = MediaQuery.of(context).size;

    // Высота системного нижнего меню
    late double sysBottomNavHeight = MediaQuery.of(context).padding.top;

    // Изменение позиции по оси x с контролем границ области для перетаскивания
    if (_posX + details.delta.dx < 0) {
      _posX = 0;
    } else if (_posX + sizeDraggableObj.width + details.delta.dx >
        sizeScreen.width) {
      _posX = sizeScreen.width - sizeDraggableObj.width;
    } else {
      _posX += details.delta.dx;
    }

    // Изменение позиции по оси y с контролем границ области для перетаскивания
    if (_posY + details.delta.dy < 0) {
      _posY = 0;
    } else if (_posY +
            sizeDraggableObj.height +
            details.delta.dy +
            sysBottomNavHeight >
        sizeScreen.height) {
      _posY = sizeScreen.height - sizeDraggableObj.height - sysBottomNavHeight;
    } else {
      _posY += details.delta.dy;
    }

    setState(() {});
  }

  void _animateRotationTransition() {
    if (!_animationController.isAnimating) {
      _animationController.forward(from: 0);
    }
  }

  void _resetRotationTransition() {
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            color: _currentBackgroundColor,
          ),
          Positioned(
            left: _posX,
            top: _posY,
            key: _widgetDraggableKey,
            child: RotationTransition(
              turns: _animation,
              child: Container(
                width: _draggableWidgetSize.width,
                height: _draggableWidgetSize.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/81352867?v=4'),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _animateRotationTransition();
              },
              onLongPress: () {
                _resetRotationTransition();
                _changeBackgroundColor();
              },
              onPanUpdate: (details) {
                _resetRotationTransition();
                _changePositionOnScreen(details);
              },
            ),
          ),
        ],
      ),
    );
  }
}
