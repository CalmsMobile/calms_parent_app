import 'package:encrypt/encrypt.dart' as enc;

class CryptoEncryption {
  String secureKey;
  CryptoEncryption(this.secureKey);

//CryptoEncryption(this.secureKey);

  String encryptMyData(String text) {
    print("secureKey = " + this.secureKey);
    print("text = " + text);
    final key = enc.Key.fromUtf8(this.secureKey); //32 chars
    final iv = enc.IV.fromUtf8(this.secureKey); //16 chars
    final e =
        enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'));
    final encryptedData = e.encrypt(text, iv: iv);
    return encryptedData.base64;
  }

  String decryption(String plainText) {
    final key = enc.Key.fromUtf8(this.secureKey); //32 chars
    final iv = enc.IV.fromUtf8(this.secureKey); //16 chars
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
