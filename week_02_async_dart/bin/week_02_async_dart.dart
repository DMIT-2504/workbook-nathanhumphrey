import 'package:week_02_async_dart/week_02_async_dart.dart';

void main(List<String> arguments) async {
  const dogUrl = 'https://dog.ceo/api/breeds/image/random';
  var dogData = await getJson(dogUrl);

  print(dogData['message']);

  const allDogsUrl = 'https://dog.ceo/api/breeds/list/all';
  dogData = await getJson(allDogsUrl);

  print(dogData['message']['bulldog'][0]);
}
