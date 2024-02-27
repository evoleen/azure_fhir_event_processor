import 'dart:math';

Duration getRandomDurationInMilliseconds({required int basicMilliseconds}) {
  final int randomValue = basicMilliseconds + Random().nextInt(1000);

  return Duration(milliseconds: randomValue);
}
