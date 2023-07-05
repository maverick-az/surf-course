import 'dart:math';

void main(List<String> arguments) {
  // добавил переменные, чтобы не было ошибок
  final wantToRead = bool.tryParse('true') ?? false;
  String? booksSubject;

  while (true) {
    if (wantToRead) {
      goToThePersonalLibrary();
      chooseABook(booksSubject);
      getComfortable();
      readABook();
    } else {
      continue;
    }
  }
}

void chooseABook(String? booksSubject) {
  var booksInCollection = chooseCollectionByBookSubject(booksSubject);
  var bookForToday = Random().nextInt(booksInCollection);
  for (int i = 0; i < booksInCollection; i++) {
    if (i == bookForToday) {
      print('Good choice!');
    }
  }
}

int chooseCollectionByBookSubject(String? booksSubject) {
  int chosedCollection;
  switch (booksSubject) {
    case 'history':
      chosedCollection = 10;
      print('history');
    case 'humor & Entertainment':
      chosedCollection = 20;
      print('humor & Entertainment');
    case 'computers & technology':
      chosedCollection = 40;
      print('computers & technology');
    case 'self-help':
      chosedCollection = 50;
      print('self-help');
    default:
      chosedCollection = 100;
      print('another subject');
  }
  return chosedCollection;
}

void goToThePersonalLibrary() {}
void readABook() {}
void getComfortable() {}
