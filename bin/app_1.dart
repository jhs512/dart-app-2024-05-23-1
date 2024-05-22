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
    } else if (cmd == 'del') {
      stdout.write('삭제할 할 일의 번호 : ');

      final id = int.tryParse(stdin.readLineSync()!.trim()) ?? -1;

      if (id == -1) {
        print('1 이상의 숫자만 입력해 주세요.');
        continue;
      }

      final index = todos.indexWhere((todo) => todo.id == id);

      if (index == -1) {
        print('삭제할 할 일을 찾을 수 없습니다.');
        continue;
      }

      todos.removeAt(index);

      print('$id번 할 일을 삭제했습니다.');
    } else if (cmd == 'list') {
      print('번호 / 작성날짜 / 수정날짜 / 내용');

      for (final todo in todos.reversed) {
        print(
            '${todo.id} / ${todo.createDateForPrint} / ${todo.modifyDateForPrint} / ${todo.content}');
      }
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
  print('list - 할 일 목록을 표시합니다.');
  print('del - 할 일을 삭제합니다.');
  print('exit - 프로그램을 종료합니다.');
}
