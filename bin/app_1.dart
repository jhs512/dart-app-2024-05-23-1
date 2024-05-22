import 'dart:io';

void main() {
  print('== 명언앱 시작 ==');

  while (true) {
    stdout.write("명령) ");

    final String cmd = stdin.readLineSync() as String;

    if (cmd == 'help' || cmd == '?') {
      printHelp();
    } else if (cmd == 'exit') break;
  }

  print('== 명언앱 끝 ==');
}

void printHelp() {
  print('help - 도움말을 표시합니다.');
  print('exit - 프로그램을 종료합니다.');
}
