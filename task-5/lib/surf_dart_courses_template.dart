enum Sex { male, female }

class Person {
  final String name;
  final int age;
  final Sex sex;

  Person({
    required this.name,
    required this.age,
    required this.sex,
  });

  void speak() {
    print('My name is $name');
  }

  void printInfo() {
    print('Name: $name; age: $age; sex: $sex;');
  }
}

class SportPerson extends Person {
  final int competitiveSpirit;
  final int resilience;
  int _totalMedals;
  int get totalMedals => _totalMedals;

  SportPerson({
    required this.competitiveSpirit,
    required this.resilience,
    required super.name,
    required super.age,
    required super.sex,
    int totalMedals = 0,
  }) : _totalMedals = totalMedals;

  void winMedal() {
    _totalMedals++;
    print('$name won a medal!');
  }

  @override
  void printInfo() {
    super.printInfo();
    print('Competitive spirit: $competitiveSpirit; resilience: $resilience;'
        ' won medals: $_totalMedals');
  }
}

abstract interface class Swimmer {
  void swim();
}

class SwimmerSportPerson extends SportPerson implements Swimmer {
  SwimmerSportPerson({
    required super.competitiveSpirit,
    required super.resilience,
    required super.name,
    required super.age,
    required super.sex,
    super.totalMedals = 0,
  });

  @override
  void swim() {
    print('$name is swimming');
  }

  @override
  void printInfo() {
    super.printInfo();
    print('Sport: swimming');
  }
}

abstract interface class Training {
  void train();
  void provideFeedback();
}

class TrainerPerson extends Person implements Training {
  TrainerPerson({
    required super.name,
    required super.age,
    required super.sex,
  });

  @override
  void train() {
    print('$name is training');
  }

  @override
  void provideFeedback() {
    print('$name is providing a feedback');
  }
}
