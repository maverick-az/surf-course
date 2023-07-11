import 'package:surf_dart_courses_template/surf_dart_courses_template.dart'
    as surf_dart_courses_template;

void main(List<String> arguments) {
  final swimmer = surf_dart_courses_template.SwimmerSportPerson(
    name: 'Zach Apple',
    age: 26,
    sex: surf_dart_courses_template.Sex.male,
    competitiveSpirit: 98,
    resilience: 98,
    totalMedals: 11,
  );

  swimmer.printInfo();
}
