import 'dart:io';

void main() {
  print('== 명언앱 시작 ==');

  final todos = <Todo>[];

  while (true) {
    stdout.write("명령) ");

    final String cmd = stdin.readLineSync()!.trim();

    if (cmd == 'help' || cmd == '?') {
      printHelp();
    } else if (cmd == 'add') {
      stdout.write('내용 : ');
      final String content = stdin.readLineSync()!.trim();
      todos.add(Todo(content));
      print(todos[0]);
    } else if (cmd == 'exit') break;
  }

  print('== 명언앱 끝 ==');
}

class Todo {
  static int _lastId = 0;
  final int id;
  final String content;
  final DateTime createDate;
  DateTime modifyDate;

  get createDateForPrint => createDate.toString().substring(2, 16);

  get modifyDateForPrint => modifyDate.toString().substring(2, 16);

  Todo(this.content, {int? id})
      : id = id ?? _getNextId(),
        createDate = DateTime.now(),
        modifyDate = DateTime.now();

  static int _getNextId() {
    return ++_lastId;
  }

  @override
  String toString() {
    return 'Todo{id: $id, content: $content, createDate: $createDate, modifyDate: $modifyDate}';
  }
}

void printHelp() {
  print('help - 도움말을 표시합니다.');
  print('add - 할 일을 추가합니다.');
  print('exit - 프로그램을 종료합니다.');
}
