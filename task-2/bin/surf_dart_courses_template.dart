import 'package:surf_dart_courses_template/surf_dart_courses_template.dart'
    as surf_dart_courses_template;

void main(List<String> arguments) async {
  // инициализация объекта беспроводного телефона
  var cordlessPhone = surf_dart_courses_template.StationaryCordlessPhone(
    manufacturer: 'Panasonic',
    model: 'KX-TGM420W',
    operationalRange: 30.0,
    phoneNumber: '+402130000000',
    isWallMounted: true,
  );

  // инициализация объекта камеры
  var cameraWithFlash = surf_dart_courses_template.CameraWithFlash(12.2);

  // инициализация объекта мобильного телефона
  var mobilePhone = surf_dart_courses_template.MobilePhone.android(
    manufacturer: 'Google',
    model: 'Pixel 5',
    screenSize: 6.0,
    camera: cameraWithFlash,
  );

  // включить камеру у мобильного мелефона
  mobilePhone.camera.turnOn();
  // отключить камеру у мобильного мелефона
  mobilePhone.camera.turnOff();
  // сделать фото
  mobilePhone.camera.takeAPhoto();

  // сделать звонок с мобильного телефона
  cordlessPhone.call();
  // конец звонка
  cordlessPhone.endCall(DateTime.now().add(Duration(seconds: 15)));

  // сделать звонок с беспроводного телефона
  cordlessPhone.call();
  // конец звонка
  cordlessPhone.endCall(DateTime.now().add(Duration(seconds: 40)));

  print('Общая длительность всех звонков: '
      '${surf_dart_courses_template.Phone.totalDurationOfCall}');
}
