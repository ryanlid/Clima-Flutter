import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  print('task 1 complete');
}

Future task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('task 3 complete $task2Data');
}
