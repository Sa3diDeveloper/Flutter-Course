import 'dart:convert';
import 'dart:io';

void main() async {
  int index = int.parse(stdin.readLineSync()!);
  var data = await fetchdata(index);

  for (var i = 0; i < 100; i++) {
    print(data[i]["quote"]);

    print('------------------');
  }
}

Future fetchdata(int index) async {
  List dat = [
    'E:/Qouets Project App/Recourses/quotes-master/Age.json',
    'E:/Qouets Project App/Recourses/quotes-master/Anger.json',
    'E:/Qouets Project App/Recourses/quotes-master/Art.json',
  ];
  String filePath = dat[index];
  File file = await File(filePath);
  String jsonString = await file.readAsString();
  final data = json.decode(jsonString);
  return data;
}
