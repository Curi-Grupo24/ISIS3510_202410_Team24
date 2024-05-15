// class StorageService {
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();

//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   final TextEditingController _accountNameController =
//       TextEditingController(text: 'flutter_secure_storage_service');

//   IOSOptions _getIOSOptions() => IOSOptions(
//         accountName: _getAccountName(),
//       );

//   AndroidOptions _getAndroidOptions() => const AndroidOptions(
//         encryptedSharedPreferences: true,
//       );

//   String? _getAccountName() =>
//       _accountNameController.text.isEmpty ? null : 
//    _accountNameController.text;

//   Future<void> writeSecureStorage({
//     required String key,
//     required String value,
//   }) async {
//     await _storage.write(
//       key: key,
//       value: value,
//       iOptions: _getIOSOptions(),
//       aOptions: _getAndroidOptions(),
//     );
//   }

//   Future<void> writeSharedPreferences({
//     required String key,
//     required String value,
//   }) async {
//     SharedPreferences prefs = await _prefs;
//     await prefs.setString(
//       key,
//       value,
//     );
//   }

//   Future<String?> readSecureStorage({
//     required String key,
//   }) async =>
//       _storage.read(
//         key: key,
//         iOptions: _getIOSOptions(),
//         aOptions: _getAndroidOptions(),
//       );

//   Future<String?> readSharedPreferences({
//     required String key,
//   }) async {
//     SharedPreferences prefs = await _prefs;
//     return prefs.getString(
//       key,
//     );
//   }

//   Future<void> deleteAllStorage() async {
//     SharedPreferences prefs = await _prefs;
//     await prefs.clear();

//     await _storage.deleteAll(
//         iOptions: _getIOSOptions(), aOptions: _getAndroidOptions(),);
//   }
// }
