import 'package:test/test.dart';
import 'package:authserver/authserver.dart';


/// tests for DefaultApi
void main() {
  final instance = Authserver().getDefaultApi();

  group(DefaultApi, () {
    //Future appControllerCallback() async
    test('test appControllerCallback', () async {
      // TODO
    });

    //Future appControllerIndex() async
    test('test appControllerIndex', () async {
      // TODO
    });

    //Future interactionControllerAbortLogin(String uid) async
    test('test interactionControllerAbortLogin', () async {
      // TODO
    });

    //Future interactionControllerConfirmLogin(String uid) async
    test('test interactionControllerConfirmLogin', () async {
      // TODO
    });

    //Future interactionControllerLogin(String uid) async
    test('test interactionControllerLogin', () async {
      // TODO
    });

    //Future interactionControllerLoginCheck(String uid) async
    test('test interactionControllerLoginCheck', () async {
      // TODO
    });

    //Future ldapControllerDeletion() async
    test('test ldapControllerDeletion', () async {
      // TODO
    });

    //Future ldapControllerRegister(UserDto userDto) async
    test('test ldapControllerRegister', () async {
      // TODO
    });

    //Future ldapControllerUpdate(UserDto userDto) async
    test('test ldapControllerUpdate', () async {
      // TODO
    });

  });
}
