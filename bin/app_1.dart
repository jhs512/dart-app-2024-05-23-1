import 'dart:io';

void main() {
  print('== 명언앱 시작 ==');

  stdout.write("명령) ");
  final String cmd = stdin.readLineSync() as String;

  print('입력한 명령어 : $cmd');

  print('== 명언앱 끝 ==');
}
