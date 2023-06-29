/// Операционные системы, используемые для мобильных устройств.
sealed class OperatingSystem {
  static const String android = 'Android';
  static const String fuchsia = 'Fuchsia';
  static const String ios = 'iOS';
}

/// Интерфейс фонарика
abstract interface class IFlash {
  bool get isFlashOn;
  flashOn();
  flashOff();
}

/// Класс фото камеры
class Camera {
  final double resolution;
  bool _isOn = false;
  bool get isOn => _isOn;

  Camera(this.resolution);

  /// Включить камеру
  void turnOn() {
    _isOn = true;
    print('Camera is on');
  }

  /// Выключить камеру
  void turnOff() {
    _isOn = false;
    print('Camera is off');
  }

  /// Сделать фото
  void takeAPhoto() {
    print('FREEZE! A photo is taken...');
  }
}

/// Класс камеры с фонариком
class CameraWithFlash extends Camera implements IFlash {
  bool _isFlashOn = false;
  @override
  bool get isFlashOn => _isFlashOn;

  CameraWithFlash(super.resolution);

  @override
  void flashOn() {
    _isFlashOn = true;
    print('Flash is on');
  }

  @override
  void flashOff() {
    _isFlashOn = false;
    print('Flash is off');
  }
}

/// Класс телефона
abstract class Phone {
  /// Общая длительность звонка
  static int _totalDurationOfCall = 0;

  /// Момент времени начало звонка
  DateTime? _momentOfBeginningCall;
  final String manufacturer;
  final String model;

  Phone({
    required this.manufacturer,
    required this.model,
  });

  /// Начало звонка
  void call() {
    _momentOfBeginningCall = DateTime.now();
    print('Calling...');
  }

  /// Конец звонка
  void endCall() {
    _totalDurationOfCall +=
        DateTime.now().difference(_momentOfBeginningCall!).inSeconds;
    print('End of call');
  }

  static int get totalDurationOfCall {
    return _totalDurationOfCall;
  }
}

/// Класс мобильного телефона
class MobilePhone extends Phone {
  /// Размер экрана в дюймах
  final double screenSize;

  /// Операционная система
  final String operatingSystem;
  final Camera camera;

  MobilePhone({
    required this.operatingSystem,
    required this.screenSize,
    required this.camera,
    required super.manufacturer,
    required super.model,
  });

  MobilePhone.android({
    required this.screenSize,
    required this.camera,
    required super.manufacturer,
    required super.model,
  }) : operatingSystem = OperatingSystem.android;

  MobilePhone.ios({
    required this.screenSize,
    required this.camera,
    required super.manufacturer,
    required super.model,
  }) : operatingSystem = OperatingSystem.ios;
}

/// Класс стационарного телефона
class StationaryPhone extends Phone {
  /// Уникальный номер телефона, связанный со стационарным телефоном
  String? phoneNumber;

  /// Возможность крепления на стену
  bool isWallMounted;

  StationaryPhone({
    this.phoneNumber,
    this.isWallMounted = false,
    required super.manufacturer,
    required super.model,
  });
}

/// Класс стационарного телефона (проводной)
class StationaryCordedPhone extends StationaryPhone {
  /// Длина провода
  double cordSize;

  StationaryCordedPhone({
    required this.cordSize,
    super.phoneNumber,
    super.isWallMounted,
    required super.manufacturer,
    required super.model,
  });
}

/// Класс стационарного телефона (беспроводной)
class StationaryCordlessPhone extends StationaryPhone {
  /// Рабочий радиус телефона в метрах
  double operationalRange;

  StationaryCordlessPhone({
    required this.operationalRange,
    super.phoneNumber,
    super.isWallMounted,
    required super.manufacturer,
    required super.model,
  });
}
