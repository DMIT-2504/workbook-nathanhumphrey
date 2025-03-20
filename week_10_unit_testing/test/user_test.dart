import 'package:test/test.dart';
import 'package:week_10_unit_testing/models/user.dart';

main() {
  group('User Tests', () {
    late User user;
    const name = 'Jane Doe';
    const email = 'jdoe@example.com';

    setUp(() {
      user = const User(name: name, email: email);
    });

    test('User should have a name', () {
      expect(user.name, name);
    });

    test('User should have an email', () {
      expect(user.email, email);
    });

    test('User toString() returns correct value', () {
      expect(user.toString(), 'name: $name, email: $email');
    });
  });
}
