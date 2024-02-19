import 'package:json_annotation/json_annotation.dart';

mixin AuthError {
  String mapErrorCodeToMessage(String code) {
    final authExceptionCode = FirebaseAuthExceptionCode.fromKebab(code);

    switch (authExceptionCode) {
      case FirebaseAuthExceptionCode.invalidEmail:
        return 'Niepoprawny adres e-mail.';
      case FirebaseAuthExceptionCode.channelError:
        return 'Nie można połączyć się z usługą.\nSpróbuj ponownie później';
      case FirebaseAuthExceptionCode.emailAlreadyInUse:
        return 'Podany adres email jest powiązany z istniejącym kontem.';
      case FirebaseAuthExceptionCode.operationNotAllowed:
        return 'Konto jest nieaktywne. \nSkontaktuj się z administratorem.';
      case FirebaseAuthExceptionCode.weakPassword:
        return 'Hasło jest za słabe. \nHasło powinno zawierać min. 6 znaków, 1 wielką literę, 1 cyfrę.';
      default:
        return 'Błąd połączenia z serwerem.\nSpróbuj ponownie później';
    }
  }
}

enum FirebaseAuthExceptionCode {
  invalidEmail,
  channelError,
  emailAlreadyInUse,
  operationNotAllowed,
  weakPassword,
  unknown;

  const FirebaseAuthExceptionCode();
  static FirebaseAuthExceptionCode fromKebab(String code) {
    final dashCounter = RegExp('-').allMatches(code).length;

    if (dashCounter <= 0) {
      return FirebaseAuthExceptionCode.unknown;
    }

    String transformedCode = code;

    for (int i = 0; i < dashCounter; i++) {
      final index = transformedCode.indexOf('-');
      transformedCode = transformedCode.replaceFirst('-', '').replaceFirst(
            RegExp('[a-z]'),
            transformedCode[index + 1].toUpperCase(),
            index,
          );
    }

    return FirebaseAuthExceptionCode.values.byName(transformedCode);
  }
}
