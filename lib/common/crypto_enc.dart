import 'package:encrypt/encrypt.dart' as enc;

class CryptoEncryption {
  final key = enc.Key.fromUtf8('qweqweqweqweqweq'); //32 chars
  final iv = enc.IV.fromUtf8('qweqweqweqweqweq'); //16 chars

  String encryptMyData(String text) {
    final e =
        enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'));
    final encryptedData = e.encrypt(text, iv: iv);
    return encryptedData.base64;
  }

  String decryption(String plainText) {
    try {
      final encrypter =
          enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'));
      final decrypted =
          encrypter.decrypt(enc.Encrypted.from64(plainText), iv: iv);
      return decrypted;
    } on Exception {
      return ""; // only executed if error is of type Exception
    } catch (error) {
      return ""; // executed for errors of all types other than Exception
    }
  }
}
